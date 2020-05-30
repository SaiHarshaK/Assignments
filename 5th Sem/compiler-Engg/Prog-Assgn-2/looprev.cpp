#define DEBUG_TYPE "loop-reversal"
#include "llvm/Pass.h"
#include "llvm/ADT/DepthFirstIterator.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/NoFolder.h"
#include "llvm/ADT/iterator_range.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/IR/SymbolTableListTraits.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/IR/Use.h"
#include "llvm/IR/Value.h"
#include <iterator>
#include <string>
#include <sstream>
#include <utility>

using namespace llvm;
using namespace std;

static cl::opt<std::string> varName("var-name", cl::desc("Variable name: "), cl::value_desc("name"));

namespace {
  struct varData {
    Value* valptr;
    vector<int> lines;
    int reads = 0;
    int writes = 0;
  };

  struct looprev : public FunctionPass {
    static char ID;
    bool passInfo = false;
    looprev() : FunctionPass(ID) {}

    void getAnalysisUsage(AnalysisUsage &AU) const {
      // AU.addRequired<AAResultsWrapperPass>();
      AU.addRequired<LoopInfoWrapperPass>();
      AU.addRequired<ScalarEvolutionWrapperPass>();
      AU.setPreservesAll();
    }

    bool runOnFunction(Function &F) {
      LoopInfo *LI = &getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
      int int_val, bound_val, step_val;
      int final_int, final_bound, final_step;
      Instruction *build_inst, *build_latch, *build_body_inst;
      BasicBlock *bb_start, *bb_update;
      PHINode *orig_ind;
      CmpInst::Predicate pred;
      const char* op;
      for (auto TL : *LI) {
          // TL->dump();
          auto Head = TL->getHeader();
          BasicBlock::iterator it;
          // find required values from header.
          for(it = Head->begin(); it != Head->end(); it++) {
            if (isa<CmpInst>(*it)) {
              build_inst = &(*it);
              pred = cast<CmpInst>(it)->getPredicate();
              // it->dump();
              auto ind = it->getOperand(0);
              orig_ind = cast<PHINode>(ind);
              auto bound = it->getOperand(1);
              // ind->dump();
              // bound->dump();
              // get initial value
              unsigned int incv = cast<PHINode>(ind)->getNumIncomingValues();
              bb_start = cast<PHINode>(ind)->getIncomingBlock(0);
              bb_update = cast<PHINode>(ind)->getIncomingBlock(1);
              for(unsigned int i = 0; i < incv; i++) {
                if(auto val = dyn_cast<ConstantInt>(cast<PHINode>(ind)->getIncomingValue(i)))
                  int_val = val->getSExtValue();
              }
              // errs()<<int_val<<" iv\n";
              // get bound value
              if(isa<ConstantInt>(bound)) {
                bound_val = cast<ConstantInt>(bound)->getSExtValue();
                // errs()<<bound_val<<" bv\n";
              }
              // errs()<<bound_val<<"\n";
            } else if(isa<BranchInst>(*it)) {
              build_body_inst = &(*(cast<BasicBlock>(it->getOperand(2))->begin()));
            }
          }
          // find required values from latch.
          auto Latch = TL->getLoopLatch();
          for(it = Latch->begin(); it != Latch->end(); it++) {
            if(!it->getOpcodeName()) continue;
            const char* check_op = it->getOpcodeName();
            if(strcmp(check_op, "add") == 0) {
              op = it->getOpcodeName();
              build_latch = &(*it);
              step_val = (dyn_cast<ConstantInt>(it->getOperand(1)))->getSExtValue();
              // errs() <<step_val<<" c\n";
              if (pred == CmpInst::Predicate::ICMP_SLT) {
                bound_val--;
              } else if (pred == CmpInst::Predicate::ICMP_SGT) {
                bound_val++;
              }
              int iter = (bound_val - int_val) / step_val;
              final_int = int_val + iter * step_val;
              final_bound = int_val;
              final_step = step_val;
            } else if(strcmp(check_op, "sub") == 0) {
              op = it->getOpcodeName();
              build_latch = &(*it);
              step_val = (dyn_cast<ConstantInt>(it->getOperand(1)))->getSExtValue();
              // errs() <<step_val<<" c\n";
              if (pred == CmpInst::Predicate::ICMP_SLT) {
                bound_val--;
              } else if (pred == CmpInst::Predicate::ICMP_SGT) {
                bound_val++;
              }
              int iter = (bound_val - int_val) / (-step_val);
              final_int = int_val + iter * (-step_val);
              final_bound = int_val;
              final_step = step_val;
            } else if(strcmp(check_op, "mul") == 0) {
              op = it->getOpcodeName();
              build_latch = &(*it);
              step_val = (dyn_cast<ConstantInt>(it->getOperand(1)))->getSExtValue();
              // errs() <<step_val<<" c\n";
              // le
              int iter = log10((double)bound_val / int_val) / log10((double)step_val);
              if (pred == CmpInst::Predicate::ICMP_SLT) {
                iter = ceil(log10((double)bound_val / int_val) / log10((double)step_val)) - 1;
              } else if (pred == CmpInst::Predicate::ICMP_SGT) { // negative
                iter = ceil(log10((double)bound_val / int_val) / log10((double)step_val)) - 1;
              } else if (pred == CmpInst::Predicate::ICMP_SGE) { // negative
                iter = log10((double)bound_val / int_val) / log10((double)step_val);
              }
              final_int = int_val * (pow(step_val, iter));
              final_bound = int_val;
              final_step = step_val;
            } else if(strcmp(check_op, "sdiv") == 0) {
              op = it->getOpcodeName();
              build_latch = &(*it);
              step_val = (dyn_cast<ConstantInt>(it->getOperand(1)))->getSExtValue();
              // errs() <<step_val<<" c\n";
              // ge
              int iter = log10((double)int_val / bound_val) / log10((double)step_val);
              final_int = int_val / (pow(step_val, iter));
              if (final_int < bound_val)
                final_int *= step_val;
              if (pred == CmpInst::Predicate::ICMP_SLT) { //negative
                iter = ceil(log10((double)int_val / bound_val) / log10((double)step_val)) - 1;
                final_int = int_val / (pow(step_val, iter));
                if (final_int >= bound_val)
                  final_int *= step_val;
              } else if (pred == CmpInst::Predicate::ICMP_SLE) { //negative
                iter = log10((double)int_val / bound_val) / log10((double)step_val);
                final_int = int_val / (pow(step_val, iter));
                if (final_int > bound_val)
                  final_int *= step_val;
              } else if (pred == CmpInst::Predicate::ICMP_SGT) {
                iter = ceil(log10((double)int_val / bound_val) / log10((double)step_val)) - 1;
                final_int = int_val / (pow(step_val, iter));
                if (final_int <= bound_val)
                  final_int *= step_val;
              }
              final_bound = int_val;
              final_step = step_val;
            }
          }

          // errs() << final_int << " " << final_bound << " " << final_step << "\n";

          // assign necessary predicate
          cast<CmpInst>(build_inst)->setPredicate(CmpInst::Predicate::ICMP_SGE);
          if (pred == CmpInst::Predicate::ICMP_SGE || pred == CmpInst::Predicate::ICMP_SGT) {
            cast<CmpInst>(build_inst)->setPredicate(CmpInst::Predicate::ICMP_SLE);
          }

          // transformation starts here. we replace the old values of loop with newly calculated ones.
          LLVMContext &Context = F.getContext();
          Type* int32 = Type::getInt32Ty(Context);
          IRBuilder<NoFolder> builder_header(build_inst);
          IRBuilder<NoFolder> builder_body(build_body_inst);
          Value* final_int_wrapper = ConstantInt::get(int32, final_int);
          Value* final_bound_wrapper = ConstantInt::get(int32, final_bound);
          build_inst->setOperand(1, final_bound_wrapper);
          PHINode* final_ind = builder_header.CreatePHI(int32, 2, "");
          final_ind->addIncoming(final_int_wrapper, bb_start);
          // construct value accordingly.
          Value *intermediate_val, *final_val;
          if(strcmp(op, "add") == 0) {
            intermediate_val = builder_header.CreateAdd(final_int_wrapper, final_bound_wrapper, "");
            final_val = builder_header.CreateSub(intermediate_val, final_ind, "");
          } else if(strcmp(op, "sub") == 0) {
            intermediate_val = builder_header.CreateAdd(final_int_wrapper, final_bound_wrapper, "");
            final_val = builder_header.CreateSub(intermediate_val, final_ind, "");
          } else if(strcmp(op, "mul") == 0) {
            intermediate_val = builder_body.CreateSDiv(final_int_wrapper, final_ind, "");
            final_val = builder_body.CreateMul(intermediate_val, final_bound_wrapper, "");
          } else if(strcmp(op, "sdiv") == 0) {
            intermediate_val = builder_body.CreateMul(final_int_wrapper, final_bound_wrapper, "");
            final_val = builder_body.CreateSDiv(intermediate_val, final_ind, "");
          }

          // orig_ind->dump();
          // errs()<<op<<" orif done\n"<<"\n";
          // final_val->dump();
          orig_ind->replaceAllUsesWith(final_val);
          orig_ind->eraseFromParent();
          build_inst->setOperand(0, final_ind);
          IRBuilder<NoFolder> builder_latch(build_latch);
          Value* final_step_wrapper = ConstantInt::get(int32, final_step);
          // do accordingly
          if(strcmp(op, "add") == 0) {
            final_val = builder_latch.CreateSub(final_ind, final_step_wrapper, "");
          } else if(strcmp(op, "sub") == 0) {
            final_val = builder_latch.CreateAdd(final_ind, final_step_wrapper, "");
          } else if(strcmp(op, "mul") == 0) {
            final_val = builder_latch.CreateSDiv(final_ind, final_step_wrapper, "");
          } else if(strcmp(op, "sdiv") == 0) {
            final_val = builder_latch.CreateMul(final_ind, final_step_wrapper, "");
          }
          final_ind->addIncoming(final_val, bb_update);
          build_latch->eraseFromParent();
          // build_latch->dump();
      }

      return false;
    }
  };
}

char looprev::ID = 0;
static RegisterPass<looprev> X("loop-reversal", "Loop reversal");

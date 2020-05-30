#define DEBUG_TYPE "footprint"
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;`

namespace {
  struct footprint : public FunctionPass {
    static char ID;
    footprint() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) {
      // std::map<std::string, int> instCounter;
      errs() << "Function: " << F.getName() << "\n";
      for(BasicBlock &BB : F) {
        for (Instruction &I : BB) {
          // if (instCounter.find(I.getOpcodeName()) == instCounter.end())
          // instCounter[I.getOpcodeName()] = 1;
          // else
          errs() << I->getName() <<"\n";
          // instCounter[I.getOpcodeName()] += 1;
          if (DILocation *Loc = I->getDebugLoc()) { // Here I is an LLVM instruction
            unsigned Line = Loc->getLine();
            StringRef Name = Loc->getName();
            bool ImplicitCode = Loc->isImplicitCode();
          }
        }
      }
      errs() << "\n";
      return false;
    }
  };
}

char enumerateFunctions::ID = 0;
static RegisterPass<enumerateFunctions> X("footprint", "footprint of all varibles");

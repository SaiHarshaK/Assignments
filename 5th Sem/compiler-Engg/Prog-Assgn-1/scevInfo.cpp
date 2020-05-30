#define DEBUG_TYPE "scevInfo"
#include "llvm/Pass.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpander.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/Support/raw_ostream.h"
#include <vector>

using namespace llvm;

namespace {
	struct scevInfo : public FunctionPass {
		static char ID;
		scevInfo() : FunctionPass(ID) {}
		
		void getAnalysisUsage (AnalysisUsage &AU) const {
			AU.addRequired<ScalarEvolutionWrapperPass>();
			AU.setPreservesAll();
		}

		bool runOnFunction(Function &F) {
			// auto a = new PassManager();
			errs() << "Function: " <<F.getName() << "\n";
			auto  *SE = &getAnalysis<ScalarEvolutionWrapperPass>().getSE();
			for(auto i=F.begin(), e=F.end(); i!=e; i++) {
				for(auto j=i->begin(), k=i->end();j!=k;j++) {
					if(SE->isSCEVable(j->getType()))
						errs() << j->getOpcodeName() << "\n";
				}
			}
			return false;
		}
	};
}


char scevInfo::ID = 0;
static RegisterPass<scevInfo> X("scevInfo", "Get some information about scev of expressions.");

#define DEBUG_TYPE "functionEnumerator"
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
	struct enumerateFunctions : public FunctionPass {
		static char ID;
		enumerateFunctions() : FunctionPass(ID) {}
		bool runOnFunction(Function &F) {
			errs() << "Function: " << F.getName() << "\n";
			return false;
		}
	};
}

char enumerateFunctions::ID = 0;
static RegisterPass<enumerateFunctions> X("enumerateFunctions", "Enumerates all the functions");

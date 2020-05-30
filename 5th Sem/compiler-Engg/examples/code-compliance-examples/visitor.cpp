#include "clang/AST/ASTConsumer.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/Tooling/CommonOptionsParser.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/FrontendAction.h"
#include "clang/Tooling/Tooling.h"

using namespace clang;
using namespace clang::tooling;

static llvm::cl::OptionCategory MyToolCategory("my-tool options");

// CommonOptionsParser declares HelpMessage with a description of the common
// command-line options related to the compilation database and input files.
// It's nice to have this help message in all tools.
static llvm::cl::extrahelp
    CommonHelp(CommonOptionsParser::HelpMessage); // NOLINT

class FindNamedClassVisitor
  : public RecursiveASTVisitor<FindNamedClassVisitor> {
public:
  explicit FindNamedClassVisitor(ASTContext *Context)
    : Context(Context) {}

  // ==========MODIFY THIS==========
  // Override valid function like VisitSwitchStmt, VisitIfStmt etc.
  bool VisitCXXRecordDecl(CXXRecordDecl *Declaration) {
  	if (Context->getSourceManager().isInMainFile(Declaration->getBeginLoc())) {
	    FullSourceLoc FullLocation = Context->getFullLoc(Declaration->getBeginLoc());
	    if (FullLocation.isValid())
	      llvm::outs() << "Found declaration at "
	                   << FullLocation.getSpellingLineNumber() << ":"
	                   << FullLocation.getSpellingColumnNumber() << "\n";
    }
    return true;
  }
  //================================

private:
  ASTContext *Context;
};

class FindNamedClassConsumer : public clang::ASTConsumer {
public:
  explicit FindNamedClassConsumer(ASTContext *Context)
    : Visitor(Context) {}

  virtual void HandleTranslationUnit(clang::ASTContext &Context) {

  	// ==========MODIFY THIS==========
  	// Call valid traversals - check documentation for this
    Visitor.TraverseDecl(Context.getTranslationUnitDecl());
    // ===============================
  }
private:
  FindNamedClassVisitor Visitor;
};

class FindNamedClassAction : public clang::ASTFrontendAction {
public:
  virtual std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(
    clang::CompilerInstance &Compiler, llvm::StringRef InFile) {
    return std::unique_ptr<clang::ASTConsumer>(
        new FindNamedClassConsumer(&Compiler.getASTContext()));
  }
};

int main(int argc, const char **argv) {
  CommonOptionsParser OptionsParser(argc, argv, MyToolCategory);

  ClangTool Tool(OptionsParser.getCompilations(),
                 OptionsParser.getSourcePathList());

  auto x =
      Tool.run(newFrontendActionFactory<FindNamedClassAction>().get());
  return x;
}
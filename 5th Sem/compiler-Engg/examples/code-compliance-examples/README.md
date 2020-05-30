# Build

```
sudo apt install clang-8 cmake libclang-8-dev clang-tidy-8 #This is pre-installed in the allotted systems
mkdir build && cd build # Only `cd build` after first time
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
make
```

# Run

```
./<executable_name> <test_file>
./visitor test.cpp
```

# How to run your code

First off, one can choose to write a matcher or a visitor. Matchers are relatively new and easier. The process to run is the same.

In CMakeLists.txt, find the lines

```
add_executable(visitor visitor.cpp)
target_include_directories(visitor PRIVATE ${CLANG_INCLUDE_DIRS} ${PROJECT_SOURCE_DIR})
target_link_libraries(visitor ${CLANG_EXPORTED_TARGETS})
```
Here, change the filename(`visitor.cpp`) - to your checker name and run `./visitor test.cpp` to check if it works
Same is the case with matchers.

Change the classnames and method names appropriately. Comment your code and look for `MODIFY THIS` in the code.

While using visitor, we override methods from `RecursiveASTVisitor`. I could not find the entire list of the functions online - the Doxygen documentation does not have all of them. Here is a way to know which function to override, but if someone finds a list online, this point may be altered in the future.
The methods in [RecursiveASTVisitor.h are written using #include pragmas](https://code.woboq.org/llvm/clang/include/clang/AST/RecursiveASTVisitor.h.html#372) (this is because they are generated using tablegen) and hence they don’t appear in the documentation. These occurrences can be seen throughout the file (and possibly other clang files) - So, to find which one to use, check those include files [like this one](https://code.woboq.org/llvm/include/clang/AST/StmtNodes.inc.html).
For example, for visiting the while statements, we override the function [VisitWhileStmt(WhileStmt)](https://code.woboq.org/llvm/include/clang/AST/StmtNodes.inc.html#1281).

Check [tutorial](https://clang.llvm.org/docs/LibASTMatchersTutorial.html)

In case of any errors, please mention in the classroom

# Submission
Submit a zipped file with your modified `visitor.cpp`/`matcher.cpp` and `CMakeLists.txt`. Submit any addtional files you create.
Zipped file should specify the name of the checker in the following format: standard-rule_num-name.zip (Eg: compass-7.8-bufferOverflow.zip) 
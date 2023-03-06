g++ src/main.cpp src/lowlevel.cpp

vs
1) BUILD: comment line 17, then
2) bazel build main

Conclusion: 
bazel build targets in unique build folder. Only declared files from `deps` and `data` attributes are 
copyied there. This approach excludes implicit building dependencies.
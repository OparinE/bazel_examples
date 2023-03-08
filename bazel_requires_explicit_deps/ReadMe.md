This project can be built by 3 options:
- bazel
  * `bazel build main`
  * then BUILD file: comment line 17
  * run `bazel build main` again
- cmake
  * mkdir ../tmp
  * cd ../tmp
  * cmake ../diff_with_naked_toolchain
  * make
- g++ command line
  * `g++ src/main.cpp src/lowlevel.cpp`


Conclusion:

bazel build targets in unique build folder.

Only declared files from `deps` and `data` attributes are copyied there.

This approach excludes implicit building dependencies and pushes developers to declare all deps
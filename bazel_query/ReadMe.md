# Usefull bazel query commands

- List all targets in a package

  `bazel query <path to package>`
  * `bazel query //libs/...`
  * `bazel query //srcs/...`

- Show deps graph

  `bazel query "somepath(<start>, <end>)" --notool_deps --output graph | dot -Tsvg > /tmp/deps.svg`
  * `bazel query "allpaths(//srcs:main, //libs:base)" --notool_deps --output graph | dot -Tsvg > /tmp/deps.svg`

  *Notes*: may needed
  
  'sudo apt install graphiz', 'sudo apt install imagemagick-6.q16'
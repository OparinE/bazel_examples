# This example contains 

- how to generate cc source code using Bazel only

- how to generate cc test using Bazel only

- how to delegate reponsibilities:

  Message developer provides an ability to add new basic data types independently.

  Data types validity is controlled by automatic self-generated tests. There are two types of tests:

  * Method implementation check

  * Default constructor check

# How to run:

1. cd <workspace folder>

2. bazel test ...

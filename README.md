# bazel-java-deps-showcase

Project to reproduce transitive dependencies use case with [rules_jvm_external](https://github.com/bazelbuild/rules_jvm_external)

To reproduce:

```shell script
git clone git@github.com:slamdev/bazel-java-deps-showcase.git
cd bazel-java-deps-showcase
./baseliskw build //:lib
```

[CI pipeline](https://github.com/slamdev/bazel-java-deps-showcase/actions/workflows/build.yaml) that runs the code
with different OS, bazel and java versions.

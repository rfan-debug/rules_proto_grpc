"""Common dependencies for rules_proto_grpc Scala rules."""

load(
    "//:repositories.bzl",
    "GRPC_VERSION",
    "io_bazel_rules_scala",
    "io_grpc_grpc_java",
    "rules_jvm_external",
    "rules_proto_grpc_repos",
)

def scala_repos(**kwargs):  # buildifier: disable=function-docstring
    rules_proto_grpc_repos(**kwargs)
    io_grpc_grpc_java(**kwargs)
    rules_jvm_external(**kwargs)
    io_bazel_rules_scala(**kwargs)

MAVEN_ARTIFACTS = [
    "io.grpc:grpc-all:{}".format(GRPC_VERSION),
    "com.thesamet.scalapb:compilerplugin_2.13:0.11.10",
    "com.thesamet.scalapb:scalapb-runtime_2.13:0.11.10",
    "com.thesamet.scalapb:scalapb-runtime-grpc_2.13:0.11.10",
]

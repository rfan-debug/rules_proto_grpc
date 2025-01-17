"""Generated definition of scala_grpc_library."""

load("//scala:scala_grpc_compile.bzl", "scala_grpc_compile")
load("//internal:compile.bzl", "proto_compile_attrs")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library")

def scala_grpc_library(name, **kwargs):  # buildifier: disable=function-docstring
    # Compile protos
    name_pb = name + "_pb"
    scala_grpc_compile(
        name = name_pb,
        **{
            k: v
            for (k, v) in kwargs.items()
            if k in proto_compile_attrs.keys()
        }  # Forward args
    )

    # Create scala library
    scala_library(
        name = name,
        srcs = [name_pb],
        deps = GRPC_DEPS + kwargs.get("deps", []),
        exports = GRPC_DEPS + kwargs.get("exports", []),
        visibility = kwargs.get("visibility"),
        tags = kwargs.get("tags"),
    )

GRPC_DEPS = [
    "@rules_proto_grpc_scala_maven//:io_grpc_grpc_api",
    "@rules_proto_grpc_scala_maven//:io_grpc_grpc_netty",
    "@rules_proto_grpc_scala_maven//:io_grpc_grpc_protobuf",
    "@rules_proto_grpc_scala_maven//:io_grpc_grpc_stub",
    "@rules_proto_grpc_scala_maven//:com_google_protobuf_protobuf_java",
    "@rules_proto_grpc_scala_maven//:com_thesamet_scalapb_lenses_2_13",
    "@rules_proto_grpc_scala_maven//:com_thesamet_scalapb_scalapb_runtime_grpc_2_13",
    "@rules_proto_grpc_scala_maven//:com_thesamet_scalapb_scalapb_runtime_2_13",
]

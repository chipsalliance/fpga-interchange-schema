# Copyright 2020-2021 Xilinx, Inc. and Google, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

@0x9d262c6ba6512325;
using Java = import "/capnp/java.capnp";
using Ref = import "References.capnp";
$Java.package("com.xilinx.rapidwright.interchange");
$Java.outerClassname("DedupWiresNodes");

using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("DedupWiresNodes");

struct StringRef {
    type  @0 :Ref.ReferenceType = rootValue;
    field @1 :Text = "strList";
}
annotation stringRef(*) :StringRef;
using StringIdx = UInt32;

struct NodeShapeRef {
    type  @0 :Ref.ReferenceType = parent;
    field @1 :Text = "nodeShapes";
    depth @2 :Int32 = 1;
}
annotation nodeShapeRef(*) :NodeShapeRef;
using NodeShapeIdx = UInt32;

# This structure describes a deduplicated wire-node mapping, as an interim step between a flat graph and a fully folded graph.
# It requires a full list of nodes in the device and their "shape", but not a full list of wires within those nodes as nodes
# with the same "shape", using relative coordinates, only have their list of constituent wires stored once.
struct DedupWiresNodes {
  nodes           @0 : List(Node);
  nodeShapes      @1 : List(NodeShape);

  struct Node {
    rootTile  @0 : StringIdx $stringRef();
    shape     @1 : NodeShapeIdx $nodeShapeRef();
  }

  struct NodeWire {
    dx    @0 : Int16; # wire.x = rootTile.x + dx
    dy    @1 : Int16; # wire.y = rootTile.y + dy
    wire  @2 : StringIdx $stringRef();
  }

  struct NodeShape {
    wires @0 : List(NodeWire);
  }

}

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
$Java.outerClassname("FlatWiresNodes");

using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("FlatWiresNodes");

struct StringRef {
    type  @0 :Ref.ReferenceType = rootValue;
    field @1 :Text = "strList";
}
annotation stringRef(*) :StringRef;
using StringIdx = UInt32;

struct WireRef {
    type  @0 :Ref.ReferenceType = parent;
    field @1 :Text = "wires";
    depth @2 :Int32 = 1;
}
annotation wireRef(*) :WireRef;
using WireIdx = UInt32;

# This structure describes a flat wire-node mapping with no folding or deduplication
struct FlatWiresNodes {
  wires           @0 : List(Wire);
  nodes           @1 : List(Node);

  struct Wire {
    tile      @0 : StringIdx $stringRef();
    wire      @1 : StringIdx $stringRef();
  }

  struct Node {
    wires    @0 : List(WireIdx) $wireRef();
  }

}

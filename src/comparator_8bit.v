`timescale 1ns / 1ps
// Copyright 2018 Schuyler Eldridge
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module comparator_8bit(A,B,l,e,g,lt,eq,gt);
input [7:0] A;
input [7:0] B;
input l;
input e;
input g;
output lt;
output eq;
output gt;
wire lt_wires[0:1];
wire eq_wires[0:1];
wire gt_wires[0:1];
comparator_3bit c1(A[2:0],B[2:0],l,e,g,lt_wires[0],eq_wires[0],gt_wires[0]);
comparator_3bit c2(A[5:3],B[5:3],lt_wires[0],eq_wires[0],gt_wires[0],lt_wires[1],eq_wires[1],gt_wires[1]);
comparator_3bit c3({1'b0, A[7:6]},{1'b0, B[7:6]},lt_wires[1],eq_wires[1],gt_wires[1],lt,eq,gt);



endmodule

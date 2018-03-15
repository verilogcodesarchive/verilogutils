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

module comparator_3bit(A,B,l,e,g,lt,eq,gt);
input[2:0] A;
input[2:0] B;
input l;
input e;
input g;
output lt;
output eq;
output gt;
wire [0:2] xors;
wire [0:2] A_nots;
wire [0:2] B_nots;
wire [0:2] gt_ands;
wire [0:2] lt_ands;
//equal
xor x1(xors[0],A[2],B[2]);
xor x2(xors[1],A[1],B[1]);
xor x3(xors[2],A[0],B[0]);
and a1(eq,xors[0],xors[1],xors[2],e);
//gt
not n1(B_nots[0],B[0]);
not n2(B_nots[1],B[1]);
not n3(B_nots[2],B[2]);
and a2(gt_ands[0],A[2],B_nots[2]);
and a3(gt_ands[1],A[1],B_nots[1],xors[0]);
and a4(gt_ands[2],A[0],B_nots[0],xors[1],xors[1]);
wire greater;
or o1(greater,gt_ands[0],gt_ands[1],gt_ands[2]);
wire res1;
and a5(res1,eq,g);
or o2(gt,greater,res1);
//lt
not n4(A_nots[0],A[0]);
not n5(A_nots[1],A[1]);
not n6(A_nots[2],A[2]);
and a6(lt_ands[0],A_nots[2],B[2]);
and a7(lt_ands[1],A_nots[1],B[1],xors[0]);
and a8(lt_ands[2],A_nots[0],B[0],xors[1]);
wire less;
or o3(less,lt_ands[0],lt_ands[1],lt_ands[2]);
wire res2;
and a9(res2,e1,l);
or o4(lt,less,res2);
endmodule

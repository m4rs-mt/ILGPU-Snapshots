; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: TwoLambdasCrossBlockKernel  [intptr: i64]

define void @TwoLambdasCrossBlockKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = getelementptr i32, ptr %p2, i32 %p0
  %1 = icmp sgt i32 %p1, 0
  %2 = select i1 %1, i32 %p0, i32 0
  %3 = add i32 %2, 1
  %4 = icmp sgt i32 %p1, 0
  %5 = select i1 %4, i32 %p0, i32 1
  %6 = shl i32 %5, 1
  %7 = add i32 %3, %6
  store i32 %7, ptr %0
  ret void

}


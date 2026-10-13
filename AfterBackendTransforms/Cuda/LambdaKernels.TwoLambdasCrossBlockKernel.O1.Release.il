; stage: AfterBackendTransforms  backend: Cuda  opt: O1
; module: TwoLambdasCrossBlockKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @TwoLambdasCrossBlockKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = icmp sgt i32 %p2, 0
  %3 = select i1 %2, i32 %p0, i32 0
  %4 = add i32 %3, 1
  %5 = icmp sle i32 %p2, 0
  %6 = or i1 %5, %2
  %7 = icmp sgt i32 %p2, 0
  %8 = and i1 %6, %7
  %9 = select i1 %8, i32 %p0, i32 1
  %10 = shl i32 %9, 1
  %11 = add i32 %4, %10
  store i32 %11, ptr %1
  ret void

}


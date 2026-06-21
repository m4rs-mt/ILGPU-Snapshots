; stage: AfterGlobalOpt  opt: O2
; module: TwoLambdasCrossBlockKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @TwoLambdasCrossBlockKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = icmp sgt i32 %p2, 0
  %3 = select i1 %2, i32 %p0, i32 0
  %4 = add i32 %3, 1
  %5 = icmp sgt i32 %p2, 0
  %6 = select i1 %5, i32 %p0, i32 1
  %7 = shl i32 %6, 1
  %8 = add i32 %4, %7
  store i32 %8, ptr %1
  ret void

}


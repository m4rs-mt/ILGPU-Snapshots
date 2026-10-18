; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: TwoLambdasCrossBlockKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @TwoLambdasCrossBlockKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = icmp sgt i32 %p2, 0
  %1 = icmp sgt i32 %p2, 0
  %2 = extractvalue %struct.0 %p1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %4 = phi i32 [ 0, %bb1 ], [ %p0, %bb2 ]
  %5 = add i32 %4, 1
  br i1 %1, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %6 = phi i32 [ 1, %bb4 ], [ %p0, %bb5 ]
  %7 = shl i32 %6, 1
  %8 = add i32 %5, %7
  store i32 %8, ptr %3
  ret void

}


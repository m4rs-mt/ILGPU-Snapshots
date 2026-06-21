; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: TwoLambdasCrossBlockKernel  [intptr: i64]

define void @TwoLambdasCrossBlockKernel(i32 %p0, i32 %p1, ptr<i32> %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = icmp sgt i32 %p1, 0
  %1 = icmp sgt i32 %p1, 0
  %2 = getelementptr i32, ptr %p2, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb4

bb2:
  br label %bb3

bb3:
  br label %bb4

bb4:
  %3 = phi i32 [ 0, %bb1 ], [ %p0, %bb3 ]
  %4 = add i32 %3, 1
  br i1 %1, label %bb6, label %bb5

bb5:
  br label %bb8

bb6:
  br label %bb7

bb7:
  br label %bb8

bb8:
  %5 = phi i32 [ 1, %bb5 ], [ %p0, %bb7 ]
  %6 = shl i32 %5, 1
  %7 = add i32 %4, %6
  store i32 %7, ptr %2
  ret void

}


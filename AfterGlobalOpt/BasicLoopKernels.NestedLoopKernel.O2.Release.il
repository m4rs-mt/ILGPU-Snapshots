; stage: AfterGlobalOpt  opt: O2
; module: NestedLoopKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @NestedLoopKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %2 = phi i32 [ 0, %bb1 ], [ %4, %bb6 ]
  %3 = phi i32 [ 0, %bb1 ], [ %8, %bb6 ]
  %4 = add i32 %2, 1
  %5 = icmp slt i32 %2, 4
  %6 = shl i32 %2, 2
  br i1 %5, label %bb4, label %bb3

bb3:
  store i32 %3, ptr %1
  ret void

bb4:
  br label %bb5

bb5:
  %7 = phi i32 [ 0, %bb4 ], [ %9, %bb7 ]
  %8 = phi i32 [ %3, %bb4 ], [ %11, %bb7 ]
  %9 = add i32 %7, 1
  %10 = add i32 %6, %7
  %11 = add i32 %8, %10
  %12 = icmp slt i32 %7, 4
  br i1 %12, label %bb7, label %bb6

bb6:
  br label %bb2

bb7:
  br label %bb5

}


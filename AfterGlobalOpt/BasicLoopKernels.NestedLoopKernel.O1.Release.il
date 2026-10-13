; stage: AfterGlobalOpt  opt: O1
; module: NestedLoopKernel  [intptr: i64]

%struct.0 = type { view<i32>, i64, i8 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @NestedLoopKernel(i32 %p0, %struct.1 %p1) {
entry:
  br label %bb1

bb1:
  br label %bb2

bb2:
  %0 = phi i32 [ 0, %bb1 ], [ %3, %bb6 ]
  %1 = phi i32 [ 0, %bb1 ], [ %9, %bb6 ]
  %2 = phi %struct.1 [ %p1, %bb1 ], [ %2, %bb6 ]
  %3 = add i32 %0, 1
  %4 = icmp slt i32 %0, 4
  %5 = extractvalue %struct.1 %2, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  %7 = shl i32 %0, 2
  br i1 %4, label %bb4, label %bb3

bb3:
  store i32 %1, ptr %6
  ret void

bb4:
  br label %bb5

bb5:
  %8 = phi i32 [ 0, %bb4 ], [ %10, %bb7 ]
  %9 = phi i32 [ %1, %bb4 ], [ %12, %bb7 ]
  %10 = add i32 %8, 1
  %11 = add i32 %7, %8
  %12 = add i32 %9, %11
  %13 = icmp slt i32 %8, 4
  br i1 %13, label %bb7, label %bb6

bb6:
  br label %bb2

bb7:
  br label %bb5

}


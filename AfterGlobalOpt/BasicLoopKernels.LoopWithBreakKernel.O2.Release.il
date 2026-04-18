; stage: AfterGlobalOpt  opt: O2
; module: LoopWithBreakKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @LoopWithBreakKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %2 = phi i32 [ 0, %bb1 ], [ %4, %bb6 ]
  %3 = phi i32 [ 0, %bb1 ], [ %5, %bb6 ]
  %4 = add i32 %2, 1
  %5 = add i32 %3, %2
  %6 = icmp slt i32 %2, 100
  %7 = icmp sle i32 %5, 10
  br i1 %6, label %bb3, label %bb5

bb3:
  br i1 %7, label %bb6, label %bb4

bb4:
  br label %bb5

bb5:
  %8 = phi i32 [ %3, %bb2 ], [ %5, %bb4 ]
  store i32 %8, ptr %1
  ret void

bb6:
  br label %bb2

}


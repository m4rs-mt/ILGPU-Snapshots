; stage: AfterGlobalOpt  opt: O1
; module: LoopWithContinueKernel  [intptr: i64]

%struct.0 = type { view<i32>, i64, i8 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @LoopWithContinueKernel(i32 %p0, %struct.1 %p1) {
entry:
  br label %bb1

bb1:
  br label %bb2

bb2:
  %0 = phi i32 [ 0, %bb1 ], [ %3, %bb4 ]
  %1 = phi i32 [ 0, %bb1 ], [ %7, %bb4 ]
  %2 = phi %struct.1 [ %p1, %bb1 ], [ %2, %bb4 ]
  %3 = add i32 %0, 1
  %4 = srem i32 %0, 2
  %5 = icmp ne i32 %4, 0
  %6 = add i32 %1, %0
  %7 = select i1 %5, i32 %6, i32 %1
  %8 = icmp slt i32 %0, 10
  %9 = extractvalue %struct.1 %2, 0
  %10 = getelementptr i32, ptr %9, i32 %p0
  br i1 %8, label %bb4, label %bb3

bb3:
  store i32 %1, ptr %10
  ret void

bb4:
  br label %bb2

}


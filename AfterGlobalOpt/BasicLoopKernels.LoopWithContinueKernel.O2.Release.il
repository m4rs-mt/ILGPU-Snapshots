; stage: AfterGlobalOpt  opt: O2
; module: LoopWithContinueKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @LoopWithContinueKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %2 = phi i32 [ 0, %bb1 ], [ %4, %bb4 ]
  %3 = phi i32 [ 0, %bb1 ], [ %8, %bb4 ]
  %4 = add i32 %2, 1
  %5 = srem i32 %2, 2
  %6 = icmp ne i32 %5, 0
  %7 = add i32 %3, %2
  %8 = select i1 %6, i32 %7, i32 %3
  %9 = icmp slt i32 %2, 10
  br i1 %9, label %bb4, label %bb3

bb3:
  store i32 %3, ptr %1
  ret void

bb4:
  br label %bb2

}


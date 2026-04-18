; stage: AfterGlobalOpt  opt: O1
; module: LoopWithContinueKernel  [intptr: i64]

%struct.0 = type { view<i32>, i64, i8 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @LoopWithContinueKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = extractvalue %struct.1 %p1, 0
  %1 = extractvalue %struct.1 %p1, 1
  %2 = extractvalue %struct.1 %p1, 2
  %3 = { %view.i32 %0, i64 %1, i8 %2 }  ; %struct.1
  br label %bb1

bb1:
  br label %bb2

bb2:
  %4 = phi i32 [ 0, %bb1 ], [ %7, %bb5 ]
  %5 = phi i32 [ 0, %bb1 ], [ %11, %bb5 ]
  %6 = phi %struct.1 [ %3, %bb1 ], [ %15, %bb5 ]
  %7 = add i32 %4, 1
  %8 = srem i32 %4, 2
  %9 = icmp ne i32 %8, 0
  %10 = add i32 %5, %4
  %11 = select i1 %9, i32 %10, i32 %5
  %12 = extractvalue %struct.1 %6, 0
  %13 = extractvalue %struct.1 %6, 1
  %14 = extractvalue %struct.1 %6, 2
  %15 = { %view.i32 %12, i64 %13, i8 %14 }  ; %struct.1
  %16 = icmp slt i32 %4, 10
  %17 = extractvalue %struct.1 %6, 0
  %18 = getelementptr i32, ptr %17, i32 %p0
  br i1 %16, label %bb4, label %bb3

bb3:
  store i32 %5, ptr %18
  ret void

bb4:
  br label %bb5

bb5:
  br label %bb2

}


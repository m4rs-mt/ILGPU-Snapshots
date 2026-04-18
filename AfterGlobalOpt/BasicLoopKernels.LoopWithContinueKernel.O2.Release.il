; stage: AfterGlobalOpt  opt: O2
; module: LoopWithContinueKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { %view.i32, i64, i8 }

define void @LoopWithContinueKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = bitcast %view.i32 %0 to %view.i32
  %2 = extractvalue %struct.0 %p1, 1
  %3 = extractvalue %struct.0 %p1, 2
  %4 = { %view.i32 %1, i64 %2, i8 %3 }  ; %struct.1
  br label %bb1

bb1:
  br label %bb2

bb2:
  %5 = phi i32 [ 0, %bb1 ], [ %8, %bb5 ]
  %6 = phi i32 [ 0, %bb1 ], [ %12, %bb5 ]
  %7 = phi %struct.1 [ %4, %bb1 ], [ %16, %bb5 ]
  %8 = add i32 %5, 1
  %9 = srem i32 %5, 2
  %10 = icmp ne i32 %9, 0
  %11 = add i32 %6, %5
  %12 = select i1 %10, i32 %11, i32 %6
  %13 = extractvalue %struct.1 %7, 0
  %14 = extractvalue %struct.1 %7, 1
  %15 = extractvalue %struct.1 %7, 2
  %16 = { %view.i32 %13, i64 %14, i8 %15 }  ; %struct.1
  %17 = icmp slt i32 %5, 10
  %18 = extractvalue %struct.1 %7, 0
  %19 = getelementptr i32, ptr %18, i32 %p0
  br i1 %17, label %bb4, label %bb3

bb3:
  store i32 %6, ptr %19
  ret void

bb4:
  br label %bb5

bb5:
  br label %bb2

}


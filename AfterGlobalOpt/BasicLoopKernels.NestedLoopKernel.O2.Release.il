; stage: AfterGlobalOpt  opt: O2
; module: NestedLoopKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { %view.i32, i64, i8 }

define void @NestedLoopKernel(i32 %p0, %struct.0 %p1) {
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
  %5 = phi i32 [ 0, %bb1 ], [ %8, %bb6 ]
  %6 = phi i32 [ 0, %bb1 ], [ %18, %bb6 ]
  %7 = phi %struct.1 [ %4, %bb1 ], [ %12, %bb6 ]
  %8 = add i32 %5, 1
  %9 = extractvalue %struct.1 %7, 0
  %10 = extractvalue %struct.1 %7, 1
  %11 = extractvalue %struct.1 %7, 2
  %12 = { %view.i32 %9, i64 %10, i8 %11 }  ; %struct.1
  %13 = icmp slt i32 %5, 4
  %14 = extractvalue %struct.1 %7, 0
  %15 = getelementptr i32, ptr %14, i32 %p0
  %16 = shl i32 %5, 2
  br i1 %13, label %bb4, label %bb3

bb3:
  store i32 %6, ptr %15
  ret void

bb4:
  br label %bb5

bb5:
  %17 = phi i32 [ 0, %bb4 ], [ %19, %bb7 ]
  %18 = phi i32 [ %6, %bb4 ], [ %21, %bb7 ]
  %19 = add i32 %17, 1
  %20 = add i32 %16, %17
  %21 = add i32 %18, %20
  %22 = icmp slt i32 %17, 4
  br i1 %22, label %bb7, label %bb6

bb6:
  br label %bb2

bb7:
  br label %bb5

}


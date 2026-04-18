; stage: AfterGlobalOpt  opt: O1
; module: NestedLoopKernel  [intptr: i64]

%struct.0 = type { view<i32>, i64, i8 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @NestedLoopKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = extractvalue %struct.1 %p1, 0
  %1 = extractvalue %struct.1 %p1, 1
  %2 = extractvalue %struct.1 %p1, 2
  %3 = { %view.i32 %0, i64 %1, i8 %2 }  ; %struct.1
  br label %bb1

bb1:
  br label %bb2

bb2:
  %4 = phi i32 [ 0, %bb1 ], [ %7, %bb6 ]
  %5 = phi i32 [ 0, %bb1 ], [ %17, %bb6 ]
  %6 = phi %struct.1 [ %3, %bb1 ], [ %11, %bb6 ]
  %7 = add i32 %4, 1
  %8 = extractvalue %struct.1 %6, 0
  %9 = extractvalue %struct.1 %6, 1
  %10 = extractvalue %struct.1 %6, 2
  %11 = { %view.i32 %8, i64 %9, i8 %10 }  ; %struct.1
  %12 = icmp slt i32 %4, 4
  %13 = extractvalue %struct.1 %6, 0
  %14 = getelementptr i32, ptr %13, i32 %p0
  %15 = shl i32 %4, 2
  br i1 %12, label %bb4, label %bb3

bb3:
  store i32 %5, ptr %14
  ret void

bb4:
  br label %bb5

bb5:
  %16 = phi i32 [ 0, %bb4 ], [ %18, %bb7 ]
  %17 = phi i32 [ %5, %bb4 ], [ %20, %bb7 ]
  %18 = add i32 %16, 1
  %19 = add i32 %15, %16
  %20 = add i32 %17, %19
  %21 = icmp slt i32 %16, 4
  br i1 %21, label %bb7, label %bb6

bb6:
  br label %bb2

bb7:
  br label %bb5

}


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
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %5 = icmp sge i32 %p0, 0
  %6 = icmp eq i32 %p0, 0
  %7 = call ptr @ilgpu.string("X_index_out_of_bounds")
  br label %bb1

bb1:
  br label %bb2

bb2:
  %8 = phi i32 [ 0, %bb1 ], [ %11, %bb6 ]
  %9 = phi i32 [ 0, %bb1 ], [ %31, %bb6 ]
  %10 = phi %struct.1 [ %3, %bb1 ], [ %15, %bb6 ]
  %11 = add i32 %8, 1
  %12 = extractvalue %struct.1 %10, 0
  %13 = extractvalue %struct.1 %10, 1
  %14 = extractvalue %struct.1 %10, 2
  %15 = { %view.i32 %12, i64 %13, i8 %14 }  ; %struct.1
  %16 = icmp slt i32 %8, 4
  %17 = extractvalue %struct.1 %10, 1
  %18 = icmp sge i64 %17, -2147483648
  %19 = icmp sle i64 %17, 2147483647
  %20 = and i1 %18, %19
  %21 = trunc i64 %17 to i32
  %22 = icmp slt i32 %p0, %21
  %23 = and i1 %5, %22
  %24 = icmp eq i32 %21, 0
  %25 = and i1 %6, %24
  %26 = or i1 %23, %25
  %27 = extractvalue %struct.1 %10, 0
  %28 = getelementptr i32, ptr %27, i32 %p0
  %29 = shl i32 %8, 2
  br i1 %16, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %20, ptr %4)
  call void @ilgpu.debug.assert(i1 %26, ptr %7)
  store i32 %9, ptr %28
  ret void

bb4:
  br label %bb5

bb5:
  %30 = phi i32 [ 0, %bb4 ], [ %32, %bb7 ]
  %31 = phi i32 [ %9, %bb4 ], [ %34, %bb7 ]
  %32 = add i32 %30, 1
  %33 = add i32 %29, %30
  %34 = add i32 %31, %33
  %35 = icmp slt i32 %30, 4
  br i1 %35, label %bb7, label %bb6

bb6:
  br label %bb2

bb7:
  br label %bb5

}


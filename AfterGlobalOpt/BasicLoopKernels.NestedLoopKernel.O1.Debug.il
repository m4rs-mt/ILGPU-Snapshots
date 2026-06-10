; stage: AfterGlobalOpt  opt: O1
; module: NestedLoopKernel  [intptr: i64]

%struct.0 = type { view<i32>, i64, i8 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @NestedLoopKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %1 = icmp sge i32 %p0, 0
  %2 = icmp eq i32 %p0, 0
  %3 = call ptr @ilgpu.string("X_index_out_of_bounds")
  br label %bb1

bb1:
  br label %bb2

bb2:
  %4 = phi i32 [ 0, %bb1 ], [ %7, %bb6 ]
  %5 = phi i32 [ 0, %bb1 ], [ %23, %bb6 ]
  %6 = phi %struct.1 [ %p1, %bb1 ], [ %6, %bb6 ]
  %7 = add i32 %4, 1
  %8 = icmp slt i32 %4, 4
  %9 = extractvalue %struct.1 %6, 1
  %10 = icmp sge i64 %9, -2147483648
  %11 = icmp sle i64 %9, 2147483647
  %12 = and i1 %10, %11
  %13 = trunc i64 %9 to i32
  %14 = icmp slt i32 %p0, %13
  %15 = and i1 %1, %14
  %16 = icmp eq i32 %13, 0
  %17 = and i1 %2, %16
  %18 = or i1 %15, %17
  %19 = extractvalue %struct.1 %6, 0
  %20 = getelementptr i32, ptr %19, i32 %p0
  %21 = shl i32 %4, 2
  br i1 %8, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %12, ptr %0)
  call void @ilgpu.debug.assert(i1 %18, ptr %3)
  store i32 %5, ptr %20
  ret void

bb4:
  br label %bb5

bb5:
  %22 = phi i32 [ 0, %bb4 ], [ %24, %bb7 ]
  %23 = phi i32 [ %5, %bb4 ], [ %26, %bb7 ]
  %24 = add i32 %22, 1
  %25 = add i32 %21, %22
  %26 = add i32 %23, %25
  %27 = icmp slt i32 %22, 4
  br i1 %27, label %bb7, label %bb6

bb6:
  br label %bb2

bb7:
  br label %bb5

}


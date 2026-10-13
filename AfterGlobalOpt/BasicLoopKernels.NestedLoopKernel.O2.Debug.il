; stage: AfterGlobalOpt  opt: O2
; module: NestedLoopKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @NestedLoopKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 1
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %5 = icmp sge i32 %p0, 0
  %6 = trunc i64 %0 to i32
  %7 = icmp slt i32 %p0, %6
  %8 = and i1 %5, %7
  %9 = icmp eq i32 %p0, 0
  %10 = icmp eq i32 %6, 0
  %11 = and i1 %9, %10
  %12 = or i1 %8, %11
  %13 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %14 = extractvalue %struct.0 %p1, 0
  %15 = getelementptr i32, ptr %14, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %16 = phi i32 [ 0, %bb1 ], [ %18, %bb6 ]
  %17 = phi i32 [ 0, %bb1 ], [ %22, %bb6 ]
  %18 = add i32 %16, 1
  %19 = icmp slt i32 %16, 4
  %20 = shl i32 %16, 2
  br i1 %19, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  store i32 %17, ptr %15
  ret void

bb4:
  br label %bb5

bb5:
  %21 = phi i32 [ 0, %bb4 ], [ %23, %bb7 ]
  %22 = phi i32 [ %17, %bb4 ], [ %25, %bb7 ]
  %23 = add i32 %21, 1
  %24 = add i32 %20, %21
  %25 = add i32 %22, %24
  %26 = icmp slt i32 %21, 4
  br i1 %26, label %bb7, label %bb6

bb6:
  br label %bb2

bb7:
  br label %bb5

}


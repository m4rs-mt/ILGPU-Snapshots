; stage: AfterGlobalOpt  opt: O1
; module: LoopWithContinueKernel  [intptr: i64]

%struct.0 = type { view<i32>, i64, i8 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @LoopWithContinueKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %1 = icmp sge i32 %p0, 0
  %2 = icmp eq i32 %p0, 0
  %3 = call ptr @ilgpu.string("X_index_out_of_bounds")
  br label %bb1

bb1:
  br label %bb2

bb2:
  %4 = phi i32 [ 0, %bb1 ], [ %7, %bb4 ]
  %5 = phi i32 [ 0, %bb1 ], [ %11, %bb4 ]
  %6 = phi %struct.1 [ %p1, %bb1 ], [ %6, %bb4 ]
  %7 = add i32 %4, 1
  %8 = srem i32 %4, 2
  %9 = icmp ne i32 %8, 0
  %10 = add i32 %5, %4
  %11 = select i1 %9, i32 %10, i32 %5
  %12 = icmp slt i32 %4, 10
  %13 = extractvalue %struct.1 %6, 1
  %14 = icmp sge i64 %13, -2147483648
  %15 = icmp sle i64 %13, 2147483647
  %16 = and i1 %14, %15
  %17 = trunc i64 %13 to i32
  %18 = icmp slt i32 %p0, %17
  %19 = and i1 %1, %18
  %20 = icmp eq i32 %17, 0
  %21 = and i1 %2, %20
  %22 = or i1 %19, %21
  %23 = extractvalue %struct.1 %6, 0
  %24 = getelementptr i32, ptr %23, i32 %p0
  br i1 %12, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %16, ptr %0)
  call void @ilgpu.debug.assert(i1 %22, ptr %3)
  store i32 %5, ptr %24
  ret void

bb4:
  br label %bb2

}


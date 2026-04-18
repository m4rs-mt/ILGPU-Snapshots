; stage: AfterGlobalOpt  opt: O2
; module: DivergentLoopKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DivergentLoopKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = srem i32 %p0, 4
  %1 = add i32 %0, 1
  %2 = extractvalue %struct.0 %p1, 1
  %3 = icmp sge i64 %2, -2147483648
  %4 = icmp sle i64 %2, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %2 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %16 = extractvalue %struct.0 %p1, 0
  %17 = getelementptr i32, ptr %16, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %18 = phi i32 [ 0, %bb1 ], [ %20, %bb4 ]
  %19 = phi i32 [ 0, %bb1 ], [ %21, %bb4 ]
  %20 = add i32 %18, 1
  %21 = add i32 %19, %18
  %22 = icmp slt i32 %18, %1
  br i1 %22, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  store i32 %19, ptr %17
  ret void

bb4:
  br label %bb2

}


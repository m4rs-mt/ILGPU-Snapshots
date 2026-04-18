; stage: AfterGlobalOpt  opt: O2
; module: Index3DKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @Index3DKernel(%struct.0 %p0, %struct.1 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = extractvalue %struct.1 %p1, 1
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = extractvalue %struct.0 %p0, 0
  %6 = extractvalue %struct.0 %p0, 1
  %7 = mul i32 %6, %p2
  %8 = add i32 %5, %7
  %9 = extractvalue %struct.0 %p0, 2
  %10 = mul i32 %9, %p2
  %11 = mul i32 %10, %p3
  %12 = add i32 %8, %11
  %13 = icmp sge i32 %12, 0
  %14 = trunc i64 %0 to i32
  %15 = icmp slt i32 %12, %14
  %16 = and i1 %13, %15
  %17 = icmp eq i32 %12, 0
  %18 = icmp eq i32 %14, 0
  %19 = and i1 %17, %18
  %20 = or i1 %16, %19
  %21 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %20, ptr %21)
  %22 = extractvalue %struct.1 %p1, 0
  %23 = getelementptr i32, ptr %22, i32 %12
  %24 = extractvalue %struct.0 %p0, 0
  %25 = extractvalue %struct.0 %p0, 1
  %26 = mul i32 %25, 100
  %27 = add i32 %24, %26
  %28 = extractvalue %struct.0 %p0, 2
  %29 = mul i32 %28, 10000
  %30 = add i32 %27, %29
  store i32 %30, ptr %23
  ret void

}


; stage: AfterGlobalOpt  opt: O1
; module: Index2DKernel  [intptr: i64]

%struct.0 = type { i32, i32 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @Index2DKernel(%struct.0 %p0, %struct.1 %p1, i32 %p2) {
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
  %9 = icmp sge i32 %8, 0
  %10 = trunc i64 %0 to i32
  %11 = icmp slt i32 %8, %10
  %12 = and i1 %9, %11
  %13 = icmp eq i32 %8, 0
  %14 = icmp eq i32 %10, 0
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %17 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %16, ptr %17)
  %18 = extractvalue %struct.1 %p1, 0
  %19 = getelementptr i32, ptr %18, i32 %8
  %20 = extractvalue %struct.0 %p0, 0
  %21 = extractvalue %struct.0 %p0, 1
  %22 = mul i32 %21, 1000
  %23 = add i32 %20, %22
  store i32 %23, ptr %19
  ret void

}


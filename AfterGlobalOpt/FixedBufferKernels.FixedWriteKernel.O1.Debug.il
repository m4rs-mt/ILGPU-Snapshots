; stage: AfterGlobalOpt  opt: O1
; module: FixedWriteKernel  [intptr: i64]

%struct.0 = type { i32 }
%view.struct = view %struct.0
%struct.1 = type { %view.struct, i64, i8 }

define void @FixedWriteKernel(i32 %p0, %struct.1 %p1, i32 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %0
  %1 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  store i32 %p2, ptr %1
  %2 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %3 = getelementptr i32, ptr %2, i32 1
  %4 = shl i32 %p2, 1
  store i32 %4, ptr %3
  %5 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %6 = getelementptr i32, ptr %5, i32 2
  %7 = mul i32 %p2, 3
  store i32 %7, ptr %6
  %8 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %9 = getelementptr i32, ptr %8, i32 3
  %10 = shl i32 %p2, 2
  store i32 %10, ptr %9
  %11 = extractvalue %struct.1 %p1, 1
  %12 = icmp sge i64 %11, -2147483648
  %13 = icmp sle i64 %11, 2147483647
  %14 = and i1 %12, %13
  %15 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  %16 = icmp sge i32 %p0, 0
  %17 = trunc i64 %11 to i32
  %18 = icmp slt i32 %p0, %17
  %19 = and i1 %16, %18
  %20 = icmp eq i32 %p0, 0
  %21 = icmp eq i32 %17, 0
  %22 = and i1 %20, %21
  %23 = or i1 %19, %22
  %24 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %23, ptr %24)
  %25 = load %struct.0, ptr %0
  %26 = extractvalue %struct.1 %p1, 0
  %27 = getelementptr %struct.0, ptr %26, i32 %p0
  store %struct.0 %25, ptr %27
  ret void

}


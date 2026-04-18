; stage: AfterBackendTransforms  backend: Cuda  opt: O2
; module: SimpleArrayKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @SimpleArrayKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 2
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = icmp sge i32 %p0, 0
  %6 = trunc i64 %0 to i32
  %7 = icmp slt i32 %p0, %6
  %8 = and i1 %5, %7
  %9 = icmp eq i32 %p0, 0
  %10 = icmp eq i32 %6, 0
  %11 = and i1 %9, %10
  %12 = or i1 %8, %11
  %13 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  %14 = extractvalue %struct.0 %p1, 0
  %15 = getelementptr i32, ptr %14, i32 %p0
  %16 = load i32, ptr %15
  %17 = extractvalue %struct.0 %p2, 2
  %18 = icmp sge i64 %17, -2147483648
  %19 = icmp sle i64 %17, 2147483647
  %20 = and i1 %18, %19
  %21 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %20, ptr %21)
  %22 = icmp sge i32 %p0, 0
  %23 = trunc i64 %17 to i32
  %24 = icmp slt i32 %p0, %23
  %25 = and i1 %22, %24
  %26 = icmp eq i32 %p0, 0
  %27 = icmp eq i32 %23, 0
  %28 = and i1 %26, %27
  %29 = or i1 %25, %28
  %30 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %29, ptr %30)
  %31 = extractvalue %struct.0 %p2, 0
  %32 = getelementptr i32, ptr %31, i32 %p0
  %33 = shl i32 %16, 1
  %34 = add i32 %33, 1
  store i32 %34, ptr %32
  ret void

}


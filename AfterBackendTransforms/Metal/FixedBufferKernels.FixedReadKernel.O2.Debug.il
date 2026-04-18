; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: FixedReadKernel  [intptr: i64]

%struct.0 = type { i32 }

define void @FixedReadKernel(i32 %p0, ptr<%struct.0> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i32> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %0
  %1 = icmp sge i64 %p3, -2147483648
  %2 = icmp sle i64 %p3, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = icmp sge i32 %p0, 0
  %6 = trunc i64 %p3 to i32
  %7 = icmp slt i32 %p0, %6
  %8 = and i1 %5, %7
  %9 = icmp eq i32 %p0, 0
  %10 = icmp eq i32 %6, 0
  %11 = and i1 %9, %10
  %12 = or i1 %8, %11
  %13 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  %14 = getelementptr %struct.0, ptr %p1, i32 %p0
  %15 = load %struct.0, ptr %14
  store %struct.0 %15, ptr %0
  %16 = icmp sge i64 %p7, -2147483648
  %17 = icmp sle i64 %p7, 2147483647
  %18 = and i1 %16, %17
  %19 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %18, ptr %19)
  %20 = icmp sge i32 %p0, 0
  %21 = trunc i64 %p7 to i32
  %22 = icmp slt i32 %p0, %21
  %23 = and i1 %20, %22
  %24 = icmp eq i32 %p0, 0
  %25 = icmp eq i32 %21, 0
  %26 = and i1 %24, %25
  %27 = or i1 %23, %26
  %28 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %27, ptr %28)
  %29 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %30 = load i32, ptr %29
  %31 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %32 = getelementptr i32, ptr %31, i32 1
  %33 = load i32, ptr %32
  %34 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %35 = getelementptr i32, ptr %34, i32 2
  %36 = load i32, ptr %35
  %37 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %38 = getelementptr i32, ptr %37, i32 3
  %39 = load i32, ptr %38
  %40 = getelementptr i32, ptr %p5, i32 %p0
  %41 = add i32 %30, %33
  %42 = add i32 %41, %36
  %43 = add i32 %42, %39
  store i32 %43, ptr %40
  ret void

}


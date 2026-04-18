; stage: AfterBackendTransforms  backend: Cuda  opt: O2
; module: FixedReadKernel  [intptr: i64]

%struct.0 = type { i32 }
%struct.1 = type { ptr<%struct.0> addrspace(global), i64, i64, i8 }
%struct.2 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @FixedReadKernel(i32 %p0, %struct.1 %p1, %struct.2 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %0
  %1 = extractvalue %struct.1 %p1, 2
  %2 = icmp sge i64 %1, -2147483648
  %3 = icmp sle i64 %1, 2147483647
  %4 = and i1 %2, %3
  %5 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  %6 = icmp sge i32 %p0, 0
  %7 = trunc i64 %1 to i32
  %8 = icmp slt i32 %p0, %7
  %9 = and i1 %6, %8
  %10 = icmp eq i32 %p0, 0
  %11 = icmp eq i32 %7, 0
  %12 = and i1 %10, %11
  %13 = or i1 %9, %12
  %14 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %13, ptr %14)
  %15 = extractvalue %struct.1 %p1, 0
  %16 = getelementptr %struct.0, ptr %15, i32 %p0
  %17 = load %struct.0, ptr %16
  store %struct.0 %17, ptr %0
  %18 = extractvalue %struct.2 %p2, 2
  %19 = icmp sge i64 %18, -2147483648
  %20 = icmp sle i64 %18, 2147483647
  %21 = and i1 %19, %20
  %22 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %21, ptr %22)
  %23 = icmp sge i32 %p0, 0
  %24 = trunc i64 %18 to i32
  %25 = icmp slt i32 %p0, %24
  %26 = and i1 %23, %25
  %27 = icmp eq i32 %p0, 0
  %28 = icmp eq i32 %24, 0
  %29 = and i1 %27, %28
  %30 = or i1 %26, %29
  %31 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %30, ptr %31)
  %32 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %33 = load i32, ptr %32
  %34 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %35 = getelementptr i32, ptr %34, i32 1
  %36 = load i32, ptr %35
  %37 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %38 = getelementptr i32, ptr %37, i32 2
  %39 = load i32, ptr %38
  %40 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %41 = getelementptr i32, ptr %40, i32 3
  %42 = load i32, ptr %41
  %43 = extractvalue %struct.2 %p2, 0
  %44 = getelementptr i32, ptr %43, i32 %p0
  %45 = add i32 %33, %36
  %46 = add i32 %45, %39
  %47 = add i32 %46, %42
  store i32 %47, ptr %44
  ret void

}


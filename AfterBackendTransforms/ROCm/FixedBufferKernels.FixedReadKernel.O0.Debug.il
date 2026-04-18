; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: FixedReadKernel  [intptr: i64]

%struct.0 = type { i32 }
%struct.1 = type { ptr<%struct.0> addrspace(global), i64 }
%struct.2 = type { ptr<%struct.0> addrspace(global), i64, i64, i8 }
%struct.3 = type { ptr<i32> addrspace(global), i64 }
%struct.4 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @FixedReadKernel(i32 %p0, %struct.2 %p1, %struct.4 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %0
  %1 = extractvalue %struct.2 %p1, 2
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
  %15 = extractvalue %struct.2 %p1, 0 [Span: 2]
  %16 = extractvalue %struct.1 %15, 0
  %17 = getelementptr %struct.0, ptr %16, i32 %p0
  %18 = load %struct.0, ptr %17
  store %struct.0 %18, ptr %0
  %19 = extractvalue %struct.4 %p2, 2
  %20 = icmp sge i64 %19, -2147483648
  %21 = icmp sle i64 %19, 2147483647
  %22 = and i1 %20, %21
  %23 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %22, ptr %23)
  %24 = icmp sge i32 %p0, 0
  %25 = trunc i64 %19 to i32
  %26 = icmp slt i32 %p0, %25
  %27 = and i1 %24, %26
  %28 = icmp eq i32 %p0, 0
  %29 = icmp eq i32 %25, 0
  %30 = and i1 %28, %29
  %31 = or i1 %27, %30
  %32 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %31, ptr %32)
  %33 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %34 = load i32, ptr %33
  %35 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %36 = getelementptr i32, ptr %35, i32 1
  %37 = load i32, ptr %36
  %38 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %39 = getelementptr i32, ptr %38, i32 2
  %40 = load i32, ptr %39
  %41 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %42 = getelementptr i32, ptr %41, i32 3
  %43 = load i32, ptr %42
  %44 = extractvalue %struct.4 %p2, 0 [Span: 2]
  %45 = extractvalue %struct.3 %44, 0
  %46 = getelementptr i32, ptr %45, i32 %p0
  %47 = add i32 %34, %37
  %48 = add i32 %47, %40
  %49 = add i32 %48, %43
  store i32 %49, ptr %46
  ret void

}


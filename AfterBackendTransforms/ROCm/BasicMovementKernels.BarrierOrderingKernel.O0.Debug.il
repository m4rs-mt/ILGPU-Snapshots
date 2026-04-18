; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: BarrierOrderingKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @BarrierOrderingKernel(i32 %p0, %struct.1 %p1, %struct.1 %p2) {
entry:
  %0 = extractvalue %struct.1 %p1, 2
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
  %14 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %15 = extractvalue %struct.0 %14, 0
  %16 = getelementptr i32, ptr %15, i32 %p0
  %17 = shl i32 %p0, 1
  store i32 %17, ptr %16
  call void @ilgpu.barrier.group()
  %18 = extractvalue %struct.1 %p2, 2
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
  %32 = extractvalue %struct.1 %p1, 2
  %33 = icmp sge i64 %32, -2147483648
  %34 = icmp sle i64 %32, 2147483647
  %35 = and i1 %33, %34
  %36 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %35, ptr %36)
  %37 = icmp sge i32 %p0, 0
  %38 = trunc i64 %32 to i32
  %39 = icmp slt i32 %p0, %38
  %40 = and i1 %37, %39
  %41 = icmp eq i32 %p0, 0
  %42 = icmp eq i32 %38, 0
  %43 = and i1 %41, %42
  %44 = or i1 %40, %43
  %45 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %44, ptr %45)
  %46 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %47 = extractvalue %struct.0 %46, 0
  %48 = getelementptr i32, ptr %47, i32 %p0
  %49 = load i32, ptr %48
  %50 = extractvalue %struct.1 %p2, 0 [Span: 2]
  %51 = extractvalue %struct.0 %50, 0
  %52 = getelementptr i32, ptr %51, i32 %p0
  %53 = add i32 %49, 1
  store i32 %53, ptr %52
  ret void

}


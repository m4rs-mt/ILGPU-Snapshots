; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: BarrierOrderingKernel  [intptr: i64]

define void @BarrierOrderingKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i32> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = icmp sge i64 %p3, -2147483648
  %1 = icmp sle i64 %p3, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  %4 = icmp sge i32 %p0, 0
  %5 = trunc i64 %p3 to i32
  %6 = icmp slt i32 %p0, %5
  %7 = and i1 %4, %6
  %8 = icmp eq i32 %p0, 0
  %9 = icmp eq i32 %5, 0
  %10 = and i1 %8, %9
  %11 = or i1 %7, %10
  %12 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  %13 = getelementptr i32, ptr %p1, i32 %p0
  %14 = shl i32 %p0, 1
  store i32 %14, ptr %13
  call void @ilgpu.barrier.group()
  %15 = icmp sge i64 %p7, -2147483648
  %16 = icmp sle i64 %p7, 2147483647
  %17 = and i1 %15, %16
  %18 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  %19 = icmp sge i32 %p0, 0
  %20 = trunc i64 %p7 to i32
  %21 = icmp slt i32 %p0, %20
  %22 = and i1 %19, %21
  %23 = icmp eq i32 %p0, 0
  %24 = icmp eq i32 %20, 0
  %25 = and i1 %23, %24
  %26 = or i1 %22, %25
  %27 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %26, ptr %27)
  %28 = icmp sge i64 %p3, -2147483648
  %29 = icmp sle i64 %p3, 2147483647
  %30 = and i1 %28, %29
  %31 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %30, ptr %31)
  %32 = icmp sge i32 %p0, 0
  %33 = trunc i64 %p3 to i32
  %34 = icmp slt i32 %p0, %33
  %35 = and i1 %32, %34
  %36 = icmp eq i32 %p0, 0
  %37 = icmp eq i32 %33, 0
  %38 = and i1 %36, %37
  %39 = or i1 %35, %38
  %40 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %39, ptr %40)
  %41 = getelementptr i32, ptr %p1, i32 %p0
  %42 = load i32, ptr %41
  %43 = getelementptr i32, ptr %p5, i32 %p0
  %44 = add i32 %42, 1
  store i32 %44, ptr %43
  ret void

}


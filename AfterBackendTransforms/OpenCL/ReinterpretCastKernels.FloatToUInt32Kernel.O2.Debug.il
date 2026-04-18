; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: FloatToUInt32Kernel  [intptr: i64]

define void @FloatToUInt32Kernel(i32 %p0, ptr<float> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i32> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = alloca float, i32 1
  store float 0.0, ptr %0
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
  %14 = getelementptr float, ptr %p1, i32 %p0
  %15 = load float, ptr %14
  store float %15, ptr %0
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
  %29 = bitcast ptr %0 to ptr ; float -> i32
  %30 = load i32, ptr %29
  %31 = getelementptr i32, ptr %p5, i32 %p0
  store i32 %30, ptr %31
  ret void

}


; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: MultiCaptureKernel  [intptr: i64]

define void @MultiCaptureKernel(i32 %p0, i32 %p1, i32 %p2, ptr<i32> addrspace(global) %p3, i64 %p4, i64 %p5, i8 %p6) {
entry:
  %0 = icmp sge i64 %p5, -2147483648
  %1 = icmp sle i64 %p5, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  %4 = icmp sge i32 %p0, 0
  %5 = trunc i64 %p5 to i32
  %6 = icmp slt i32 %p0, %5
  %7 = and i1 %4, %6
  %8 = icmp eq i32 %p0, 0
  %9 = icmp eq i32 %5, 0
  %10 = and i1 %8, %9
  %11 = or i1 %7, %10
  %12 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  %13 = getelementptr i32, ptr %p3, i32 %p0
  %14 = mul i32 %p0, %p1
  %15 = add i32 %14, %p2
  store i32 %15, ptr %13
  ret void

}


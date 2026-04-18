; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: FloatToIntKernel  [intptr: i64]

define void @FloatToIntKernel(i32 %p0, float %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = icmp sge i64 %p4, -2147483648
  %1 = icmp sle i64 %p4, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  %4 = icmp sge i32 %p0, 0
  %5 = trunc i64 %p4 to i32
  %6 = icmp slt i32 %p0, %5
  %7 = and i1 %4, %6
  %8 = icmp eq i32 %p0, 0
  %9 = icmp eq i32 %5, 0
  %10 = and i1 %8, %9
  %11 = or i1 %7, %10
  %12 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  %13 = getelementptr i32, ptr %p2, i32 %p0
  %14 = fptosi float %p1 to i32
  store i32 %14, ptr %13
  ret void

}


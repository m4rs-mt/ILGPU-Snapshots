; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: FloatArrayKernel  [intptr: i64]

@g0 = internal global float zeroinitializer ; local

define void @FloatArrayKernel(i32 %p0, ptr<float> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  store float 1.5, ptr @g0
  %0 = getelementptr float, ptr @g0, i32 1
  store float 2.5, ptr %0
  %1 = getelementptr float, ptr @g0, i32 2
  store float 3.5, ptr %1
  %2 = getelementptr float, ptr @g0, i32 3
  store float 4.5, ptr %2
  %3 = icmp sge i64 %p3, -2147483648
  %4 = icmp sle i64 %p3, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %p3 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  %16 = getelementptr float, ptr @g0, i32 %p0
  %17 = load float, ptr %16
  %18 = getelementptr float, ptr %p1, i32 %p0
  store float %17, ptr %18
  ret void

}


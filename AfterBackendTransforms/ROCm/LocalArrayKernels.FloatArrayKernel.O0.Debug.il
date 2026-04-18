; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: FloatArrayKernel  [intptr: i64]

%struct.0 = type { ptr<float> addrspace(global), i64 }
%struct.1 = type { ptr<float> addrspace(global), i64, i64, i8 }

@g0 = internal global float zeroinitializer ; local

define void @FloatArrayKernel(i32 %p0, %struct.1 %p1) {
entry:
  store float 1.5, ptr @g0
  %0 = getelementptr float, ptr @g0, i32 1
  store float 2.5, ptr %0
  %1 = getelementptr float, ptr @g0, i32 2
  store float 3.5, ptr %1
  %2 = getelementptr float, ptr @g0, i32 3
  store float 4.5, ptr %2
  %3 = extractvalue %struct.1 %p1, 2
  %4 = icmp sge i64 %3, -2147483648
  %5 = icmp sle i64 %3, 2147483647
  %6 = and i1 %4, %5
  %7 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  %8 = icmp sge i32 %p0, 0
  %9 = trunc i64 %3 to i32
  %10 = icmp slt i32 %p0, %9
  %11 = and i1 %8, %10
  %12 = icmp eq i32 %p0, 0
  %13 = icmp eq i32 %9, 0
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %16 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  %17 = getelementptr float, ptr @g0, i32 %p0
  %18 = load float, ptr %17
  %19 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %20 = extractvalue %struct.0 %19, 0
  %21 = getelementptr float, ptr %20, i32 %p0
  store float %18, ptr %21
  ret void

}


; stage: AfterGlobalOpt  opt: O2
; module: FloatArrayKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }

@g0 = internal global float zeroinitializer ; local

define void @FloatArrayKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call array<float, 1> @ilgpu.array.new(ptr @g0, i32 4)
  %1 = getelementptr float, ptr %0, i32 0
  store float 1.5, ptr %1
  %2 = getelementptr float, ptr %0, i32 1
  store float 2.5, ptr %2
  %3 = getelementptr float, ptr %0, i32 2
  store float 3.5, ptr %3
  %4 = getelementptr float, ptr %0, i32 3
  store float 4.5, ptr %4
  %5 = extractvalue %struct.0 %p1, 1
  %6 = icmp sge i64 %5, -2147483648
  %7 = icmp sle i64 %5, 2147483647
  %8 = and i1 %6, %7
  %9 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %8, ptr %9)
  %10 = icmp sge i32 %p0, 0
  %11 = trunc i64 %5 to i32
  %12 = icmp slt i32 %p0, %11
  %13 = and i1 %10, %12
  %14 = icmp eq i32 %p0, 0
  %15 = icmp eq i32 %11, 0
  %16 = and i1 %14, %15
  %17 = or i1 %13, %16
  %18 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  %19 = getelementptr float, ptr %0, i32 %p0
  %20 = load float, ptr %19
  %21 = extractvalue %struct.0 %p1, 0
  %22 = getelementptr float, ptr %21, i32 %p0
  store float %20, ptr %22
  ret void

}


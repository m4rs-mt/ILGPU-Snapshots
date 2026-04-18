; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: FloatToUInt32Kernel  [intptr: i64]

%struct.0 = type { ptr<float> addrspace(global), i64 }
%struct.1 = type { ptr<float> addrspace(global), i64, i64, i8 }
%struct.2 = type { ptr<i32> addrspace(global), i64 }
%struct.3 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @FloatToUInt32Kernel(i32 %p0, %struct.1 %p1, %struct.3 %p2) {
entry:
  %0 = alloca float, i32 1
  store float 0.0, ptr %0
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
  %15 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %16 = extractvalue %struct.0 %15, 0
  %17 = getelementptr float, ptr %16, i32 %p0
  %18 = load float, ptr %17
  store float %18, ptr %0
  %19 = extractvalue %struct.3 %p2, 2
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
  %33 = bitcast ptr %0 to ptr ; float -> i32
  %34 = load i32, ptr %33
  %35 = extractvalue %struct.3 %p2, 0 [Span: 2]
  %36 = extractvalue %struct.2 %35, 0
  %37 = getelementptr i32, ptr %36, i32 %p0
  store i32 %34, ptr %37
  ret void

}


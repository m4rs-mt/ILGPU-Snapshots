; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: NegKernel  [intptr: i64]

%struct.0 = type { ptr<i8> addrspace(global), i64 }
%struct.1 = type { ptr<i8> addrspace(global), i64, i64, i8 }

define void @NegKernel(i32 %p0, %struct.1 %p1, %struct.1 %p2) {
entry:
  %0 = extractvalue %struct.1 %p2, 2
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
  %14 = extractvalue %struct.1 %p1, 2
  %15 = icmp sge i64 %14, -2147483648
  %16 = icmp sle i64 %14, 2147483647
  %17 = and i1 %15, %16
  %18 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  %19 = icmp sge i32 %p0, 0
  %20 = trunc i64 %14 to i32
  %21 = icmp slt i32 %p0, %20
  %22 = and i1 %19, %21
  %23 = icmp eq i32 %p0, 0
  %24 = icmp eq i32 %20, 0
  %25 = and i1 %23, %24
  %26 = or i1 %22, %25
  %27 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %26, ptr %27)
  %28 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %29 = extractvalue %struct.0 %28, 0
  %30 = getelementptr i8, ptr %29, i32 %p0
  %31 = load i8, ptr %30
  %32 = extractvalue %struct.1 %p2, 0 [Span: 2]
  %33 = extractvalue %struct.0 %32, 0
  %34 = getelementptr i8, ptr %33, i32 %p0
  %35 = zext i8 %31 to i32
  %36 = sub i32 0, %35
  %37 = trunc i32 %36 to i8
  store i8 %37, ptr %34
  ret void

}


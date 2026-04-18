; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: WarpAllReduceAddKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @WarpAllReduceAddKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = add i32 %p0, 1
  %1 = call i32 @ilgpu.shuffle.bfly(i32 %0, i32 16)
  %2 = add i32 %0, %1
  %3 = call i32 @ilgpu.shuffle.bfly(i32 %2, i32 8)
  %4 = add i32 %2, %3
  %5 = call i32 @ilgpu.shuffle.bfly(i32 %4, i32 4)
  %6 = add i32 %4, %5
  %7 = call i32 @ilgpu.shuffle.bfly(i32 %6, i32 2)
  %8 = add i32 %6, %7
  %9 = call i32 @ilgpu.shuffle.bfly(i32 %8, i32 1)
  %10 = extractvalue %struct.1 %p1, 2
  %11 = icmp sge i64 %10, -2147483648
  %12 = icmp sle i64 %10, 2147483647
  %13 = and i1 %11, %12
  %14 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %13, ptr %14)
  %15 = icmp sge i32 %p0, 0
  %16 = trunc i64 %10 to i32
  %17 = icmp slt i32 %p0, %16
  %18 = and i1 %15, %17
  %19 = icmp eq i32 %p0, 0
  %20 = icmp eq i32 %16, 0
  %21 = and i1 %19, %20
  %22 = or i1 %18, %21
  %23 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %22, ptr %23)
  %24 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %25 = extractvalue %struct.0 %24, 0
  %26 = getelementptr i32, ptr %25, i32 %p0
  %27 = add i32 %8, %9
  store i32 %27, ptr %26
  ret void

}


; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: NegKernel  [intptr: i64]

define void @NegKernel(i32 %p0, ptr<i16> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i16> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = icmp sge i64 %p7, -2147483648
  %1 = icmp sle i64 %p7, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  %4 = icmp sge i32 %p0, 0
  %5 = trunc i64 %p7 to i32
  %6 = icmp slt i32 %p0, %5
  %7 = and i1 %4, %6
  %8 = icmp eq i32 %p0, 0
  %9 = icmp eq i32 %5, 0
  %10 = and i1 %8, %9
  %11 = or i1 %7, %10
  %12 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  %13 = icmp sge i64 %p3, -2147483648
  %14 = icmp sle i64 %p3, 2147483647
  %15 = and i1 %13, %14
  %16 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  %17 = icmp sge i32 %p0, 0
  %18 = trunc i64 %p3 to i32
  %19 = icmp slt i32 %p0, %18
  %20 = and i1 %17, %19
  %21 = icmp eq i32 %p0, 0
  %22 = icmp eq i32 %18, 0
  %23 = and i1 %21, %22
  %24 = or i1 %20, %23
  %25 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %24, ptr %25)
  %26 = getelementptr i16, ptr %p1, i32 %p0
  %27 = load i16, ptr %26
  %28 = getelementptr i16, ptr %p5, i32 %p0
  %29 = sext i16 %27 to i32
  %30 = sub i32 0, %29
  %31 = trunc i32 %30 to i16
  store i16 %31, ptr %28
  ret void

}


; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: AndChainKernel  [intptr: i64]

define void @AndChainKernel(i32 %p0, i32 %p1, i32 %p2, i32 %p3, ptr<i32> addrspace(global) %p4, i64 %p5, i64 %p6, i8 %p7) {
entry:
  %0 = icmp sle i32 %p2, 0
  %1 = icmp sle i32 %p1, 0
  %2 = or i1 %0, %1
  %3 = icmp sle i32 %p3, 0
  %4 = or i1 %2, %3
  %5 = icmp sge i64 %p6, -2147483648
  %6 = icmp sle i64 %p6, 2147483647
  %7 = and i1 %5, %6
  %8 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %9 = icmp sge i32 %p0, 0
  %10 = trunc i64 %p6 to i32
  %11 = icmp slt i32 %p0, %10
  %12 = and i1 %9, %11
  %13 = icmp eq i32 %p0, 0
  %14 = icmp eq i32 %10, 0
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %17 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %18 = getelementptr i32, ptr %p4, i32 %p0
  %19 = icmp sge i64 %p6, -2147483648
  %20 = icmp sle i64 %p6, 2147483647
  %21 = and i1 %19, %20
  %22 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %23 = icmp sge i32 %p0, 0
  %24 = trunc i64 %p6 to i32
  %25 = icmp slt i32 %p0, %24
  %26 = and i1 %23, %25
  %27 = icmp eq i32 %p0, 0
  %28 = icmp eq i32 %24, 0
  %29 = and i1 %27, %28
  %30 = or i1 %26, %29
  %31 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %32 = getelementptr i32, ptr %p4, i32 %p0
  br i1 %4, label %bb2, label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %7, ptr %8)
  call void @ilgpu.debug.assert(i1 %16, ptr %17)
  store i32 1, ptr %18
  br label %bb3

bb2:
  call void @ilgpu.debug.assert(i1 %21, ptr %22)
  call void @ilgpu.debug.assert(i1 %30, ptr %31)
  store i32 0, ptr %32
  br label %bb3

bb3:
  ret void

}


; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: AndChainKernel  [intptr: i64]

define void @AndChainKernel(i32 %p0, i32 %p1, i32 %p2, i32 %p3, ptr<i32> addrspace(global) %p4, i64 %p5, i64 %p6, i8 %p7) {
entry:
  %0 = icmp sle i32 %p1, 0
  %1 = icmp sgt i32 %p1, 0
  %2 = icmp sle i32 %p2, 0
  %3 = and i1 %1, %2
  %4 = or i1 %0, %3
  %5 = icmp sle i32 %p3, 0
  %6 = or i1 %4, %5
  %7 = icmp sge i64 %p6, -2147483648
  %8 = icmp sle i64 %p6, 2147483647
  %9 = and i1 %7, %8
  %10 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %11 = icmp sge i32 %p0, 0
  %12 = trunc i64 %p6 to i32
  %13 = icmp slt i32 %p0, %12
  %14 = and i1 %11, %13
  %15 = icmp eq i32 %p0, 0
  %16 = icmp eq i32 %12, 0
  %17 = and i1 %15, %16
  %18 = or i1 %14, %17
  %19 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %20 = getelementptr i32, ptr %p4, i32 %p0
  %21 = icmp sge i64 %p6, -2147483648
  %22 = icmp sle i64 %p6, 2147483647
  %23 = and i1 %21, %22
  %24 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %25 = icmp sge i32 %p0, 0
  %26 = trunc i64 %p6 to i32
  %27 = icmp slt i32 %p0, %26
  %28 = and i1 %25, %27
  %29 = icmp eq i32 %p0, 0
  %30 = icmp eq i32 %26, 0
  %31 = and i1 %29, %30
  %32 = or i1 %28, %31
  %33 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %34 = getelementptr i32, ptr %p4, i32 %p0
  br i1 %6, label %bb2, label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %9, ptr %10)
  call void @ilgpu.debug.assert(i1 %18, ptr %19)
  store i32 1, ptr %20
  br label %bb3

bb2:
  call void @ilgpu.debug.assert(i1 %23, ptr %24)
  call void @ilgpu.debug.assert(i1 %32, ptr %33)
  store i32 0, ptr %34
  br label %bb3

bb3:
  ret void

}


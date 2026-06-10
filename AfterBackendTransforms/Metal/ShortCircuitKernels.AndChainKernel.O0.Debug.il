; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: AndChainKernel  [intptr: i64]

define void @AndChainKernel(i32 %p0, i32 %p1, i32 %p2, i32 %p3, ptr<i32> addrspace(global) %p4, i64 %p5, i64 %p6, i8 %p7) {
entry:
  %0 = icmp sle i32 %p1, 0
  %1 = icmp sle i32 %p2, 0
  %2 = icmp sgt i32 %p3, 0
  %3 = icmp sge i64 %p6, -2147483648
  %4 = icmp sle i64 %p6, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %p6 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %16 = getelementptr i32, ptr %p4, i32 %p0
  %17 = icmp sge i64 %p6, -2147483648
  %18 = icmp sle i64 %p6, 2147483647
  %19 = and i1 %17, %18
  %20 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %21 = icmp sge i32 %p0, 0
  %22 = trunc i64 %p6 to i32
  %23 = icmp slt i32 %p0, %22
  %24 = and i1 %21, %23
  %25 = icmp eq i32 %p0, 0
  %26 = icmp eq i32 %22, 0
  %27 = and i1 %25, %26
  %28 = or i1 %24, %27
  %29 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %30 = getelementptr i32, ptr %p4, i32 %p0
  br i1 %0, label %bb3, label %bb1

bb1:
  br i1 %1, label %bb3, label %bb2

bb2:
  br label %bb4

bb3:
  br label %bb4

bb4:
  %31 = phi i1 [ %2, %bb2 ], [ false, %bb3 ]
  %32 = xor i1 %31, -1
  br i1 %32, label %bb6, label %bb5

bb5:
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  store i32 1, ptr %16
  br label %bb7

bb6:
  call void @ilgpu.debug.assert(i1 %19, ptr %20)
  call void @ilgpu.debug.assert(i1 %28, ptr %29)
  store i32 0, ptr %30
  br label %bb7

bb7:
  ret void

}


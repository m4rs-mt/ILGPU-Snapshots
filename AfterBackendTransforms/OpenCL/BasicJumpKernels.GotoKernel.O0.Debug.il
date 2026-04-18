; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: GotoKernel  [intptr: i64]

define void @GotoKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = icmp sle i32 %p1, 5
  %1 = shl i32 %p1, 1
  %2 = icmp sge i64 %p4, -2147483648
  %3 = icmp sle i64 %p4, 2147483647
  %4 = and i1 %2, %3
  %5 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %6 = icmp sge i32 %p0, 0
  %7 = trunc i64 %p4 to i32
  %8 = icmp slt i32 %p0, %7
  %9 = and i1 %6, %8
  %10 = icmp eq i32 %p0, 0
  %11 = icmp eq i32 %7, 0
  %12 = and i1 %10, %11
  %13 = or i1 %9, %12
  %14 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %15 = getelementptr i32, ptr %p2, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %16 = phi i32 [ 0, %bb1 ], [ %1, %bb2 ]
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  call void @ilgpu.debug.assert(i1 %13, ptr %14)
  store i32 %16, ptr %15
  ret void

}


; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: PhiInliningKernel  [intptr: i64]

define void @PhiInliningKernel(i32 %p0, i32 %p1, i32 %p2, ptr<i32> addrspace(global) %p3, i64 %p4, i64 %p5, i8 %p6) {
entry:
  %0 = icmp sle i32 %p1, %p2
  %1 = sub i32 %p1, %p2
  %2 = sub i32 %p2, %p1
  %3 = icmp sge i64 %p5, -2147483648
  %4 = icmp sle i64 %p5, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %p5 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %16 = getelementptr i32, ptr %p3, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %17 = phi i32 [ %1, %bb1 ], [ %2, %bb2 ]
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  store i32 %17, ptr %16
  ret void

}


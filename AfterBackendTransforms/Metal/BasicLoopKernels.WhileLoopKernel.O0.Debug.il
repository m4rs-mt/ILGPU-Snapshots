; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: WhileLoopKernel  [intptr: i64]

define void @WhileLoopKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = icmp sge i64 %p3, -2147483648
  %1 = icmp sle i64 %p3, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %4 = icmp sge i32 %p0, 0
  %5 = trunc i64 %p3 to i32
  %6 = icmp slt i32 %p0, %5
  %7 = and i1 %4, %6
  %8 = icmp eq i32 %p0, 0
  %9 = icmp eq i32 %5, 0
  %10 = and i1 %8, %9
  %11 = or i1 %7, %10
  %12 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %13 = getelementptr i32, ptr %p1, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %14 = phi i32 [ 0, %bb1 ], [ %16, %bb4 ]
  %15 = phi i32 [ 0, %bb1 ], [ %17, %bb4 ]
  %16 = add i32 %14, 1
  %17 = add i32 %15, %14
  %18 = icmp slt i32 %14, 10
  br i1 %18, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  store i32 %15, ptr %13
  ret void

bb4:
  br label %bb2

}


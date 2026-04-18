; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: SwitchMapKernel  [intptr: i64]

define void @SwitchMapKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = icmp sge i64 %p4, -2147483648
  %1 = icmp sle i64 %p4, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %4 = icmp sge i32 %p0, 0
  %5 = trunc i64 %p4 to i32
  %6 = icmp slt i32 %p0, %5
  %7 = and i1 %4, %6
  %8 = icmp eq i32 %p0, 0
  %9 = icmp eq i32 %5, 0
  %10 = and i1 %8, %9
  %11 = or i1 %7, %10
  %12 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %13 = getelementptr i32, ptr %p2, i32 %p0
  switch i32 %p1, label %bb5 [
    i32 0, label %bb4
    i32 1, label %bb3
    i32 2, label %bb2
    i32 3, label %bb1
  ]

bb1:
  br label %bb7

bb2:
  br label %bb7

bb3:
  br label %bb7

bb4:
  br label %bb7

bb5:
  br label %bb6

bb6:
  br label %bb7

bb7:
  %14 = phi i32 [ 40, %bb1 ], [ 30, %bb2 ], [ 20, %bb3 ], [ 10, %bb4 ], [ -1, %bb6 ]
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  store i32 %14, ptr %13
  ret void

}


; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: AllBuiltinsKernel  [intptr: i64]

define void @AllBuiltinsKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = icmp sge i64 %p3, -2147483648
  %1 = icmp sle i64 %p3, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  %4 = icmp sge i32 %p0, 0
  %5 = trunc i64 %p3 to i32
  %6 = icmp slt i32 %p0, %5
  %7 = and i1 %4, %6
  %8 = icmp eq i32 %p0, 0
  %9 = icmp eq i32 %5, 0
  %10 = and i1 %8, %9
  %11 = or i1 %7, %10
  %12 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  %13 = call i32 @ilgpu.group.index()
  %14 = call i32 @ilgpu.grid.index()
  %15 = call i32 @ilgpu.group.dim()
  %16 = call i32 @ilgpu.grid.dim()
  %17 = call i32 @ComputeGlobalIndex(i32 %13, i32 %14, i32 %15, i32 %16)
  %18 = getelementptr i32, ptr %p1, i32 %p0
  store i32 %17, ptr %18
  ret void

}

define i32 @ComputeGlobalIndex(i32 %p0, i32 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = mul i32 %p1, %p2
  %1 = add i32 %0, %p0
  %2 = mul i32 %p3, %p2
  %3 = icmp slt i32 %1, %2
  %4 = sub i32 %2, 1
  br i1 %3, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %5 = phi i32 [ %4, %bb1 ], [ %1, %bb2 ]
  ret i32 %5

}


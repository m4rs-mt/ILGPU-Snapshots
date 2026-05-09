; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
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
  %13 = call i32 @ComputeGlobalIndex()
  %14 = getelementptr i32, ptr %p1, i32 %p0
  store i32 %13, ptr %14
  ret void

}

define i32 @ComputeGlobalIndex() {
entry:
  %0 = call i32 @ilgpu.grid.index()
  %1 = call i32 @ilgpu.group.dim()
  %2 = mul i32 %0, %1
  %3 = call i32 @ilgpu.group.index()
  %4 = add i32 %2, %3
  %5 = call i32 @ilgpu.grid.dim()
  %6 = mul i32 %5, %1
  %7 = icmp slt i32 %4, %6
  %8 = sub i32 %6, 1
  %9 = select i1 %7, i32 %4, i32 %8
  ret i32 %9

}


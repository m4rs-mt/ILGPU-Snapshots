; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: WarpAllReduceAddKernel  [intptr: i64]

define void @WarpAllReduceAddKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = add i32 %p0, 1
  %1 = call i32 @ilgpu.warp.reduce.AllReduce.Add(i32 %0)
  %2 = icmp sge i64 %p3, -2147483648
  %3 = icmp sle i64 %p3, 2147483647
  %4 = and i1 %2, %3
  %5 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  %6 = icmp sge i32 %p0, 0
  %7 = trunc i64 %p3 to i32
  %8 = icmp slt i32 %p0, %7
  %9 = and i1 %6, %8
  %10 = icmp eq i32 %p0, 0
  %11 = icmp eq i32 %7, 0
  %12 = and i1 %10, %11
  %13 = or i1 %9, %12
  %14 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %13, ptr %14)
  %15 = getelementptr i32, ptr %p1, i32 %p0
  store i32 %1, ptr %15
  ret void

}


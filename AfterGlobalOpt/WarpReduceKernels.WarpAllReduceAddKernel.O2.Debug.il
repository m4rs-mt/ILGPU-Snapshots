; stage: AfterGlobalOpt  opt: O2
; module: WarpAllReduceAddKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @WarpAllReduceAddKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = add i32 %p0, 1
  %1 = call i32 @ilgpu.warp.reduce.AllReduce.Add(i32 %0)
  %2 = extractvalue %struct.0 %p1, 1
  %3 = icmp sge i64 %2, -2147483648
  %4 = icmp sle i64 %2, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %2 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  %16 = extractvalue %struct.0 %p1, 0
  %17 = getelementptr i32, ptr %16, i32 %p0
  store i32 %1, ptr %17
  ret void

}


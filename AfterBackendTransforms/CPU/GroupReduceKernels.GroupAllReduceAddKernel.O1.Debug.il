; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: GroupAllReduceAddKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @GroupAllReduceAddKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 8)
  %1 = call i32 @ilgpu.subgroup.lane()
  %2 = getelementptr i32, ptr %0, i32 %1
  store i32 0, ptr %2
  call void @ilgpu.barrier.group()
  %3 = call i32 @ilgpu.warp.reduce.AllReduce.Add(i32 1)
  %4 = call i32 @ilgpu.subgroup.index()
  %5 = getelementptr i32, ptr %0, i32 %4
  store i32 %3, ptr %5
  call void @ilgpu.barrier.group()
  %6 = getelementptr i32, ptr %0, i32 %1
  %7 = load i32, ptr %6
  %8 = call i32 @ilgpu.warp.reduce.AllReduce.Add(i32 %7)
  %9 = extractvalue %struct.0 %p1, 1
  %10 = icmp sge i64 %9, -2147483648
  %11 = icmp sle i64 %9, 2147483647
  %12 = and i1 %10, %11
  %13 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  %14 = icmp sge i32 %p0, 0
  %15 = trunc i64 %9 to i32
  %16 = icmp slt i32 %p0, %15
  %17 = and i1 %14, %16
  %18 = icmp eq i32 %p0, 0
  %19 = icmp eq i32 %15, 0
  %20 = and i1 %18, %19
  %21 = or i1 %17, %20
  %22 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %21, ptr %22)
  %23 = extractvalue %struct.0 %p1, 0
  %24 = getelementptr i32, ptr %23, i32 %p0
  store i32 %8, ptr %24
  ret void

}


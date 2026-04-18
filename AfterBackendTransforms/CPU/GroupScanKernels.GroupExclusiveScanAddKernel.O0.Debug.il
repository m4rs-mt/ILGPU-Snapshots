; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: GroupExclusiveScanAddKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @GroupExclusiveScanAddKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 8)
  %1 = call i32 @ilgpu.subgroup.lane()
  %2 = getelementptr i32, ptr %0, i32 %1
  store i32 0, ptr %2
  call void @ilgpu.barrier.group()
  %3 = call i32 @ilgpu.warp.scan.Exclusive.Add(i32 1)
  %4 = call i32 @ilgpu.warp.reduce.AllReduce.Add(i32 1)
  %5 = call i32 @ilgpu.subgroup.index()
  %6 = getelementptr i32, ptr %0, i32 %5
  store i32 %4, ptr %6
  call void @ilgpu.barrier.group()
  %7 = getelementptr i32, ptr %0, i32 %1
  %8 = load i32, ptr %7
  %9 = call i32 @ilgpu.warp.scan.Exclusive.Add(i32 %8)
  %10 = call i32 @ilgpu.shuffle.idx(i32 %9, i32 %5)
  %11 = extractvalue %struct.0 %p1, 1
  %12 = icmp sge i64 %11, -2147483648
  %13 = icmp sle i64 %11, 2147483647
  %14 = and i1 %12, %13
  %15 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  %16 = icmp sge i32 %p0, 0
  %17 = trunc i64 %11 to i32
  %18 = icmp slt i32 %p0, %17
  %19 = and i1 %16, %18
  %20 = icmp eq i32 %p0, 0
  %21 = icmp eq i32 %17, 0
  %22 = and i1 %20, %21
  %23 = or i1 %19, %22
  %24 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %23, ptr %24)
  %25 = extractvalue %struct.0 %p1, 0
  %26 = getelementptr i32, ptr %25, i32 %p0
  %27 = add i32 %10, %3
  store i32 %27, ptr %26
  ret void

}


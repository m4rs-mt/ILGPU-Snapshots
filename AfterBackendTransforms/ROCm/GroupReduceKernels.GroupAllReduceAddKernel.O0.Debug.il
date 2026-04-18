; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: GroupAllReduceAddKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%view.i32 = view i32

@g0 = internal global i32 zeroinitializer ; shared

define void @GroupAllReduceAddKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 32)
  %1 = call i32 @ilgpu.subgroup.lane()
  %2 = getelementptr i32, ptr %0, i32 %1
  store i32 0, ptr %2
  call void @ilgpu.barrier.group()
  %3 = call i32 @ilgpu.subgroup.index()
  %4 = getelementptr i32, ptr %0, i32 %3
  store i32 32, ptr %4
  call void @ilgpu.barrier.group()
  %5 = getelementptr i32, ptr %0, i32 %1
  %6 = load i32, ptr %5
  %7 = call i32 @ilgpu.shuffle.bfly(i32 %6, i32 16)
  %8 = add i32 %6, %7
  %9 = call i32 @ilgpu.shuffle.bfly(i32 %8, i32 8)
  %10 = add i32 %8, %9
  %11 = call i32 @ilgpu.shuffle.bfly(i32 %10, i32 4)
  %12 = add i32 %10, %11
  %13 = call i32 @ilgpu.shuffle.bfly(i32 %12, i32 2)
  %14 = add i32 %12, %13
  %15 = call i32 @ilgpu.shuffle.bfly(i32 %14, i32 1)
  %16 = extractvalue %struct.1 %p1, 2
  %17 = icmp sge i64 %16, -2147483648
  %18 = icmp sle i64 %16, 2147483647
  %19 = and i1 %17, %18
  %20 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %19, ptr %20)
  %21 = icmp sge i32 %p0, 0
  %22 = trunc i64 %16 to i32
  %23 = icmp slt i32 %p0, %22
  %24 = and i1 %21, %23
  %25 = icmp eq i32 %p0, 0
  %26 = icmp eq i32 %22, 0
  %27 = and i1 %25, %26
  %28 = or i1 %24, %27
  %29 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %28, ptr %29)
  %30 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %31 = extractvalue %struct.0 %30, 0
  %32 = getelementptr i32, ptr %31, i32 %p0
  %33 = add i32 %14, %15
  store i32 %33, ptr %32
  ret void

}


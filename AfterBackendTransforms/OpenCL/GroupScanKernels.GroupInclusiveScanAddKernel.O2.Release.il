; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: GroupInclusiveScanAddKernel  [intptr: i64]

%view.i32 = view i32

@g0 = internal global i32 zeroinitializer ; shared

define void @GroupInclusiveScanAddKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 16)
  %1 = call i32 @ilgpu.subgroup.lane()
  %2 = getelementptr i32, ptr %0, i32 %1
  store i32 0, ptr %2
  call void @ilgpu.barrier.group()
  %3 = call i32 @ilgpu.warp.scan.Inclusive.Add(i32 1)
  %4 = call i32 @ilgpu.warp.reduce.AllReduce.Add(i32 1)
  %5 = call i32 @ilgpu.subgroup.index()
  %6 = getelementptr i32, ptr %0, i32 %5
  store i32 %4, ptr %6
  call void @ilgpu.barrier.group()
  %7 = getelementptr i32, ptr %0, i32 %1
  %8 = load i32, ptr %7
  %9 = call i32 @ilgpu.warp.scan.Exclusive.Add(i32 %8)
  %10 = call i32 @ilgpu.shuffle.idx(i32 %9, i32 %5)
  %11 = getelementptr i32, ptr %p1, i32 %p0
  %12 = add i32 %10, %3
  store i32 %12, ptr %11
  ret void

}


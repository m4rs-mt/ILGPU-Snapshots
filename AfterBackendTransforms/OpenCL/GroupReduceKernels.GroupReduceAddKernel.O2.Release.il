; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: GroupReduceAddKernel  [intptr: i64]

%view.i32 = view i32

@g0 = internal global i32 zeroinitializer ; shared

define void @GroupReduceAddKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 16)
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
  %8 = call i32 @ilgpu.warp.reduce.Reduce.Add(i32 %7)
  %9 = getelementptr i32, ptr %p1, i32 %p0
  store i32 %8, ptr %9
  ret void

}


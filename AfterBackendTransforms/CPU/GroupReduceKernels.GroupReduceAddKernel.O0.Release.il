; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: GroupReduceAddKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @GroupReduceAddKernel(i32 %p0, %struct.0 %p1) {
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
  %8 = call i32 @ilgpu.warp.reduce.Reduce.Add(i32 %7)
  %9 = extractvalue %struct.0 %p1, 0
  %10 = getelementptr i32, ptr %9, i32 %p0
  store i32 %8, ptr %10
  ret void

}


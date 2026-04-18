; stage: AfterBackendTransforms  backend: CPU  opt: O1
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
  %11 = extractvalue %struct.0 %p1, 0
  %12 = getelementptr i32, ptr %11, i32 %p0
  %13 = add i32 %10, %3
  store i32 %13, ptr %12
  ret void

}


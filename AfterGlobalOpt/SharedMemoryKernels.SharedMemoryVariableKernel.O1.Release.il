; stage: AfterGlobalOpt  opt: O1
; module: SharedMemoryVariableKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedMemoryVariableKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 32)
  %3 = getelementptr i32, ptr %2, i32 %0
  %4 = shl i32 %0, 1
  %5 = icmp sge i32 %0, 32
  %6 = getelementptr i32, ptr %2, i32 %0
  %7 = extractvalue %struct.0 %p1, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %4, ptr %3
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %5, label %bb4, label %bb3

bb3:
  %9 = load i32, ptr %6
  store i32 %9, ptr %8
  br label %bb4

bb4:
  ret void

}


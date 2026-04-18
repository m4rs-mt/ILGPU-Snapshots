; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: SharedMemoryVariableKernel  [intptr: i64]

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedMemoryVariableKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = getelementptr i32, ptr @g0, i32 %0
  %3 = shl i32 %0, 1
  %4 = icmp sge i32 %0, 32
  %5 = getelementptr i32, ptr @g0, i32 %0
  %6 = getelementptr i32, ptr %p1, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %3, ptr %2
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %4, label %bb4, label %bb3

bb3:
  %7 = load i32, ptr %5
  store i32 %7, ptr %6
  br label %bb4

bb4:
  ret void

}


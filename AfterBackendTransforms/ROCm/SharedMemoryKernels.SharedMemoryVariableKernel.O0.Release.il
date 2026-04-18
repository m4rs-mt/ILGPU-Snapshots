; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: SharedMemoryVariableKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedMemoryVariableKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = getelementptr i32, ptr @g0, i32 %0
  %3 = shl i32 %0, 1
  %4 = icmp sge i32 %0, 32
  %5 = getelementptr i32, ptr @g0, i32 %0
  %6 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %7 = extractvalue %struct.0 %6, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %3, ptr %2
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %4, label %bb4, label %bb3

bb3:
  %9 = load i32, ptr %5
  store i32 %9, ptr %8
  br label %bb4

bb4:
  ret void

}


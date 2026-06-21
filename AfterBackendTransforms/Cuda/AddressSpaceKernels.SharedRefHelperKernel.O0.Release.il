; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: SharedRefHelperKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedRefHelperKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = getelementptr i32, ptr @g0, i32 %0
  %3 = mul i32 %p0, 10
  %4 = getelementptr i32, ptr @g0, i32 %0
  %5 = icmp sge i32 %0, 32
  %6 = getelementptr i32, ptr @g0, i32 %0
  %7 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %8 = extractvalue %struct.0 %7, 0
  %9 = getelementptr i32, ptr %8, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %3, ptr %2
  call void @Increment(ptr<i32> addrspace(shared) %4)
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %5, label %bb4, label %bb3

bb3:
  %10 = load i32, ptr %6
  store i32 %10, ptr %9
  br label %bb4

bb4:
  ret void

}

define void @Increment(ptr<i32> addrspace(shared) %p0) {
entry:
  %0 = load i32, ptr %p0
  %1 = add i32 %0, 1
  store i32 %1, ptr %p0
  ret void

}


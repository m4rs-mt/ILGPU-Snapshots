; stage: AfterBackendTransforms  backend: Cuda  opt: O2
; module: SharedPointerLoopKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedPointerLoopKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = getelementptr i32, ptr @g0, i32 %0
  %3 = add i32 %0, 1
  %4 = extractvalue %struct.0 %p1, 0
  %5 = getelementptr i32, ptr %4, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %3, ptr %2
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br label %bb3

bb3:
  %6 = phi i32 [ 0, %bb2 ], [ %9, %bb5 ]
  %7 = phi i32 [ 0, %bb2 ], [ %13, %bb5 ]
  %8 = phi ptr<i32> addrspace(shared) [ @g0, %bb2 ], [ %10, %bb5 ]
  %9 = add i32 %6, 1
  %10 = getelementptr i32, ptr %8, i32 1
  %11 = icmp sle i32 %6, %0
  br i1 %11, label %bb5, label %bb4

bb4:
  store i32 %7, ptr %5
  ret void

bb5:
  %12 = load i32, ptr %8
  %13 = add i32 %7, %12
  br label %bb3

}


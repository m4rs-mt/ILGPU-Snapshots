; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: SharedPointerLoopKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedPointerLoopKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = getelementptr i32, ptr @g0, i32 %0
  %3 = add i32 %0, 1
  %4 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %5 = extractvalue %struct.0 %4, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %3, ptr %2
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br label %bb3

bb3:
  %7 = phi i32 [ 0, %bb2 ], [ %10, %bb5 ]
  %8 = phi i32 [ 0, %bb2 ], [ %14, %bb5 ]
  %9 = phi ptr<i32> addrspace(shared) [ @g0, %bb2 ], [ %11, %bb5 ]
  %10 = add i32 %7, 1
  %11 = getelementptr i32, ptr %9, i32 1
  %12 = icmp sle i32 %7, %0
  br i1 %12, label %bb5, label %bb4

bb4:
  store i32 %8, ptr %6
  ret void

bb5:
  %13 = load i32, ptr %9
  %14 = add i32 %8, %13
  br label %bb3

}


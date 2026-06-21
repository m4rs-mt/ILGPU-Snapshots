; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: SharedPointerLoopKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedPointerLoopKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 32)
  %3 = getelementptr i32, ptr %2, i32 %0
  %4 = add i32 %0, 1
  %5 = getelementptr i32, ptr %2, i32 0
  %6 = extractvalue %struct.0 %p1, 0
  %7 = getelementptr i32, ptr %6, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %4, ptr %3
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br label %bb3

bb3:
  %8 = phi i32 [ 0, %bb2 ], [ %11, %bb5 ]
  %9 = phi i32 [ 0, %bb2 ], [ %15, %bb5 ]
  %10 = phi ptr<i32> addrspace(shared) [ %5, %bb2 ], [ %12, %bb5 ]
  %11 = add i32 %8, 1
  %12 = getelementptr i32, ptr %10, i32 1
  %13 = icmp sle i32 %8, %0
  br i1 %13, label %bb5, label %bb4

bb4:
  store i32 %9, ptr %7
  ret void

bb5:
  %14 = load i32, ptr %10
  %15 = add i32 %9, %14
  br label %bb3

}


; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: SharedPointerLoopKernel  [intptr: i64]

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedPointerLoopKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = getelementptr i32, ptr @g0, i32 %0
  %3 = add i32 %0, 1
  %4 = getelementptr i32, ptr %p1, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %3, ptr %2
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br label %bb3

bb3:
  %5 = phi i32 [ 0, %bb2 ], [ %8, %bb5 ]
  %6 = phi i32 [ 0, %bb2 ], [ %12, %bb5 ]
  %7 = phi ptr<i32> addrspace(shared) [ @g0, %bb2 ], [ %9, %bb5 ]
  %8 = add i32 %5, 1
  %9 = getelementptr i32, ptr %7, i32 1
  %10 = icmp sle i32 %5, %0
  br i1 %10, label %bb5, label %bb4

bb4:
  store i32 %6, ptr %4
  ret void

bb5:
  %11 = load i32, ptr %7
  %12 = add i32 %6, %11
  br label %bb3

}


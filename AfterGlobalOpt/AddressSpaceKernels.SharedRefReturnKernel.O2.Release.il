; stage: AfterGlobalOpt  opt: O2
; module: SharedRefReturnKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedRefReturnKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 33)
  %3 = add i32 %0, 1
  %4 = getelementptr i32, ptr %2, i32 %3
  %5 = getelementptr i32, ptr %2, i32 %0
  %6 = add i32 %p0, 100
  %7 = icmp sge i32 %0, 32
  %8 = add i32 %0, 1
  %9 = getelementptr i32, ptr %2, i32 %8
  %10 = extractvalue %struct.0 %p1, 0
  %11 = getelementptr i32, ptr %10, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 0, ptr %4
  %12 = call ptr<i32> @Next(ptr<i32> addrspace(shared) %5)
  store i32 %6, ptr %12
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %7, label %bb4, label %bb3

bb3:
  %13 = load i32, ptr %9
  store i32 %13, ptr %11
  br label %bb4

bb4:
  ret void

}

define ptr<i32> @Next(ptr<i32> addrspace(shared) %p0) {
entry:
  %0 = getelementptr i32, ptr %p0, i32 1
  %1 = addrspacecast ptr %0 to ptr<i32>
  ret ptr<i32> %1

}


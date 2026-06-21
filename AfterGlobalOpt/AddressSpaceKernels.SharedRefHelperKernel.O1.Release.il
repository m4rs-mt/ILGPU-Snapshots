; stage: AfterGlobalOpt  opt: O1
; module: SharedRefHelperKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedRefHelperKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 32)
  %3 = getelementptr i32, ptr %2, i32 %0
  %4 = mul i32 %p0, 10
  %5 = getelementptr i32, ptr %2, i32 %0
  %6 = icmp sge i32 %0, 32
  %7 = getelementptr i32, ptr %2, i32 %0
  %8 = extractvalue %struct.0 %p1, 0
  %9 = getelementptr i32, ptr %8, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %4, ptr %3
  call void @Increment(ptr<i32> addrspace(shared) %5)
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %6, label %bb4, label %bb3

bb3:
  %10 = load i32, ptr %7
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


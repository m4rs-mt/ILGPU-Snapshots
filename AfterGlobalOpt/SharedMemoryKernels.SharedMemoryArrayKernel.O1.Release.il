; stage: AfterGlobalOpt  opt: O1
; module: SharedMemoryArrayKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedMemoryArrayKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 64
  %2 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 64)
  %3 = getelementptr i32, ptr %2, i32 %0
  %4 = icmp sge i32 %0, 64
  %5 = add i32 %0, 1
  %6 = call i32 @ilgpu.group.dim()
  %7 = srem i32 %5, %6
  %8 = icmp sge i32 %7, 64
  %9 = getelementptr i32, ptr %2, i32 %7
  %10 = extractvalue %struct.0 %p1, 0
  %11 = getelementptr i32, ptr %10, i32 %p0
  %12 = getelementptr i32, ptr %2, i32 %0
  %13 = extractvalue %struct.0 %p1, 0
  %14 = getelementptr i32, ptr %13, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %p0, ptr %3
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %4, label %bb7, label %bb3

bb3:
  br i1 %8, label %bb5, label %bb4

bb4:
  %15 = load i32, ptr %9
  store i32 %15, ptr %11
  br label %bb6

bb5:
  %16 = load i32, ptr %12
  store i32 %16, ptr %14
  br label %bb6

bb6:
  br label %bb7

bb7:
  ret void

}


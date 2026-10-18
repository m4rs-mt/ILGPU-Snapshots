; stage: AfterGlobalOpt  opt: O1
; module: MixedSpaceRefKernel  [intptr: i64]

%struct.0 = type { view<i32>, i64, i8 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @MixedSpaceRefKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 32)
  %3 = getelementptr i32, ptr %2, i32 %0
  %4 = add i32 %0, 1
  %5 = mul i32 %4, 10
  %6 = extractvalue %struct.1 %p1, 0
  %7 = getelementptr i32, ptr %6, i32 %p0
  %8 = icmp sge i32 %0, 32
  %9 = icmp slt i32 %0, 32
  %10 = srem i32 %0, 2
  %11 = icmp eq i32 %10, 0
  %12 = and i1 %9, %11
  %13 = getelementptr i32, ptr %2, i32 %0
  %14 = addrspacecast ptr %13 to ptr<i32>
  %15 = extractvalue %struct.1 %p1, 0
  %16 = getelementptr i32, ptr %15, i32 %p0
  %17 = addrspacecast ptr %16 to ptr<i32>
  %18 = select i1 %12, ptr<i32> %14, ptr<i32> %17
  %19 = icmp sge i32 %0, 32
  %20 = getelementptr i32, ptr %2, i32 %0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %5, ptr %3
  br label %bb2

bb2:
  store i32 %p0, ptr %7
  call void @ilgpu.barrier.group()
  br i1 %8, label %bb4, label %bb3

bb3:
  %21 = load i32, ptr %18
  %22 = add i32 %21, 1
  store i32 %22, ptr %18
  br label %bb4

bb4:
  %23 = phi %struct.1 [ %p1, %bb2 ], [ %p1, %bb3 ]
  call void @ilgpu.barrier.group()
  %24 = extractvalue %struct.1 %23, 0
  %25 = getelementptr i32, ptr %24, i32 %p0
  br i1 %19, label %bb6, label %bb5

bb5:
  %26 = load i32, ptr %25
  %27 = load i32, ptr %20
  %28 = add i32 %26, %27
  store i32 %28, ptr %25
  br label %bb6

bb6:
  ret void

}


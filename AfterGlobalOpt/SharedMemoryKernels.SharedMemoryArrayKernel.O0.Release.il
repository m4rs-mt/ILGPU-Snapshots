; stage: AfterGlobalOpt  opt: O0
; module: SharedMemoryArrayKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { view<i32>, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedMemoryArrayKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = call i32 @ilgpu.group.index()
  %2 = icmp sge i32 %1, 64
  %3 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 64)
  %4 = getelementptr i32, ptr %3, i32 %1
  %5 = icmp sge i32 %1, 64
  %6 = add i32 %1, 1
  %7 = call i32 @ilgpu.group.dim()
  %8 = srem i32 %6, %7
  %9 = icmp sge i32 %8, 64
  %10 = addrspacecast ptr %0 to ptr<%struct.1>
  %11 = getelementptr i32, ptr %3, i32 %8
  %12 = getelementptr i32, ptr %3, i32 %1
  br i1 %2, label %bb2, label %bb1

bb1:
  store i32 %p0, ptr %4
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %5, label %bb7, label %bb3

bb3:
  br i1 %9, label %bb5, label %bb4

bb4:
  %13 = call %view.i32 @get_BaseView(ptr<%struct.1> %10)
  %14 = call i32 @ComputeLinearIndex(ptr<%struct.1> %10, i32 %p0)
  %15 = load i32, ptr %11
  %16 = getelementptr i32, ptr %13, i32 %14
  store i32 %15, ptr %16
  br label %bb6

bb5:
  %17 = call %view.i32 @get_BaseView(ptr<%struct.1> %10)
  %18 = call i32 @ComputeLinearIndex(ptr<%struct.1> %10, i32 %p0)
  %19 = load i32, ptr %12
  %20 = getelementptr i32, ptr %17, i32 %18
  store i32 %19, ptr %20
  br label %bb6

bb6:
  br label %bb7

bb7:
  ret void

}

define i32 @ComputeLinearIndex(ptr<%struct.0> %p0, i32 %p1) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = call i64 @get_Extent(ptr<%struct.0> %p0)
  store i64 %3, ptr %2
  %4 = addrspacecast ptr %2 to ptr<i64>
  %5 = call i32 @ToIntIndex(ptr<i64> %4)
  %6 = call i32 @ComputeElementIndexChecked(i8 %1, i32 %p1, i32 %5)
  ret i32 %6

}

define i32 @ComputeElementIndexChecked(i8 %p0, i32 %p1, i32 %p2) {
entry:
  %0 = alloca i8, i32 1
  store i8 %p0, ptr %0
  %1 = alloca i32, i32 1
  store i32 %p1, ptr %1
  %2 = addrspacecast ptr %1 to ptr<i32>
  %3 = call i32 @get_X(ptr<i32> %2)
  %4 = addrspacecast ptr %0 to ptr<i8>
  %5 = call i32 @get_XStride(ptr<i8> %4)
  %6 = mul i32 %3, %5
  ret i32 %6

}

define i32 @get_XStride(ptr<i8> %p0) {
entry:
  ret i32 1

}

define i32 @get_X(ptr<i32> %p0) {
entry:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define i32 @ToIntIndex(ptr<i64> %p0) {
entry:
  %0 = load i64, ptr %p0
  %1 = load i64, ptr %p0
  %2 = trunc i64 %1 to i32
  ret i32 %2

}

define i64 @get_Extent(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.i32 @get_BaseView(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

}


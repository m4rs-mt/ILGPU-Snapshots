; stage: AfterGlobalOpt  opt: O0
; module: DeepChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { view<i32>, i64, i8 }

define void @DeepChainKernel(i32 %p0, %struct.1 %p1, i32 %p2) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = and i32 %p2, 1
  %2 = icmp eq i32 %1, 0
  %3 = and i32 %p2, 2
  %4 = icmp eq i32 %3, 0
  %5 = and i32 %p2, 4
  %6 = icmp eq i32 %5, 0
  %7 = and i32 %p2, 8
  %8 = icmp eq i32 %7, 0
  %9 = and i32 %p2, 16
  %10 = icmp eq i32 %9, 0
  %11 = and i32 %p2, 32
  %12 = icmp eq i32 %11, 0
  %13 = and i32 %p2, 64
  %14 = icmp eq i32 %13, 0
  %15 = and i32 %p2, 128
  %16 = icmp eq i32 %15, 0
  %17 = and i32 %p2, 256
  %18 = icmp eq i32 %17, 0
  %19 = and i32 %p2, 512
  %20 = icmp ugt i32 %19, 0
  %21 = addrspacecast ptr %0 to ptr<%struct.1>
  %22 = addrspacecast ptr %0 to ptr<%struct.1>
  br i1 %2, label %bb10, label %bb1

bb1:
  br i1 %4, label %bb10, label %bb2

bb2:
  br i1 %6, label %bb10, label %bb3

bb3:
  br i1 %8, label %bb10, label %bb4

bb4:
  br i1 %10, label %bb10, label %bb5

bb5:
  br i1 %12, label %bb10, label %bb6

bb6:
  br i1 %14, label %bb10, label %bb7

bb7:
  br i1 %16, label %bb10, label %bb8

bb8:
  br i1 %18, label %bb10, label %bb9

bb9:
  br label %bb11

bb10:
  br label %bb11

bb11:
  %23 = phi i1 [ %20, %bb9 ], [ false, %bb10 ]
  %24 = xor i1 %23, -1
  br i1 %24, label %bb13, label %bb12

bb12:
  %25 = call %view.i32 @get_BaseView(ptr<%struct.1> %21)
  %26 = call i32 @ComputeLinearIndex(ptr<%struct.1> %21, i32 %p0)
  %27 = getelementptr i32, ptr %25, i32 %26
  store i32 1, ptr %27
  br label %bb14

bb13:
  %28 = call %view.i32 @get_BaseView(ptr<%struct.1> %22)
  %29 = call i32 @ComputeLinearIndex(ptr<%struct.1> %22, i32 %p0)
  %30 = getelementptr i32, ptr %28, i32 %29
  store i32 0, ptr %30
  br label %bb14

bb14:
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


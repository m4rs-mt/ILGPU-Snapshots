; stage: AfterGlobalOpt  opt: O0
; module: TwoClosuresCrossBlockKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { view<i32>, i64, i8 }
%struct.2 = type { i32, i32 }

@g0 = internal global %struct.2 zeroinitializer ; local

define void @TwoClosuresCrossBlockKernel(i32 %p0, %struct.1 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = call ptr<%struct.2> addrspace(local) @ilgpu.gc_init(@g0)
  %2 = getelementptr inbounds %struct.2, ptr %1, i32 0, i32 0
  store i32 %p2, ptr %2
  %3 = getelementptr inbounds %struct.2, ptr %1, i32 0, i32 1
  store i32 %p3, ptr %3
  %4 = addrspacecast ptr %0 to ptr<%struct.1>
  %5 = call %view.i32 @get_BaseView(ptr<%struct.1> %4)
  %6 = call i32 @ComputeLinearIndex(ptr<%struct.1> %4, i32 %p0)
  %7 = icmp sgt i32 %p0, 0
  %8 = getelementptr inbounds %struct.2, ptr %1, i32 0, i32 0
  %9 = getelementptr inbounds %struct.2, ptr %1, i32 0, i32 0
  %10 = icmp sgt i32 %p0, 0
  %11 = getelementptr inbounds %struct.2, ptr %1, i32 0, i32 1
  %12 = getelementptr inbounds %struct.2, ptr %1, i32 0, i32 1
  %13 = getelementptr i32, ptr %5, i32 %6
  br i1 %7, label %bb2, label %bb1

bb1:
  %14 = load i32, ptr %8
  br label %bb4

bb2:
  br label %bb3

bb3:
  br label %bb4

bb4:
  %15 = phi i32 [ %14, %bb1 ], [ %p0, %bb3 ]
  %16 = load i32, ptr %9
  %17 = add i32 %15, %16
  br i1 %10, label %bb6, label %bb5

bb5:
  %18 = load i32, ptr %11
  br label %bb8

bb6:
  br label %bb7

bb7:
  br label %bb8

bb8:
  %19 = phi i32 [ %18, %bb5 ], [ %p0, %bb7 ]
  %20 = load i32, ptr %12
  %21 = mul i32 %19, %20
  %22 = add i32 %17, %21
  store i32 %22, ptr %13
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


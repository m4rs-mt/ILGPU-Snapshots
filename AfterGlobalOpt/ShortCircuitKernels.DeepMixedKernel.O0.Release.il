; stage: AfterGlobalOpt  opt: O0
; module: DeepMixedKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { view<i32>, i64, i8 }

define void @DeepMixedKernel(i32 %p0, %struct.1 %p1, i32 %p2, i32 %p3, i32 %p4, i32 %p5, i32 %p6) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = icmp sle i32 %p2, 0
  %2 = icmp sgt i32 %p3, 0
  %3 = icmp sgt i32 %p4, 0
  %4 = icmp sle i32 %p5, 0
  %5 = icmp sgt i32 %p6, 0
  %6 = addrspacecast ptr %0 to ptr<%struct.1>
  %7 = addrspacecast ptr %0 to ptr<%struct.1>
  br i1 %1, label %bb4, label %bb1

bb1:
  br i1 %2, label %bb3, label %bb2

bb2:
  br i1 %3, label %bb3, label %bb4

bb3:
  br label %bb8

bb4:
  br i1 %4, label %bb6, label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %8 = phi i1 [ %5, %bb5 ], [ false, %bb6 ]
  %9 = select i1 %8, i32 1, i32 0
  br label %bb8

bb8:
  %10 = phi i32 [ 1, %bb3 ], [ %9, %bb7 ]
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %bb10, label %bb9

bb9:
  %12 = call %view.i32 @get_BaseView(ptr<%struct.1> %6)
  %13 = call i32 @ComputeLinearIndex(ptr<%struct.1> %6, i32 %p0)
  %14 = getelementptr i32, ptr %12, i32 %13
  store i32 1, ptr %14
  br label %bb11

bb10:
  %15 = call %view.i32 @get_BaseView(ptr<%struct.1> %7)
  %16 = call i32 @ComputeLinearIndex(ptr<%struct.1> %7, i32 %p0)
  %17 = getelementptr i32, ptr %15, i32 %16
  store i32 0, ptr %17
  br label %bb11

bb11:
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


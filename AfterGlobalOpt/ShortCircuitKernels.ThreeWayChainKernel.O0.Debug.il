; stage: AfterGlobalOpt  opt: O0
; module: ThreeWayChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { view<i32>, i64, i8 }

define void @ThreeWayChainKernel(i32 %p0, %struct.1 %p1, i32 %p2, i32 %p3, i32 %p4) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = icmp sgt i32 %p2, 0
  %2 = icmp sgt i32 %p3, 0
  %3 = addrspacecast ptr %0 to ptr<%struct.1>
  %4 = icmp sle i32 %p4, 0
  %5 = addrspacecast ptr %0 to ptr<%struct.1>
  %6 = addrspacecast ptr %0 to ptr<%struct.1>
  br i1 %1, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %7 = phi i1 [ %2, %bb1 ], [ true, %bb2 ]
  %8 = xor i1 %7, -1
  br i1 %8, label %bb5, label %bb4

bb4:
  %9 = call %view.i32 @get_BaseView(ptr<%struct.1> %3)
  %10 = call i32 @ComputeLinearIndex(ptr<%struct.1> %3, i32 %p0)
  %11 = getelementptr i32, ptr %9, i32 %10
  store i32 10, ptr %11
  br label %bb8

bb5:
  br i1 %4, label %bb7, label %bb6

bb6:
  %12 = call %view.i32 @get_BaseView(ptr<%struct.1> %5)
  %13 = call i32 @ComputeLinearIndex(ptr<%struct.1> %5, i32 %p0)
  %14 = getelementptr i32, ptr %12, i32 %13
  store i32 20, ptr %14
  br label %bb8

bb7:
  %15 = call %view.i32 @get_BaseView(ptr<%struct.1> %6)
  %16 = call i32 @ComputeLinearIndex(ptr<%struct.1> %6, i32 %p0)
  %17 = getelementptr i32, ptr %15, i32 %16
  store i32 30, ptr %17
  br label %bb8

bb8:
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
  %0 = icmp sge i32 %p1, 0
  %1 = icmp slt i32 %p1, %p2
  %2 = and i1 %0, %1
  %3 = icmp eq i32 %p1, 0
  %4 = icmp eq i32 %p2, 0
  %5 = and i1 %3, %4
  %6 = or i1 %2, %5
  %7 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  %8 = alloca i8, i32 1
  store i8 %p0, ptr %8
  %9 = alloca i32, i32 1
  store i32 %p1, ptr %9
  %10 = addrspacecast ptr %9 to ptr<i32>
  %11 = call i32 @get_X(ptr<i32> %10)
  %12 = addrspacecast ptr %8 to ptr<i8>
  %13 = call i32 @get_XStride(ptr<i8> %12)
  %14 = mul i32 %11, %13
  ret i32 %14

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
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = load i64, ptr %p0
  %6 = trunc i64 %5 to i32
  ret i32 %6

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


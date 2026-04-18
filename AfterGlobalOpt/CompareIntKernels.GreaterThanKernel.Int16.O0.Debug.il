; stage: AfterGlobalOpt  opt: O0
; module: GreaterThanKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%view.i16 = view i16
%struct.1 = type { %view.i16, i64, i8 }
%struct.2 = type { view<i16>, i64, i8 }
%struct.3 = type { view<i32>, i64, i8 }

define void @GreaterThanKernel(i32 %p0, %struct.2 %p1, %struct.2 %p2, %struct.3 %p3) {
entry:
  %0 = alloca %struct.2, i32 1
  store %struct.2 %p1, ptr %0
  %1 = alloca %struct.2, i32 1
  store %struct.2 %p2, ptr %1
  %2 = alloca %struct.3, i32 1
  store %struct.3 %p3, ptr %2
  %3 = addrspacecast ptr %2 to ptr<%struct.3>
  %4 = call %view.i32 @get_BaseView(ptr<%struct.3> %3)
  %5 = call i32 @ComputeLinearIndex(ptr<%struct.3> %3, i32 %p0)
  %6 = addrspacecast ptr %0 to ptr<%struct.2>
  %7 = call %view.i16 @get_BaseView(ptr<%struct.2> %6)
  %8 = call i32 @ComputeLinearIndex(ptr<%struct.2> %6, i32 %p0)
  %9 = addrspacecast ptr %1 to ptr<%struct.2>
  %10 = call %view.i16 @get_BaseView(ptr<%struct.2> %9)
  %11 = call i32 @ComputeLinearIndex(ptr<%struct.2> %9, i32 %p0)
  %12 = getelementptr i16, ptr %10, i32 %11
  %13 = load i16, ptr %12
  %14 = getelementptr i16, ptr %7, i32 %8
  %15 = load i16, ptr %14
  %16 = sext i16 %15 to i32
  %17 = sext i16 %13 to i32
  %18 = icmp sgt i32 %16, %17
  %19 = getelementptr i32, ptr %4, i32 %5
  br i1 %18, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %20 = phi i32 [ 0, %bb1 ], [ 1, %bb2 ]
  store i32 %20, ptr %19
  ret void

}

define i32 @ComputeLinearIndex(ptr<%struct.1> %p0, i32 %p1) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = call i64 @get_Extent(ptr<%struct.1> %p0)
  store i64 %3, ptr %2
  %4 = addrspacecast ptr %2 to ptr<i64>
  %5 = call i32 @ToIntIndex(ptr<i64> %4)
  %6 = call i32 @ComputeElementIndexChecked(i8 %1, i32 %p1, i32 %5)
  ret i32 %6

}

define i64 @get_Extent(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.i16 @get_BaseView(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 0
  %1 = load %view.i16, ptr %0
  ret %view.i16 %1

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


; stage: AfterGlobalOpt  opt: O0
; module: IfChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { view<i32>, i64, i8 }

define void @IfChainKernel(i32 %p0, %struct.1 %p1, i32 %p2) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = icmp ne i32 %p2, 0
  %2 = addrspacecast ptr %0 to ptr<%struct.1>
  %3 = icmp ne i32 %p2, 1
  %4 = icmp ne i32 %p2, 2
  br i1 %1, label %bb2, label %bb1

bb1:
  %5 = call %view.i32 @get_BaseView(ptr<%struct.1> %2)
  %6 = call i32 @ComputeLinearIndex(ptr<%struct.1> %2, i32 %p0)
  %7 = getelementptr i32, ptr %5, i32 %6
  store i32 10, ptr %7
  br label %bb7

bb2:
  br i1 %3, label %bb4, label %bb3

bb3:
  %8 = call %view.i32 @get_BaseView(ptr<%struct.1> %2)
  %9 = call i32 @ComputeLinearIndex(ptr<%struct.1> %2, i32 %p0)
  %10 = getelementptr i32, ptr %8, i32 %9
  store i32 20, ptr %10
  br label %bb7

bb4:
  br i1 %4, label %bb6, label %bb5

bb5:
  %11 = call %view.i32 @get_BaseView(ptr<%struct.1> %2)
  %12 = call i32 @ComputeLinearIndex(ptr<%struct.1> %2, i32 %p0)
  %13 = getelementptr i32, ptr %11, i32 %12
  store i32 30, ptr %13
  br label %bb7

bb6:
  %14 = call %view.i32 @get_BaseView(ptr<%struct.1> %2)
  %15 = call i32 @ComputeLinearIndex(ptr<%struct.1> %2, i32 %p0)
  %16 = getelementptr i32, ptr %14, i32 %15
  store i32 40, ptr %16
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


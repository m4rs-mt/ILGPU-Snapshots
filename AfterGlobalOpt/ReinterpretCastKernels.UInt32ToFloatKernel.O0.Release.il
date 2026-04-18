; stage: AfterGlobalOpt  opt: O0
; module: UInt32ToFloatKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%view.float = view float
%struct.1 = type { %view.float, i64, i8 }
%struct.2 = type { view<i32>, i64, i8 }
%struct.3 = type { view<float>, i64, i8 }

define void @UInt32ToFloatKernel(i32 %p0, %struct.2 %p1, %struct.3 %p2) {
entry:
  %0 = alloca %struct.2, i32 1
  store %struct.2 %p1, ptr %0
  %1 = alloca %struct.3, i32 1
  store %struct.3 %p2, ptr %1
  %2 = alloca i32, i32 1
  store i32 0, ptr %2
  %3 = addrspacecast ptr %0 to ptr<%struct.2>
  %4 = call %view.i32 @get_BaseView(ptr<%struct.2> %3)
  %5 = call i32 @ComputeLinearIndex(ptr<%struct.2> %3, i32 %p0)
  %6 = getelementptr i32, ptr %4, i32 %5
  %7 = load i32, ptr %6
  store i32 %7, ptr %2
  %8 = addrspacecast ptr %1 to ptr<%struct.3>
  %9 = call %view.float @get_BaseView(ptr<%struct.3> %8)
  %10 = call i32 @ComputeLinearIndex(ptr<%struct.3> %8, i32 %p0)
  %11 = bitcast ptr %2 to ptr ; i32 -> float
  %12 = load float, ptr %11
  %13 = getelementptr float, ptr %9, i32 %10
  store float %12, ptr %13
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

define %view.float @get_BaseView(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 0
  %1 = load %view.float, ptr %0
  ret %view.float %1

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


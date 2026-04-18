; stage: AfterGlobalOpt  opt: O0
; module: NotKernel  [intptr: i64]

%view.i16 = view i16
%struct.0 = type { %view.i16, i64, i8 }
%struct.1 = type { view<i16>, i64, i8 }

define void @NotKernel(i32 %p0, %struct.1 %p1, %struct.1 %p2) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 %p2, ptr %1
  %2 = addrspacecast ptr %1 to ptr<%struct.1>
  %3 = call %view.i16 @get_BaseView(ptr<%struct.1> %2)
  %4 = call i32 @ComputeLinearIndex(ptr<%struct.1> %2, i32 %p0)
  %5 = addrspacecast ptr %0 to ptr<%struct.1>
  %6 = call %view.i16 @get_BaseView(ptr<%struct.1> %5)
  %7 = call i32 @ComputeLinearIndex(ptr<%struct.1> %5, i32 %p0)
  %8 = getelementptr i16, ptr %6, i32 %7
  %9 = load i16, ptr %8
  %10 = getelementptr i16, ptr %3, i32 %4
  %11 = sext i16 %9 to i32
  %12 = xor i32 %11, -1
  %13 = trunc i32 %12 to i16
  store i16 %13, ptr %10
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

define %view.i16 @get_BaseView(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = load %view.i16, ptr %0
  ret %view.i16 %1

}


; stage: AfterGlobalOpt  opt: O0
; module: Index3DKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i32, i32 }
%struct.2 = type { view<i32>, i64, i8 }

define void @Index3DKernel(%struct.1 %p0, %struct.2 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = alloca %struct.2, i32 1
  store %struct.2 %p1, ptr %0
  %1 = alloca i32, i32 1
  store i32 0, ptr %1
  %2 = addrspacecast ptr %1 to ptr<i32>
  %3 = extractvalue %struct.1 %p0, 0
  %4 = extractvalue %struct.1 %p0, 1
  %5 = mul i32 %4, %p2
  %6 = add i32 %3, %5
  %7 = extractvalue %struct.1 %p0, 2
  %8 = mul i32 %7, %p2
  %9 = mul i32 %8, %p3
  %10 = add i32 %6, %9
  call void @.ctor(ptr<i32> %2, i32 %10)
  %11 = load i32, ptr %1
  %12 = addrspacecast ptr %0 to ptr<%struct.2>
  %13 = call %view.i32 @get_BaseView(ptr<%struct.2> %12)
  %14 = call i32 @ComputeLinearIndex(ptr<%struct.2> %12, i32 %11)
  %15 = getelementptr i32, ptr %13, i32 %14
  %16 = extractvalue %struct.1 %p0, 0
  %17 = extractvalue %struct.1 %p0, 1
  %18 = mul i32 %17, 100
  %19 = add i32 %16, %18
  %20 = extractvalue %struct.1 %p0, 2
  %21 = mul i32 %20, 10000
  %22 = add i32 %19, %21
  store i32 %22, ptr %15
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

define void @.ctor(ptr<i32> %p0, i32 %p1) {
entry:
  store i32 %p1, ptr %p0
  ret void

}


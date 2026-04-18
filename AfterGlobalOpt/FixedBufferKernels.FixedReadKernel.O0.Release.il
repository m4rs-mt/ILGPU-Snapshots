; stage: AfterGlobalOpt  opt: O0
; module: FixedReadKernel  [intptr: i64]

%struct.0 = type { i32 }
%view.struct = view %struct.0
%struct.1 = type { %view.struct, i64, i8 }
%view.i32 = view i32
%struct.2 = type { %view.i32, i64, i8 }
%struct.3 = type { view<%struct.0>, i64, i8 }
%struct.4 = type { view<i32>, i64, i8 }

define void @FixedReadKernel(i32 %p0, %struct.3 %p1, %struct.4 %p2) {
entry:
  %0 = alloca %struct.3, i32 1
  store %struct.3 %p1, ptr %0
  %1 = alloca %struct.4, i32 1
  store %struct.4 %p2, ptr %1
  %2 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %2
  %3 = addrspacecast ptr %0 to ptr<%struct.3>
  %4 = call %view.struct @get_BaseView(ptr<%struct.3> %3)
  %5 = call i32 @ComputeLinearIndex(ptr<%struct.3> %3, i32 %p0)
  %6 = getelementptr %struct.0, ptr %4, i32 %5
  %7 = load %struct.0, ptr %6
  store %struct.0 %7, ptr %2
  %8 = addrspacecast ptr %1 to ptr<%struct.4>
  %9 = call %view.i32 @get_BaseView(ptr<%struct.4> %8)
  %10 = call i32 @ComputeLinearIndex(ptr<%struct.4> %8, i32 %p0)
  %11 = getelementptr inbounds %struct.0, ptr %2, i32 0, i32 0
  %12 = load i32, ptr %11
  %13 = getelementptr inbounds %struct.0, ptr %2, i32 0, i32 0
  %14 = getelementptr i32, ptr %13, i32 1
  %15 = load i32, ptr %14
  %16 = getelementptr inbounds %struct.0, ptr %2, i32 0, i32 0
  %17 = getelementptr i32, ptr %16, i32 2
  %18 = load i32, ptr %17
  %19 = getelementptr inbounds %struct.0, ptr %2, i32 0, i32 0
  %20 = getelementptr i32, ptr %19, i32 3
  %21 = load i32, ptr %20
  %22 = getelementptr i32, ptr %9, i32 %10
  %23 = add i32 %12, %15
  %24 = add i32 %23, %18
  %25 = add i32 %24, %21
  store i32 %25, ptr %22
  ret void

}

define i32 @ComputeLinearIndex(ptr<%struct.2> %p0, i32 %p1) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = call i64 @get_Extent(ptr<%struct.2> %p0)
  store i64 %3, ptr %2
  %4 = addrspacecast ptr %2 to ptr<i64>
  %5 = call i32 @ToIntIndex(ptr<i64> %4)
  %6 = call i32 @ComputeElementIndexChecked(i8 %1, i32 %p1, i32 %5)
  ret i32 %6

}

define i64 @get_Extent(ptr<%struct.2> %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.i32 @get_BaseView(ptr<%struct.2> %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 0
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

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

define i64 @get_Extent(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.struct @get_BaseView(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 0
  %1 = load %view.struct, ptr %0
  ret %view.struct %1

}


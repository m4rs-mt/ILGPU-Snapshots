; stage: AfterGlobalOpt  opt: O0
; module: AddKernel  [intptr: i64]

%view.i8 = view i8
%struct.0 = type { %view.i8, i64, i8 }

define void @AddKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, %struct.0 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.0, i32 1
  store %struct.0 %p2, ptr %1
  %2 = alloca %struct.0, i32 1
  store %struct.0 %p3, ptr %2
  %3 = call %view.i8 @get_BaseView(ptr<%struct.0> addrspace(local) %2)
  %4 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %2, i32 %p0)
  %5 = call %view.i8 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %6 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %7 = call %view.i8 @get_BaseView(ptr<%struct.0> addrspace(local) %1)
  %8 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %1, i32 %p0)
  %9 = getelementptr i8, ptr %7, i32 %8
  %10 = load i8, ptr %9
  %11 = getelementptr i8, ptr %5, i32 %6
  %12 = load i8, ptr %11
  %13 = getelementptr i8, ptr %3, i32 %4
  %14 = sext i8 %12 to i32
  %15 = sext i8 %10 to i32
  %16 = add i32 %14, %15
  %17 = trunc i32 %16 to i8
  store i8 %17, ptr %13
  ret void

}

define i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %p0, i32 %p1) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = call i64 @get_Extent(ptr<%struct.0> addrspace(local) %p0)
  store i64 %3, ptr %2
  %4 = call i32 @ToIntIndex(ptr<i64> addrspace(local) %2)
  %5 = call i32 @ComputeElementIndexChecked(i8 %1, i32 %p1, i32 %4)
  ret i32 %5

}

define i32 @ComputeElementIndexChecked(i8 %p0, i32 %p1, i32 %p2) {
entry:
  %0 = alloca i8, i32 1
  store i8 %p0, ptr %0
  %1 = alloca i32, i32 1
  store i32 %p1, ptr %1
  %2 = call i32 @get_X(ptr<i32> addrspace(local) %1)
  %3 = addrspacecast ptr %0 to ptr<i8>
  %4 = call i32 @get_XStride(ptr<i8> %3)
  %5 = mul i32 %2, %4
  ret i32 %5

}

define i32 @get_XStride(ptr<i8> %p0) {
entry:
  ret i32 1

}

define i32 @get_X(ptr<i32> addrspace(local) %p0) {
entry:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define i32 @ToIntIndex(ptr<i64> addrspace(local) %p0) {
entry:
  %0 = load i64, ptr %p0
  %1 = load i64, ptr %p0
  %2 = trunc i64 %1 to i32
  ret i32 %2

}

define i64 @get_Extent(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.i8 @get_BaseView(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = load %view.i8, ptr %0
  ret %view.i8 %1

}


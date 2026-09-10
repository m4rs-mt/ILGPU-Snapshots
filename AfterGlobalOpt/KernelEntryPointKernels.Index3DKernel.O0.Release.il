; stage: AfterGlobalOpt  opt: O0
; module: Index3DKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i32, i32 }

define void @Index3DKernel(%struct.1 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca i32, i32 1
  store i32 0, ptr %1
  %2 = extractvalue %struct.1 %p0, 0
  %3 = extractvalue %struct.1 %p0, 1
  %4 = mul i32 %3, %p2
  %5 = add i32 %2, %4
  %6 = extractvalue %struct.1 %p0, 2
  %7 = mul i32 %6, %p2
  %8 = mul i32 %7, %p3
  %9 = add i32 %5, %8
  call void @.ctor(ptr<i32> addrspace(local) %1, i32 %9)
  %10 = load i32, ptr %1
  %11 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %12 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %10)
  %13 = getelementptr i32, ptr %11, i32 %12
  %14 = extractvalue %struct.1 %p0, 0
  %15 = extractvalue %struct.1 %p0, 1
  %16 = mul i32 %15, 100
  %17 = add i32 %14, %16
  %18 = extractvalue %struct.1 %p0, 2
  %19 = mul i32 %18, 10000
  %20 = add i32 %17, %19
  store i32 %20, ptr %13
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
  %0 = alloca i32, i32 1
  store i32 %p1, ptr %0
  %1 = call i32 @get_X(ptr<i32> addrspace(local) %0)
  ret i32 %1

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

define %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

}

define void @.ctor(ptr<i32> addrspace(local) %p0, i32 %p1) {
entry:
  store i32 %p1, ptr %p0
  ret void

}


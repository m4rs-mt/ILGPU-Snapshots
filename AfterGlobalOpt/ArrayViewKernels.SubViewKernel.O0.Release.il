; stage: AfterGlobalOpt  opt: O0
; module: SubViewKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @SubViewKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, i32 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.0, i32 1
  store %struct.0 %p2, ptr %1
  %2 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %2
  %3 = alloca i32, i32 1
  store i32 0, ptr %3
  call void @.ctor(ptr<i32> addrspace(local) %3, i32 %p3)
  %4 = load i32, ptr %3
  %5 = call i64 @get_Length(ptr<%struct.0> addrspace(local) %0)
  call void @AssertIntIndexRange(i64 %5)
  %6 = alloca i32, i32 1
  store i32 0, ptr %6
  %7 = trunc i64 %5 to i32
  %8 = sub i32 %7, %p3
  call void @.ctor(ptr<i32> addrspace(local) %6, i32 %8)
  %9 = load i32, ptr %6
  %10 = alloca i32, i32 1
  store i32 %4, ptr %10
  %11 = alloca i32, i32 1
  store i32 %9, ptr %11
  %12 = alloca i64, i32 1
  store i64 0, ptr %12
  %13 = alloca i8, i32 1
  store i8 0, ptr %13
  %14 = alloca %struct.0, i32 1
  %15 = call i32 @get_X(ptr<i32> addrspace(local) %10)
  %16 = call i32 @get_X(ptr<i32> addrspace(local) %10)
  %17 = call i32 @get_X(ptr<i32> addrspace(local) %11)
  %18 = call i64 @get_Extent(ptr<%struct.0> addrspace(local) %0)
  store i64 %18, ptr %12
  %19 = call i64 @get_X(ptr<i64> addrspace(local) %12)
  %20 = call i32 @get_X(ptr<i32> addrspace(local) %10)
  %21 = call i32 @get_X(ptr<i32> addrspace(local) %11)
  %22 = load i32, ptr %10
  %23 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %22)
  %24 = call i8 @get_Stride(ptr<%struct.0> addrspace(local) %0)
  store i8 %24, ptr %13
  %25 = load i32, ptr %11
  %26 = addrspacecast ptr %13 to ptr<i8>
  %27 = call i32 @ComputeBufferLength(ptr<i8> %26, i32 %25)
  %28 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %29 = load i32, ptr %11
  %30 = call i64 @op_Implicit(i32 %29)
  %31 = call i8 @get_Stride(ptr<%struct.0> addrspace(local) %0)
  store %struct.0 null, ptr %14
  %32 = call %view.i32 @ilgpu.view.sub(%view.i32 %28, i64 %23, i64 %27)
  call void @.ctor(ptr<%struct.0> addrspace(local) %14, %view.i32 %32, i64 %30, i8 %31)
  %33 = load %struct.0, ptr %14
  store %struct.0 %33, ptr %2
  %34 = call i64 @get_Length(ptr<%struct.0> addrspace(local) %2)
  call void @AssertIntIndexRange(i64 %34)
  %35 = trunc i64 %34 to i32
  %36 = icmp sge i32 %p0, %35
  br i1 %36, label %bb2, label %bb1

bb1:
  %37 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %1)
  %38 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %1, i32 %p0)
  %39 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %2)
  %40 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %2, i32 %p0)
  %41 = getelementptr i32, ptr %39, i32 %40
  %42 = load i32, ptr %41
  %43 = getelementptr i32, ptr %37, i32 %38
  store i32 %42, ptr %43
  br label %bb3

bb2:
  %44 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %1)
  %45 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %1, i32 %p0)
  %46 = getelementptr i32, ptr %44, i32 %45
  store i32 -1, ptr %46
  br label %bb3

bb3:
  ret void

}

define void @.ctor(ptr<%struct.0> addrspace(local) %p0, %view.i32 %p1, i64 %p2, i8 %p3) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  store %view.i32 %p1, ptr %0
  %1 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  store i64 %p2, ptr %1
  %2 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  store i8 %p3, ptr %2
  ret void

}

define i64 @op_Implicit(i32 %p0) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p0, ptr %0
  %1 = alloca i64, i32 1
  %2 = call i32 @get_X(ptr<i32> addrspace(local) %0)
  store i64 0, ptr %1
  %3 = sext i32 %2 to i64
  call void @.ctor(ptr<i64> addrspace(local) %1, i64 %3)
  %4 = load i64, ptr %1
  ret i64 %4

}

define void @.ctor(ptr<i64> addrspace(local) %p0, i64 %p1) {
entry:
  store i64 %p1, ptr %p0
  ret void

}

define %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

}

define i32 @ComputeBufferLength(ptr<i8> %p0, i32 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p1, ptr %0
  %1 = call i32 @get_X(ptr<i32> addrspace(local) %0)
  ret i32 %1

}

define i8 @get_Stride(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  ret i8 %1

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

define i32 @ToIntIndex(ptr<i64> addrspace(local) %p0) {
entry:
  %0 = load i64, ptr %p0
  %1 = load i64, ptr %p0
  %2 = trunc i64 %1 to i32
  ret i32 %2

}

define i64 @get_X(ptr<i64> addrspace(local) %p0) {
entry:
  %0 = load i64, ptr %p0
  ret i64 %0

}

define i64 @get_Extent(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define i32 @get_X(ptr<i32> addrspace(local) %p0) {
entry:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define void @AssertIntIndexRange(i64 %p0) {
entry:
  ret void

}

define i64 @get_Length(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  %3 = load i64, ptr %2
  %4 = call i64 @op_Implicit(i64 %3)
  ret i64 %4

}

define i64 @op_Implicit(i64 %p0) {
entry:
  ret i64 %p0

}

define void @.ctor(ptr<i32> addrspace(local) %p0, i32 %p1) {
entry:
  store i32 %p1, ptr %p0
  ret void

}


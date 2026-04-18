; module: SubViewKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @SubViewKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, i32 %p3) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p0, ptr %0
  %1 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %1
  %2 = alloca %struct.0, i32 1
  store %struct.0 %p2, ptr %2
  %3 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %3
  %4 = addrspacecast ptr %1 to ptr<%struct.0>
  %5 = addrspacecast ptr %0 to ptr<i32>
  %6 = addrspacecast ptr %3 to ptr<%struct.0>
  %7 = addrspacecast ptr %0 to ptr<i32>
  %8 = addrspacecast ptr %2 to ptr<%struct.0>
  %9 = addrspacecast ptr %3 to ptr<%struct.0>
  %10 = addrspacecast ptr %0 to ptr<i32>
  %11 = addrspacecast ptr %2 to ptr<%struct.0>
  br label %bb1

bb1:
  %12 = call i32 @op_Implicit(i32 %p3)
  %13 = call i32 @get_IntLength(ptr<%struct.0> %4)
  %14 = sub i32 %13, %p3
  %15 = call i32 @op_Implicit(i32 %14)
  %16 = call %struct.0 @SubView(ptr<%struct.0> %4, i32 %12, i32 %15)
  store %struct.0 %16, ptr %3
  %17 = call i32 @get_X(ptr<i32> %5)
  %18 = call i32 @get_IntLength(ptr<%struct.0> %6)
  %19 = icmp sge i32 %17, %18
  br i1 %19, label %bb3, label %bb2

bb2:
  %20 = load i32, ptr %7
  %21 = call ptr<i32> @get_Item(ptr<%struct.0> %8, i32 %20)
  %22 = load i32, ptr %7
  %23 = call ptr<i32> @get_Item(ptr<%struct.0> %9, i32 %22)
  %24 = load i32, ptr %23
  store i32 %24, ptr %21
  br label %bb4

bb3:
  %25 = load i32, ptr %10
  %26 = call ptr<i32> @get_Item(ptr<%struct.0> %11, i32 %25)
  store i32 -1, ptr %26
  br label %bb4

bb4:
  ret void

}

define ptr<i32> @get_Item(ptr<%struct.0> %p0, i32 %p1) {
entry:
  %0 = alloca %view.i32, i32 1
  store %view.i32 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%view.i32>
  br label %bb1

bb1:
  %2 = call %view.i32 @get_BaseView(ptr<%struct.0> %p0)
  store %view.i32 %2, ptr %0
  %3 = call i32 @ComputeLinearIndex(ptr<%struct.0> %p0, i32 %p1)
  %4 = load %view.i32, ptr %1
  %5 = getelementptr i32, ptr %4, i32 %3
  ret ptr<i32> %5

}

define %struct.0 @SubView(ptr<%struct.0> %p0, i32 %p1, i32 %p2) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p1, ptr %0
  %1 = alloca i32, i32 1
  store i32 %p2, ptr %1
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = alloca i8, i32 1
  store i8 0, ptr %3
  %4 = alloca %view.i32, i32 1
  store %view.i32 null, ptr %4
  %5 = alloca %struct.0, i32 1
  %6 = addrspacecast ptr %0 to ptr<i32>
  %7 = addrspacecast ptr %1 to ptr<i32>
  %8 = addrspacecast ptr %2 to ptr<i64>
  %9 = call ptr @ilgpu.string("Index_Extent_X_out_of_bounds")
  %10 = addrspacecast ptr %3 to ptr<i8>
  %11 = addrspacecast ptr %4 to ptr<%view.i32>
  %12 = addrspacecast ptr %5 to ptr<%struct.0>
  br label %bb1

bb1:
  %13 = call i32 @get_X(ptr<i32> %6)
  %14 = call i32 @get_X(ptr<i32> %6)
  %15 = call i32 @get_X(ptr<i32> %7)
  %16 = call i64 @get_Extent(ptr<%struct.0> %p0)
  store i64 %16, ptr %2
  %17 = call i64 @get_X(ptr<i64> %8)
  %18 = call i32 @get_X(ptr<i32> %6)
  %19 = call i32 @get_X(ptr<i32> %7)
  %20 = icmp sge i32 %13, 0
  %21 = add i32 %14, %15
  %22 = trunc i64 %17 to i32
  %23 = icmp sle i32 %21, %22
  %24 = icmp eq i32 %18, 0
  %25 = icmp eq i32 %19, 0
  %26 = and i1 %24, %25
  %27 = or i1 %23, %26
  %28 = and i1 %20, %27
  call void @ilgpu.debug.assert(i1 %28, ptr %9)
  %29 = load i32, ptr %6
  %30 = call i32 @ComputeLinearIndex(ptr<%struct.0> %p0, i32 %29)
  %31 = call i8 @get_Stride(ptr<%struct.0> %p0)
  store i8 %31, ptr %3
  %32 = load i32, ptr %7
  %33 = call i32 @ComputeBufferLength(ptr<i8> %10, i32 %32)
  %34 = call %view.i32 @get_BaseView(ptr<%struct.0> %p0)
  store %view.i32 %34, ptr %4
  %35 = load %view.i32, ptr %11
  %36 = load i32, ptr %7
  %37 = call i64 @op_Implicit(i32 %36)
  %38 = call i8 @get_Stride(ptr<%struct.0> %p0)
  store %struct.0 null, ptr %12
  %39 = call %view.i32 @ilgpu.view.sub(%view.i32 %35, i64 %30, i64 %33)
  call void @.ctor(ptr<%struct.0> %12, %view.i32 %39, i64 %37, i8 %38)
  %40 = load %struct.0, ptr %12
  br label %bb2

bb2:
  ret %struct.0 %40

}

define void @.ctor(ptr<%struct.0> %p0, %view.i32 %p1, i64 %p2, i8 %p3) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  %2 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  br label %bb1

bb1:
  store %view.i32 %p1, ptr %0
  store i64 %p2, ptr %1
  store i8 %p3, ptr %2
  ret void

}

define i64 @op_Implicit(i32 %p0) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i32>
  br label %bb1

bb1:
  %2 = call i64 @ToLongIndex(ptr<i32> %1)
  ret i64 %2

}

define i64 @ToLongIndex(ptr<i32> %p0) {
entry:
  %0 = alloca i64, i32 1
  %1 = addrspacecast ptr %0 to ptr<i64>
  br label %bb1

bb1:
  %2 = call i32 @get_X(ptr<i32> %p0)
  store i64 0, ptr %1
  %3 = sext i32 %2 to i64
  call void @.ctor(ptr<i64> %1, i64 %3)
  %4 = load i64, ptr %1
  ret i64 %4

}

define void @.ctor(ptr<i64> %p0, i64 %p1) {
entry:
  br label %bb1

bb1:
  store i64 %p1, ptr %p0
  ret void

}

define %view.i32 @get_BaseView(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  br label %bb1

bb1:
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

}

define i32 @ComputeBufferLength(ptr<i8> %p0, i32 %p1) {
entry:
  br label %bb1

bb1:
  %0 = call i32 @op_Implicit(i32 %p1)
  ret i32 %0

}

define i32 @op_Implicit(i32 %p0) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i32>
  br label %bb1

bb1:
  %2 = call i32 @get_X(ptr<i32> %1)
  ret i32 %2

}

define i32 @ComputeLinearIndex(ptr<%struct.0> %p0, i32 %p1) {
entry:
  %0 = alloca i8, i32 1
  store i8 0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i8>
  br label %bb1

bb1:
  %2 = call i8 @get_Stride(ptr<%struct.0> %p0)
  store i8 %2, ptr %0
  %3 = call i32 @get_IntExtent(ptr<%struct.0> %p0)
  %4 = call i32 @ComputeElementIndexChecked(ptr<i8> %1, i32 %p1, i32 %3)
  ret i32 %4

}

define i32 @ComputeElementIndexChecked(ptr<i8> %p0, i32 %p1, i32 %p2) {
entry:
  br label %bb1

bb1:
  %0 = load i8, ptr %p0
  %1 = call i32 @ComputeElementIndexChecked(i8 %0, i32 %p1, i32 %p2)
  ret i32 %1

}

define i32 @ComputeElementIndexChecked(i8 %p0, i32 %p1, i32 %p2) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p1, ptr %0
  %1 = alloca i32, i32 1
  store i32 %p2, ptr %1
  %2 = addrspacecast ptr %0 to ptr<i32>
  %3 = addrspacecast ptr %1 to ptr<i32>
  %4 = call ptr @ilgpu.string("X_index_out_of_bounds")
  br label %bb1

bb1:
  %5 = call i32 @get_X(ptr<i32> %2)
  %6 = call i32 @get_X(ptr<i32> %2)
  %7 = call i32 @get_X(ptr<i32> %3)
  %8 = call i32 @get_X(ptr<i32> %2)
  %9 = call i32 @get_X(ptr<i32> %3)
  %10 = icmp sge i32 %5, 0
  %11 = icmp slt i32 %6, %7
  %12 = and i1 %10, %11
  %13 = icmp eq i32 %8, 0
  %14 = icmp eq i32 %9, 0
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  call void @ilgpu.debug.assert(i1 %16, ptr %4)
  %17 = load i32, ptr %2
  %18 = call i32 @ComputeElementIndex(i8 %p0, i32 %17)
  br label %bb2

bb2:
  ret i32 %18

}

define i32 @ComputeElementIndex(i8 %p0, i32 %p1) {
entry:
  %0 = alloca i8, i32 1
  store i8 %p0, ptr %0
  %1 = alloca i32, i32 1
  store i32 %p1, ptr %1
  %2 = addrspacecast ptr %1 to ptr<i32>
  %3 = addrspacecast ptr %0 to ptr<i8>
  br label %bb1

bb1:
  %4 = call i32 @get_X(ptr<i32> %2)
  %5 = call i32 @get_XStride(ptr<i8> %3)
  %6 = mul i32 %4, %5
  ret i32 %6

}

define i32 @get_XStride(ptr<i8> %p0) {
entry:
  br label %bb1

bb1:
  ret i32 1

}

define i32 @get_IntExtent(ptr<%struct.0> %p0) {
entry:
  %0 = alloca i64, i32 1
  store i64 0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i64>
  br label %bb1

bb1:
  %2 = call i64 @get_Extent(ptr<%struct.0> %p0)
  store i64 %2, ptr %0
  %3 = call i32 @ToIntIndex(ptr<i64> %1)
  ret i32 %3

}

define i32 @ToIntIndex(ptr<i64> %p0) {
entry:
  %0 = alloca i32, i32 1
  %1 = addrspacecast ptr %0 to ptr<i32>
  br label %bb1

bb1:
  %2 = call i64 @get_X(ptr<i64> %p0)
  call void @AssertIntIndexRange(i64 %2)
  %3 = call i64 @get_X(ptr<i64> %p0)
  store i32 0, ptr %1
  %4 = trunc i64 %3 to i32
  call void @.ctor(ptr<i32> %1, i32 %4)
  %5 = load i32, ptr %1
  br label %bb2

bb2:
  ret i32 %5

}

define i32 @get_X(ptr<i32> %p0) {
entry:
  br label %bb1

bb1:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define i32 @get_IntLength(ptr<%struct.0> %p0) {
entry:
  br label %bb1

bb1:
  %0 = call i64 @get_Length(ptr<%struct.0> %p0)
  call void @AssertIntIndexRange(i64 %0)
  %1 = trunc i64 %0 to i32
  br label %bb2

bb2:
  ret i32 %1

}

define void @AssertIntIndexRange(i64 %p0) {
entry:
  %0 = icmp sge i64 %p0, -2147483648
  %1 = icmp sle i64 %p0, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  br label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  ret void

}

define i64 @get_Length(ptr<%struct.0> %p0) {
entry:
  %0 = alloca i8, i32 1
  store i8 0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i8>
  br label %bb1

bb1:
  %2 = call i8 @get_Stride(ptr<%struct.0> %p0)
  store i8 %2, ptr %0
  %3 = call i64 @get_Extent(ptr<%struct.0> %p0)
  %4 = call i64 @ComputeBufferLength(ptr<i8> %1, i64 %3)
  ret i64 %4

}

define i64 @ComputeBufferLength(ptr<i8> %p0, i64 %p1) {
entry:
  br label %bb1

bb1:
  %0 = call i64 @op_Implicit(i64 %p1)
  ret i64 %0

}

define i64 @op_Implicit(i64 %p0) {
entry:
  %0 = alloca i64, i32 1
  store i64 %p0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i64>
  br label %bb1

bb1:
  %2 = call i64 @get_X(ptr<i64> %1)
  ret i64 %2

}

define i64 @get_X(ptr<i64> %p0) {
entry:
  br label %bb1

bb1:
  %0 = load i64, ptr %p0
  ret i64 %0

}

define i64 @get_Extent(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  br label %bb1

bb1:
  %1 = load i64, ptr %0
  ret i64 %1

}

define i8 @get_Stride(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  br label %bb1

bb1:
  %1 = load i8, ptr %0
  ret i8 %1

}

define i32 @op_Implicit(i32 %p0) {
entry:
  %0 = alloca i32, i32 1
  %1 = addrspacecast ptr %0 to ptr<i32>
  br label %bb1

bb1:
  store i32 0, ptr %1
  call void @.ctor(ptr<i32> %1, i32 %p0)
  %2 = load i32, ptr %1
  ret i32 %2

}

define void @.ctor(ptr<i32> %p0, i32 %p1) {
entry:
  br label %bb1

bb1:
  store i32 %p1, ptr %p0
  ret void

}


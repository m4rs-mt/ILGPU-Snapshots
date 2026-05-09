; module: InterleaveFieldsKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32, i32 }
%struct.1 = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%view.struct = view %struct.1
%struct.2 = type { %view.struct, i64, i8 }

define void @InterleaveFieldsKernel(i32 %p0, %struct.2 %p1) {
entry:
  %0 = alloca %struct.2, i32 1
  store %struct.2 %p1, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.2>
  br label %bb1

bb1:
  %2 = call ptr<%struct.1> @get_Item(ptr<%struct.2> %1, i32 %p0)
  %3 = getelementptr inbounds %struct.1, ptr %2, i32 0, i32 0
  %4 = call ptr<i32> @InlineArrayFirstElementRef(ptr<%struct.0> %3)
  %5 = call i32 @op_Implicit(i32 %p0)
  store i32 %5, ptr %4
  %6 = call ptr<%struct.1> @get_Item(ptr<%struct.2> %1, i32 %p0)
  %7 = getelementptr inbounds %struct.1, ptr %6, i32 0, i32 0
  %8 = call ptr<i32> @InlineArrayElementRef(ptr<%struct.0> %7, i32 1)
  %9 = call i32 @op_Implicit(i32 1)
  %10 = call i32 @op_Addition(i32 %p0, i32 %9)
  %11 = call i32 @op_Implicit(i32 %10)
  store i32 %11, ptr %8
  %12 = call ptr<%struct.1> @get_Item(ptr<%struct.2> %1, i32 %p0)
  %13 = getelementptr inbounds %struct.1, ptr %12, i32 0, i32 0
  %14 = call ptr<i32> @InlineArrayElementRef(ptr<%struct.0> %13, i32 2)
  %15 = call i32 @op_Implicit(i32 2)
  %16 = call i32 @op_Addition(i32 %p0, i32 %15)
  %17 = call i32 @op_Implicit(i32 %16)
  store i32 %17, ptr %14
  %18 = call ptr<%struct.1> @get_Item(ptr<%struct.2> %1, i32 %p0)
  %19 = getelementptr inbounds %struct.1, ptr %18, i32 0, i32 0
  %20 = call ptr<i32> @InlineArrayElementRef(ptr<%struct.0> %19, i32 3)
  %21 = call i32 @op_Implicit(i32 3)
  %22 = call i32 @op_Addition(i32 %p0, i32 %21)
  %23 = call i32 @op_Implicit(i32 %22)
  store i32 %23, ptr %20
  %24 = call ptr<%struct.1> @get_Item(ptr<%struct.2> %1, i32 %p0)
  %25 = getelementptr inbounds %struct.1, ptr %24, i32 0, i32 4
  %26 = call ptr<i32> @InlineArrayFirstElementRef(ptr<%struct.0> %25)
  %27 = call i32 @op_Implicit(i32 4)
  %28 = call i32 @op_Addition(i32 %p0, i32 %27)
  %29 = call i32 @op_Implicit(i32 %28)
  store i32 %29, ptr %26
  %30 = call ptr<%struct.1> @get_Item(ptr<%struct.2> %1, i32 %p0)
  %31 = getelementptr inbounds %struct.1, ptr %30, i32 0, i32 4
  %32 = call ptr<i32> @InlineArrayElementRef(ptr<%struct.0> %31, i32 1)
  %33 = call i32 @op_Implicit(i32 5)
  %34 = call i32 @op_Addition(i32 %p0, i32 %33)
  %35 = call i32 @op_Implicit(i32 %34)
  store i32 %35, ptr %32
  %36 = call ptr<%struct.1> @get_Item(ptr<%struct.2> %1, i32 %p0)
  %37 = getelementptr inbounds %struct.1, ptr %36, i32 0, i32 4
  %38 = call ptr<i32> @InlineArrayElementRef(ptr<%struct.0> %37, i32 2)
  %39 = call i32 @op_Implicit(i32 6)
  %40 = call i32 @op_Addition(i32 %p0, i32 %39)
  %41 = call i32 @op_Implicit(i32 %40)
  store i32 %41, ptr %38
  %42 = call ptr<%struct.1> @get_Item(ptr<%struct.2> %1, i32 %p0)
  %43 = getelementptr inbounds %struct.1, ptr %42, i32 0, i32 4
  %44 = call ptr<i32> @InlineArrayElementRef(ptr<%struct.0> %43, i32 3)
  %45 = call i32 @op_Implicit(i32 7)
  %46 = call i32 @op_Addition(i32 %p0, i32 %45)
  %47 = call i32 @op_Implicit(i32 %46)
  store i32 %47, ptr %44
  ret void

}

define i32 @op_Addition(i32 %p0, i32 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p0, ptr %0
  %1 = alloca i32, i32 1
  store i32 %p1, ptr %1
  %2 = alloca i32, i32 1
  %3 = addrspacecast ptr %0 to ptr<i32>
  %4 = addrspacecast ptr %1 to ptr<i32>
  %5 = addrspacecast ptr %2 to ptr<i32>
  br label %bb1

bb1:
  %6 = call i32 @get_X(ptr<i32> %3)
  %7 = call i32 @get_X(ptr<i32> %4)
  store i32 0, ptr %5
  %8 = add i32 %6, %7
  call void @.ctor(ptr<i32> %5, i32 %8)
  %9 = load i32, ptr %5
  ret i32 %9

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

define ptr<i32> @InlineArrayElementRef(ptr<%struct.0> %p0, i32 %p1) {
entry:
  %0 = bitcast ptr %p0 to ptr ; %struct.0 -> i32
  %1 = getelementptr i32, ptr %0, i32 %p1
  br label %bb1

bb1:
  ret ptr<i32> %1

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

define ptr<i32> @InlineArrayFirstElementRef(ptr<%struct.0> %p0) {
entry:
  %0 = bitcast ptr %p0 to ptr ; %struct.0 -> i32
  br label %bb1

bb1:
  ret ptr<i32> %0

}

define ptr<%struct.1> @get_Item(ptr<%struct.2> %p0, i32 %p1) {
entry:
  %0 = alloca %view.struct, i32 1
  store %view.struct null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%view.struct>
  br label %bb1

bb1:
  %2 = call %view.struct @get_BaseView(ptr<%struct.2> %p0)
  store %view.struct %2, ptr %0
  %3 = call i32 @ComputeLinearIndex(ptr<%struct.2> %p0, i32 %p1)
  %4 = load %view.struct, ptr %1
  %5 = getelementptr %struct.1, ptr %4, i32 %3
  ret ptr<%struct.1> %5

}

define i32 @ComputeLinearIndex(ptr<%struct.2> %p0, i32 %p1) {
entry:
  %0 = alloca i8, i32 1
  store i8 0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i8>
  br label %bb1

bb1:
  %2 = call i8 @get_Stride(ptr<%struct.2> %p0)
  store i8 %2, ptr %0
  %3 = call i32 @get_IntExtent(ptr<%struct.2> %p0)
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

define i32 @get_X(ptr<i32> %p0) {
entry:
  br label %bb1

bb1:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define i32 @get_IntExtent(ptr<%struct.2> %p0) {
entry:
  %0 = alloca i64, i32 1
  store i64 0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i64>
  br label %bb1

bb1:
  %2 = call i64 @get_Extent(ptr<%struct.2> %p0)
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

define void @.ctor(ptr<i32> %p0, i32 %p1) {
entry:
  br label %bb1

bb1:
  store i32 %p1, ptr %p0
  ret void

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

define i64 @get_X(ptr<i64> %p0) {
entry:
  br label %bb1

bb1:
  %0 = load i64, ptr %p0
  ret i64 %0

}

define i64 @get_Extent(ptr<%struct.2> %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 1
  br label %bb1

bb1:
  %1 = load i64, ptr %0
  ret i64 %1

}

define i8 @get_Stride(ptr<%struct.2> %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 2
  br label %bb1

bb1:
  %1 = load i8, ptr %0
  ret i8 %1

}

define %view.struct @get_BaseView(ptr<%struct.2> %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 0
  br label %bb1

bb1:
  %1 = load %view.struct, ptr %0
  ret %view.struct %1

}


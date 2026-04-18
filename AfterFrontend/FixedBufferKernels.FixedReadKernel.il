; module: FixedReadKernel  [intptr: i64]

%struct.0 = type { i32 }
%view.struct = view %struct.0
%struct.1 = type { %view.struct, i64, i8 }
%view.i32 = view i32
%struct.2 = type { %view.i32, i64, i8 }

define void @FixedReadKernel(i32 %p0, %struct.1 %p1, %struct.2 %p2) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = alloca %struct.2, i32 1
  store %struct.2 %p2, ptr %1
  %2 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %2
  %3 = addrspacecast ptr %0 to ptr<%struct.1>
  %4 = addrspacecast ptr %1 to ptr<%struct.2>
  %5 = getelementptr inbounds %struct.0, ptr %2, i32 0, i32 0
  %6 = addrspacecast ptr %5 to ptr<i32>
  %7 = getelementptr inbounds %struct.0, ptr %2, i32 0, i32 0
  %8 = getelementptr i32, ptr %7, i32 1
  %9 = addrspacecast ptr %8 to ptr<i32>
  %10 = getelementptr inbounds %struct.0, ptr %2, i32 0, i32 0
  %11 = getelementptr i32, ptr %10, i32 2
  %12 = addrspacecast ptr %11 to ptr<i32>
  %13 = getelementptr inbounds %struct.0, ptr %2, i32 0, i32 0
  %14 = getelementptr i32, ptr %13, i32 3
  %15 = addrspacecast ptr %14 to ptr<i32>
  br label %bb1

bb1:
  %16 = call ptr<%struct.0> @get_Item(ptr<%struct.1> %3, i32 %p0)
  %17 = load %struct.0, ptr %16
  store %struct.0 %17, ptr %2
  %18 = call ptr<i32> @get_Item(ptr<%struct.2> %4, i32 %p0)
  %19 = load i32, ptr %6
  %20 = load i32, ptr %9
  %21 = load i32, ptr %12
  %22 = load i32, ptr %15
  %23 = add i32 %19, %20
  %24 = add i32 %23, %21
  %25 = add i32 %24, %22
  store i32 %25, ptr %18
  ret void

}

define ptr<i32> @get_Item(ptr<%struct.2> %p0, i32 %p1) {
entry:
  %0 = alloca %view.i32, i32 1
  store %view.i32 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%view.i32>
  br label %bb1

bb1:
  %2 = call %view.i32 @get_BaseView(ptr<%struct.2> %p0)
  store %view.i32 %2, ptr %0
  %3 = call i32 @ComputeLinearIndex(ptr<%struct.2> %p0, i32 %p1)
  %4 = load %view.i32, ptr %1
  %5 = getelementptr i32, ptr %4, i32 %3
  ret ptr<i32> %5

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

define %view.i32 @get_BaseView(ptr<%struct.2> %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 0
  br label %bb1

bb1:
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

}

define ptr<%struct.0> @get_Item(ptr<%struct.1> %p0, i32 %p1) {
entry:
  %0 = alloca %view.struct, i32 1
  store %view.struct null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%view.struct>
  br label %bb1

bb1:
  %2 = call %view.struct @get_BaseView(ptr<%struct.1> %p0)
  store %view.struct %2, ptr %0
  %3 = call i32 @ComputeLinearIndex(ptr<%struct.1> %p0, i32 %p1)
  %4 = load %view.struct, ptr %1
  %5 = getelementptr %struct.0, ptr %4, i32 %3
  ret ptr<%struct.0> %5

}

define i32 @ComputeLinearIndex(ptr<%struct.1> %p0, i32 %p1) {
entry:
  %0 = alloca i8, i32 1
  store i8 0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i8>
  br label %bb1

bb1:
  %2 = call i8 @get_Stride(ptr<%struct.1> %p0)
  store i8 %2, ptr %0
  %3 = call i32 @get_IntExtent(ptr<%struct.1> %p0)
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

define i32 @get_IntExtent(ptr<%struct.1> %p0) {
entry:
  %0 = alloca i64, i32 1
  store i64 0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i64>
  br label %bb1

bb1:
  %2 = call i64 @get_Extent(ptr<%struct.1> %p0)
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

define i64 @get_Extent(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 1
  br label %bb1

bb1:
  %1 = load i64, ptr %0
  ret i64 %1

}

define i8 @get_Stride(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 2
  br label %bb1

bb1:
  %1 = load i8, ptr %0
  ret i8 %1

}

define %view.struct @get_BaseView(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 0
  br label %bb1

bb1:
  %1 = load %view.struct, ptr %0
  ret %view.struct %1

}


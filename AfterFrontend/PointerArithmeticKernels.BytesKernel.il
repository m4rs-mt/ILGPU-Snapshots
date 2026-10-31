; module: BytesKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i32, i32 }

define void @BytesKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p0, ptr %0
  %1 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %1
  %2 = alloca i32, i32 1
  store i32 0, ptr %2
  %3 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %3
  %4 = addrspacecast ptr %0 to ptr<i32>
  %5 = addrspacecast ptr %1 to ptr<%struct.0>
  %6 = getelementptr inbounds %struct.1, ptr %3, i32 0, i32 0
  %7 = addrspacecast ptr %6 to ptr<i32>
  %8 = getelementptr inbounds %struct.1, ptr %3, i32 0, i32 1
  %9 = addrspacecast ptr %8 to ptr<i32>
  %10 = getelementptr inbounds %struct.1, ptr %3, i32 0, i32 2
  %11 = addrspacecast ptr %10 to ptr<i32>
  %12 = addrspacecast ptr %2 to ptr<i32>
  %13 = bitcast ptr %12 to ptr ; i32 -> i8
  %14 = getelementptr i8, ptr %13, i32 1
  %15 = getelementptr i8, ptr %13, i32 2
  %16 = getelementptr inbounds %struct.1, ptr %3, i32 0, i32 0
  %17 = addrspacecast ptr %16 to ptr<i32>
  %18 = bitcast ptr %17 to ptr ; i32 -> i8
  %19 = getelementptr i8, ptr %18, i32 1
  %20 = bitcast ptr %19 to ptr ; i8 -> i8
  %21 = bitcast ptr %17 to ptr ; i32 -> i32
  %22 = getelementptr i32, ptr %21, i32 1
  br label %bb1

bb1:
  %23 = load i32, ptr %4
  %24 = call ptr<i32> @get_Item(ptr<%struct.0> %5, i32 %23)
  %25 = load i32, ptr %24
  %26 = add i32 %25, 16909056
  store i32 %26, ptr %2
  store i32 256, ptr %7
  store i32 2, ptr %9
  store i32 3, ptr %11
  %27 = load i32, ptr %4
  %28 = call ptr<i32> @get_Item(ptr<%struct.0> %5, i32 %27)
  %29 = load i8, ptr %13
  %30 = load i8, ptr %14
  %31 = load i8, ptr %15
  %32 = call i32 @get_X(ptr<i32> %4)
  %33 = and i32 %32, 3
  %34 = getelementptr i8, ptr %13, i32 %33
  %35 = load i8, ptr %34
  %36 = load i8, ptr %20
  %37 = load i32, ptr %22
  %38 = zext i8 %29 to i32
  %39 = zext i8 %30 to i32
  %40 = mul i32 %39, 10
  %41 = add i32 %38, %40
  %42 = zext i8 %31 to i32
  %43 = mul i32 %42, 100
  %44 = add i32 %41, %43
  %45 = zext i8 %35 to i32
  %46 = mul i32 %45, 1000
  %47 = add i32 %44, %46
  %48 = zext i8 %36 to i32
  %49 = add i32 %48, %37
  %50 = mul i32 %49, 10000
  %51 = add i32 %47, %50
  store i32 %51, ptr %28
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
  br label %bb1

bb1:
  %3 = call i32 @get_X(ptr<i32> %2)
  ret i32 %3

}

define i32 @get_X(ptr<i32> %p0) {
entry:
  br label %bb1

bb1:
  %0 = load i32, ptr %p0
  ret i32 %0

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

define %view.i32 @get_BaseView(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  br label %bb1

bb1:
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

}


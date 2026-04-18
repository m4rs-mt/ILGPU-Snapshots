; module: SharedMemoryArrayKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedMemoryArrayKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p0, ptr %0
  %1 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %1
  %2 = alloca %view.i32, i32 1
  store %view.i32 null, ptr %2
  %3 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 64)
  %4 = bitcast %view.i32 %3 to %view.i32
  %5 = call i32 @ilgpu.group.index()
  %6 = icmp sge i32 %5, 64
  %7 = addrspacecast ptr %2 to ptr<%view.i32>
  %8 = addrspacecast ptr %0 to ptr<i32>
  %9 = call i32 @ilgpu.group.dim()
  br label %bb1

bb1:
  store %view.i32 %4, ptr %2
  br i1 %6, label %bb3, label %bb2

bb2:
  %10 = load %view.i32, ptr %7
  %11 = call i32 @get_X(ptr<i32> %8)
  %12 = getelementptr i32, ptr %10, i32 %5
  store i32 %11, ptr %12
  br label %bb3

bb3:
  %13 = phi i32 [ %5, %bb1 ], [ %5, %bb2 ]
  %14 = phi i32 [ %9, %bb1 ], [ %9, %bb2 ]
  %15 = phi ptr<%struct.0> addrspace(local) [ %1, %bb1 ], [ %1, %bb2 ]
  %16 = phi ptr<i32> addrspace(local) [ %0, %bb1 ], [ %0, %bb2 ]
  %17 = phi ptr<%view.i32> addrspace(local) [ %2, %bb1 ], [ %2, %bb2 ]
  call void @ilgpu.barrier.group()
  %18 = icmp sge i32 %13, 64
  %19 = add i32 %13, 1
  %20 = srem i32 %19, %14
  %21 = icmp sge i32 %20, 64
  %22 = addrspacecast ptr %16 to ptr<i32>
  %23 = addrspacecast ptr %15 to ptr<%struct.0>
  %24 = addrspacecast ptr %17 to ptr<%view.i32>
  %25 = addrspacecast ptr %16 to ptr<i32>
  %26 = addrspacecast ptr %15 to ptr<%struct.0>
  %27 = addrspacecast ptr %17 to ptr<%view.i32>
  br i1 %18, label %bb8, label %bb4

bb4:
  br i1 %21, label %bb6, label %bb5

bb5:
  %28 = load i32, ptr %22
  %29 = call ptr<i32> @get_Item(ptr<%struct.0> %23, i32 %28)
  %30 = load %view.i32, ptr %24
  %31 = getelementptr i32, ptr %30, i32 %20
  %32 = load i32, ptr %31
  store i32 %32, ptr %29
  br label %bb7

bb6:
  %33 = load i32, ptr %25
  %34 = call ptr<i32> @get_Item(ptr<%struct.0> %26, i32 %33)
  %35 = load %view.i32, ptr %27
  %36 = getelementptr i32, ptr %35, i32 %13
  %37 = load i32, ptr %36
  store i32 %37, ptr %34
  br label %bb7

bb7:
  br label %bb8

bb8:
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

define i32 @get_X(ptr<i32> %p0) {
entry:
  br label %bb1

bb1:
  %0 = load i32, ptr %p0
  ret i32 %0

}


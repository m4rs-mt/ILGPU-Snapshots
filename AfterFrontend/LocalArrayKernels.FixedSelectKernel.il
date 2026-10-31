; module: FixedSelectKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global i32 zeroinitializer ; local

define void @FixedSelectKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p0, ptr %0
  %1 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %1
  %2 = addrspacecast ptr %0 to ptr<i32>
  %3 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 2)
  %4 = call array<i32, 1> @ilgpu.array.new(ptr @g1, i32 4)
  %5 = call array<i32, 1> @ilgpu.array.new(ptr undef, i32 0)
  %6 = call i32 @ilgpu.array.length(array<i32, 1> %5)
  %7 = icmp ne i32 %6, 0
  %8 = getelementptr i32, ptr %5, i32 0
  %9 = bitcast ptr %8 to ptr ; i32 -> i32
  br label %bb1

bb1:
  %10 = call i32 @get_X(ptr<i32> %2)
  %11 = and i32 %10, 1
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %bb3, label %bb2

bb2:
  br label %bb4

bb3:
  br label %bb4

bb4:
  %13 = phi array<i32, 1> [ %3, %bb2 ], [ %4, %bb3 ]
  %14 = phi ptr<i32> addrspace(local) [ %0, %bb2 ], [ %0, %bb3 ]
  %15 = phi ptr<%struct.0> addrspace(local) [ %1, %bb2 ], [ %1, %bb3 ]
  %16 = addrspacecast ptr %14 to ptr<i32>
  %17 = call i32 @get_X(ptr<i32> %16)
  call void @Fill(array<i32, 1> %13, i32 %17)
  %18 = load i32, ptr %16
  %19 = addrspacecast ptr %15 to ptr<%struct.0>
  %20 = call ptr<i32> @get_Item(ptr<%struct.0> %19, i32 %18)
  %21 = call i32 @SumLowBytes(array<i32, 1> %13)
  store i32 %21, ptr %20
  br label %bb5

bb5:
  br i1 %7, label %bb7, label %bb6

bb6:
  br label %bb8

bb7:
  br label %bb8

bb8:
  %22 = phi ptr<%struct.0> addrspace(local) [ %15, %bb7 ], [ %15, %bb6 ]
  %23 = phi ptr<i32> addrspace(local) [ %14, %bb7 ], [ %14, %bb6 ]
  %24 = phi ptr<i32> [ %9, %bb7 ], [ null, %bb6 ]
  %25 = addrspacecast ptr %23 to ptr<i32>
  %26 = load i32, ptr %25
  %27 = call i32 @op_Implicit(i32 4)
  %28 = call i32 @op_Addition(i32 %26, i32 %27)
  %29 = addrspacecast ptr %22 to ptr<%struct.0>
  %30 = call ptr<i32> @get_Item(ptr<%struct.0> %29, i32 %28)
  %31 = icmp eq ptr<i32> %24, null
  br i1 %31, label %bb10, label %bb9

bb9:
  br label %bb11

bb10:
  br label %bb11

bb11:
  %32 = phi i32 [ 1, %bb9 ], [ -7, %bb10 ]
  %33 = phi ptr<i32> [ %30, %bb9 ], [ %30, %bb10 ]
  store i32 %32, ptr %33
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

define i32 @SumLowBytes(array<i32, 1> %p0) {
entry:
  %0 = call i32 @ilgpu.array.length(array<i32, 1> %p0)
  %1 = icmp ne i32 %0, 0
  %2 = getelementptr i32, ptr %p0, i32 0
  %3 = bitcast ptr %2 to ptr ; i32 -> i32
  br label %bb1

bb1:
  br label %bb2

bb2:
  br i1 %1, label %bb4, label %bb3

bb3:
  br label %bb5

bb4:
  br label %bb5

bb5:
  %4 = phi ptr<i32> [ %3, %bb4 ], [ null, %bb3 ]
  %5 = phi array<i32, 1> [ %p0, %bb4 ], [ %p0, %bb3 ]
  %6 = phi i32 [ 0, %bb4 ], [ 0, %bb3 ]
  %7 = bitcast ptr %4 to ptr ; i32 -> i8
  br label %bb6

bb6:
  %8 = phi i32 [ 0, %bb5 ], [ %12, %bb9 ]
  %9 = phi array<i32, 1> [ %5, %bb5 ], [ %9, %bb9 ]
  %10 = phi i32 [ %6, %bb5 ], [ %19, %bb9 ]
  %11 = phi ptr<i8> [ %7, %bb5 ], [ %11, %bb9 ]
  %12 = add i32 %8, 1
  %13 = call i32 @ilgpu.array.length(array<i32, 1> %9)
  %14 = icmp slt i32 %8, %13
  %15 = shl i32 %8, 2
  %16 = getelementptr i8, ptr %11, i32 %15
  br i1 %14, label %bb9, label %bb7

bb7:
  br label %bb8

bb8:
  ret i32 %10

bb9:
  %17 = load i8, ptr %16
  %18 = zext i8 %17 to i32
  %19 = add i32 %10, %18
  br label %bb6

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

define void @Fill(array<i32, 1> %p0, i32 %p1) {
entry:
  %0 = call i32 @ilgpu.array.length(array<i32, 1> %p0)
  %1 = icmp ne i32 %0, 0
  %2 = getelementptr i32, ptr %p0, i32 0
  %3 = bitcast ptr %2 to ptr ; i32 -> i32
  br label %bb1

bb1:
  br label %bb2

bb2:
  br i1 %1, label %bb4, label %bb3

bb3:
  br label %bb5

bb4:
  br label %bb5

bb5:
  %4 = phi array<i32, 1> [ %p0, %bb4 ], [ %p0, %bb3 ]
  %5 = phi ptr<i32> [ %3, %bb4 ], [ null, %bb3 ]
  %6 = phi i32 [ %p1, %bb4 ], [ %p1, %bb3 ]
  br label %bb6

bb6:
  %7 = phi i32 [ 0, %bb5 ], [ %11, %bb8 ]
  %8 = phi array<i32, 1> [ %4, %bb5 ], [ %8, %bb8 ]
  %9 = phi ptr<i32> [ %5, %bb5 ], [ %9, %bb8 ]
  %10 = phi i32 [ %6, %bb5 ], [ %10, %bb8 ]
  %11 = add i32 %7, 1
  %12 = call i32 @ilgpu.array.length(array<i32, 1> %8)
  %13 = icmp slt i32 %7, %12
  %14 = getelementptr i32, ptr %9, i32 %7
  %15 = add i32 %10, %7
  br i1 %13, label %bb8, label %bb7

bb7:
  ret void

bb8:
  store i32 %15, ptr %14
  br label %bb6

}

define i32 @get_X(ptr<i32> %p0) {
entry:
  br label %bb1

bb1:
  %0 = load i32, ptr %p0
  ret i32 %0

}


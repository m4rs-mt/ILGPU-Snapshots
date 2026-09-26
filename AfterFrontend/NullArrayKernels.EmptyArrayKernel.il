; module: EmptyArrayKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global float zeroinitializer ; local
@g2 = internal global i32 zeroinitializer ; local
@g3 = internal global i32 zeroinitializer ; local
@g4 = internal global i32 zeroinitializer ; local
@g5 = internal global i32 zeroinitializer ; local
@g6 = internal global i32 zeroinitializer ; local

define void @EmptyArrayKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p0, ptr %0
  %1 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %1
  %2 = addrspacecast ptr %0 to ptr<i32>
  %3 = call array<i32, 1> @ilgpu.array.new(ptr @g2, i32 0)
  %4 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %5 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %6 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %7 = call array<float, 1> @ilgpu.array.new(ptr @g1, i32 0)
  %8 = getelementptr i32, ptr null, i32 0
  %9 = call array<i32, 1> @ilgpu.array.new(ptr @g3, i32 0)
  %10 = getelementptr i32, ptr %9, i32 0
  %11 = call array<i32, 1> @ilgpu.array.new(ptr @g4, i32 0)
  %12 = getelementptr i32, ptr %11, i32 0
  %13 = call array<i32, 1> @ilgpu.array.new(ptr @g5, i32 0)
  %14 = getelementptr i32, ptr %13, i32 0
  %15 = call array<i32, 1> @ilgpu.array.new(ptr @g6, i32 0)
  %16 = getelementptr i32, ptr %15, i32 0
  br label %bb1

bb1:
  %17 = call i32 @get_X(ptr<i32> %2)
  %18 = and i32 %17, 1
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %bb3, label %bb2

bb2:
  br label %bb4

bb3:
  br label %bb4

bb4:
  %20 = phi array<i32, 1> [ %3, %bb2 ], [ %4, %bb3 ]
  %21 = phi ptr<%struct.0> addrspace(local) [ %1, %bb2 ], [ %1, %bb3 ]
  %22 = phi ptr<i32> addrspace(local) [ %0, %bb2 ], [ %0, %bb3 ]
  %23 = phi array<i32, 1> [ %5, %bb2 ], [ %5, %bb3 ]
  %24 = phi array<i32, 1> [ %6, %bb2 ], [ %6, %bb3 ]
  %25 = phi array<float, 1> [ %7, %bb2 ], [ %7, %bb3 ]
  %26 = addrspacecast ptr %22 to ptr<i32>
  %27 = load i32, ptr %26
  %28 = addrspacecast ptr %21 to ptr<%struct.0>
  %29 = call ptr<i32> @get_Item(ptr<%struct.0> %28, i32 %27)
  %30 = getelementptr i32, ptr %23, i32 0
  %31 = icmp ne ptr<i32> %30, %8
  %32 = call i32 @ilgpu.array.length(array<i32, 1> %23)
  %33 = mul i32 %32, 100000
  br i1 %31, label %bb6, label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %34 = phi i32 [ 0, %bb5 ], [ 1, %bb6 ]
  %35 = phi i32 [ %33, %bb5 ], [ %33, %bb6 ]
  %36 = phi array<i32, 1> [ %23, %bb5 ], [ %23, %bb6 ]
  %37 = phi array<i32, 1> [ %24, %bb5 ], [ %24, %bb6 ]
  %38 = phi array<i32, 1> [ %20, %bb5 ], [ %20, %bb6 ]
  %39 = phi array<float, 1> [ %25, %bb5 ], [ %25, %bb6 ]
  %40 = phi ptr<i32> [ %29, %bb5 ], [ %29, %bb6 ]
  %41 = getelementptr i32, ptr %36, i32 0
  %42 = getelementptr i32, ptr %37, i32 0
  %43 = icmp eq ptr<i32> %41, %42
  %44 = add i32 %35, %34
  br i1 %43, label %bb9, label %bb8

bb8:
  br label %bb10

bb9:
  br label %bb10

bb10:
  %45 = phi i32 [ 0, %bb8 ], [ 10, %bb9 ]
  %46 = phi i32 [ %44, %bb8 ], [ %44, %bb9 ]
  %47 = phi array<i32, 1> [ %38, %bb8 ], [ %38, %bb9 ]
  %48 = phi array<i32, 1> [ %36, %bb8 ], [ %36, %bb9 ]
  %49 = phi array<i32, 1> [ %37, %bb8 ], [ %37, %bb9 ]
  %50 = phi array<float, 1> [ %39, %bb8 ], [ %39, %bb9 ]
  %51 = phi ptr<i32> [ %40, %bb8 ], [ %40, %bb9 ]
  %52 = getelementptr i32, ptr %47, i32 0
  %53 = getelementptr i32, ptr %48, i32 0
  %54 = icmp eq ptr<i32> %52, %53
  %55 = add i32 %46, %45
  br i1 %54, label %bb12, label %bb11

bb11:
  br label %bb13

bb12:
  br label %bb13

bb13:
  %56 = phi i32 [ 0, %bb11 ], [ 100, %bb12 ]
  %57 = phi i32 [ %55, %bb11 ], [ %55, %bb12 ]
  %58 = phi array<i32, 1> [ %49, %bb11 ], [ %49, %bb12 ]
  %59 = phi array<i32, 1> [ %48, %bb11 ], [ %48, %bb12 ]
  %60 = phi array<float, 1> [ %50, %bb11 ], [ %50, %bb12 ]
  %61 = phi ptr<i32> [ %51, %bb11 ], [ %51, %bb12 ]
  %62 = call i1 @IsEmptyArray(array<i32, 1> %58)
  %63 = add i32 %57, %56
  br i1 %62, label %bb15, label %bb14

bb14:
  br label %bb16

bb15:
  br label %bb16

bb16:
  %64 = phi i32 [ 0, %bb14 ], [ 1000, %bb15 ]
  %65 = phi i32 [ %63, %bb14 ], [ %63, %bb15 ]
  %66 = phi array<i32, 1> [ %59, %bb14 ], [ %59, %bb15 ]
  %67 = phi array<float, 1> [ %60, %bb14 ], [ %60, %bb15 ]
  %68 = phi array<i32, 1> [ %58, %bb14 ], [ %58, %bb15 ]
  %69 = phi ptr<i32> [ %61, %bb14 ], [ %61, %bb15 ]
  %70 = getelementptr i32, ptr %66, i32 0
  %71 = icmp eq ptr<i32> %10, %70
  %72 = add i32 %65, %64
  br i1 %71, label %bb18, label %bb17

bb17:
  br label %bb19

bb18:
  br label %bb19

bb19:
  %73 = phi i32 [ 0, %bb17 ], [ 10000, %bb18 ]
  %74 = phi i32 [ %72, %bb17 ], [ %72, %bb18 ]
  %75 = phi array<i32, 1> [ %66, %bb17 ], [ %66, %bb18 ]
  %76 = phi array<float, 1> [ %67, %bb17 ], [ %67, %bb18 ]
  %77 = phi array<i32, 1> [ %68, %bb17 ], [ %68, %bb18 ]
  %78 = phi ptr<i32> [ %69, %bb17 ], [ %69, %bb18 ]
  %79 = getelementptr i32, ptr %75, i32 0
  %80 = getelementptr float, ptr %76, i32 0
  %81 = bitcast ptr %80 to ptr ; float -> i32
  %82 = icmp eq ptr<i32> %79, %81
  %83 = add i32 %74, %73
  br i1 %82, label %bb21, label %bb20

bb20:
  br label %bb22

bb21:
  br label %bb22

bb22:
  %84 = phi i32 [ 0, %bb20 ], [ 1000000, %bb21 ]
  %85 = phi i32 [ %83, %bb20 ], [ %83, %bb21 ]
  %86 = phi array<i32, 1> [ %75, %bb20 ], [ %75, %bb21 ]
  %87 = phi array<i32, 1> [ %77, %bb20 ], [ %77, %bb21 ]
  %88 = phi ptr<i32> [ %78, %bb20 ], [ %78, %bb21 ]
  %89 = getelementptr i32, ptr %86, i32 0
  %90 = icmp eq ptr<i32> %89, %12
  %91 = add i32 %85, %84
  br i1 %90, label %bb24, label %bb23

bb23:
  br label %bb25

bb24:
  br label %bb25

bb25:
  %92 = phi i32 [ 0, %bb23 ], [ 10000000, %bb24 ]
  %93 = phi i32 [ %91, %bb23 ], [ %91, %bb24 ]
  %94 = phi array<i32, 1> [ %86, %bb23 ], [ %86, %bb24 ]
  %95 = phi array<i32, 1> [ %87, %bb23 ], [ %87, %bb24 ]
  %96 = phi ptr<i32> [ %88, %bb23 ], [ %88, %bb24 ]
  %97 = getelementptr i32, ptr %94, i32 0
  %98 = icmp eq ptr<i32> %97, %14
  %99 = add i32 %93, %92
  br i1 %98, label %bb27, label %bb26

bb26:
  br label %bb28

bb27:
  br label %bb28

bb28:
  %100 = phi i32 [ 0, %bb26 ], [ 10000000, %bb27 ]
  %101 = phi i32 [ %99, %bb26 ], [ %99, %bb27 ]
  %102 = phi array<i32, 1> [ %94, %bb26 ], [ %94, %bb27 ]
  %103 = phi array<i32, 1> [ %95, %bb26 ], [ %95, %bb27 ]
  %104 = phi ptr<i32> [ %96, %bb26 ], [ %96, %bb27 ]
  %105 = getelementptr i32, ptr %102, i32 0
  %106 = icmp eq ptr<i32> %105, %16
  %107 = add i32 %101, %100
  br i1 %106, label %bb30, label %bb29

bb29:
  br label %bb31

bb30:
  br label %bb31

bb31:
  %108 = phi i32 [ 0, %bb29 ], [ 10000000, %bb30 ]
  %109 = phi i32 [ %107, %bb29 ], [ %107, %bb30 ]
  %110 = phi array<i32, 1> [ %103, %bb29 ], [ %103, %bb30 ]
  %111 = phi ptr<i32> [ %104, %bb29 ], [ %104, %bb30 ]
  %112 = call i1 @IsEmptyUIntArray(array<i32, 1> %110)
  %113 = add i32 %109, %108
  br i1 %112, label %bb33, label %bb32

bb32:
  br label %bb34

bb33:
  br label %bb34

bb34:
  %114 = phi i32 [ 0, %bb32 ], [ 10000000, %bb33 ]
  %115 = phi i32 [ %113, %bb32 ], [ %113, %bb33 ]
  %116 = phi ptr<i32> [ %111, %bb32 ], [ %111, %bb33 ]
  %117 = add i32 %115, %114
  store i32 %117, ptr %116
  ret void

}

define i1 @IsEmptyUIntArray(array<i32, 1> %p0) {
entry:
  %0 = getelementptr i32, ptr %p0, i32 0
  %1 = call array<i32, 1> @ilgpu.array.new(ptr @g4, i32 0)
  %2 = getelementptr i32, ptr %1, i32 0
  %3 = icmp eq ptr<i32> %0, %2
  br label %bb1

bb1:
  ret i1 %3

}

define i1 @IsEmptyArray(array<i32, 1> %p0) {
entry:
  %0 = getelementptr i32, ptr %p0, i32 0
  %1 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %2 = getelementptr i32, ptr %1, i32 0
  %3 = icmp eq ptr<i32> %0, %2
  br label %bb1

bb1:
  ret i1 %3

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

define i32 @get_X(ptr<i32> %p0) {
entry:
  br label %bb1

bb1:
  %0 = load i32, ptr %p0
  ret i32 %0

}


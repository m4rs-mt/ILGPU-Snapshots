; stage: AfterGlobalOpt  opt: O0
; module: FixedSelectKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global i32 zeroinitializer ; local

define void @FixedSelectKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = and i32 %p0, 1
  %2 = icmp eq i32 %1, 0
  %3 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 2)
  %4 = call array<i32, 1> @ilgpu.array.new(ptr @g1, i32 4)
  %5 = call array<i32, 1> @ilgpu.array.new(ptr undef, i32 0)
  %6 = call i32 @ilgpu.array.length(array<i32, 1> %5)
  %7 = icmp ne i32 %6, 0
  %8 = getelementptr i32, ptr %5, i32 0
  br i1 %2, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %9 = phi array<i32, 1> [ %3, %bb1 ], [ %4, %bb2 ]
  %10 = call i32 @ilgpu.array.length(array<i32, 1> %9)
  %11 = icmp ne i32 %10, 0
  %12 = getelementptr i32, ptr %9, i32 0
  %13 = call i32 @ilgpu.array.length(array<i32, 1> %9)
  %14 = call i32 @ilgpu.array.length(array<i32, 1> %9)
  %15 = icmp ne i32 %14, 0
  %16 = getelementptr i32, ptr %9, i32 0
  %17 = call i32 @ilgpu.array.length(array<i32, 1> %9)
  br i1 %11, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %18 = phi ptr<i32> [ %12, %bb5 ], [ null, %bb4 ]
  br label %bb7

bb7:
  %19 = phi i32 [ 0, %bb6 ], [ %20, %bb21 ]
  %20 = add i32 %19, 1
  %21 = icmp slt i32 %19, %13
  %22 = getelementptr i32, ptr %18, i32 %19
  %23 = add i32 %p0, %19
  br i1 %21, label %bb21, label %bb8

bb8:
  %24 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %25 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %26 = getelementptr i32, ptr %24, i32 %25
  br i1 %15, label %bb10, label %bb9

bb9:
  br label %bb11

bb10:
  br label %bb11

bb11:
  %27 = phi ptr<i32> [ %16, %bb10 ], [ null, %bb9 ]
  %28 = bitcast ptr %27 to ptr ; i32 -> i8
  br label %bb12

bb12:
  %29 = phi i32 [ 0, %bb11 ], [ %31, %bb20 ]
  %30 = phi i32 [ 0, %bb11 ], [ %52, %bb20 ]
  %31 = add i32 %29, 1
  %32 = icmp slt i32 %29, %17
  %33 = shl i32 %29, 2
  %34 = getelementptr i8, ptr %28, i32 %33
  br i1 %32, label %bb20, label %bb13

bb13:
  store i32 %30, ptr %26
  br i1 %7, label %bb15, label %bb14

bb14:
  br label %bb16

bb15:
  br label %bb16

bb16:
  %35 = phi ptr<i32> [ %8, %bb15 ], [ null, %bb14 ]
  %36 = alloca i32, i32 1
  store i32 0, ptr %36
  call void @.ctor(ptr<i32> addrspace(local) %36, i32 4)
  %37 = load i32, ptr %36
  %38 = alloca i32, i32 1
  store i32 %p0, ptr %38
  %39 = alloca i32, i32 1
  store i32 %37, ptr %39
  %40 = alloca i32, i32 1
  %41 = call i32 @get_X(ptr<i32> addrspace(local) %38)
  %42 = call i32 @get_X(ptr<i32> addrspace(local) %39)
  store i32 0, ptr %40
  %43 = add i32 %41, %42
  call void @.ctor(ptr<i32> addrspace(local) %40, i32 %43)
  %44 = load i32, ptr %40
  %45 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %46 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %44)
  %47 = icmp eq ptr<i32> %35, null
  %48 = getelementptr i32, ptr %45, i32 %46
  br i1 %47, label %bb18, label %bb17

bb17:
  br label %bb19

bb18:
  br label %bb19

bb19:
  %49 = phi i32 [ 1, %bb17 ], [ -7, %bb18 ]
  store i32 %49, ptr %48
  ret void

bb20:
  %50 = load i8, ptr %34
  %51 = zext i8 %50 to i32
  %52 = add i32 %30, %51
  br label %bb12

bb21:
  store i32 %23, ptr %22
  br label %bb7

}

define void @.ctor(ptr<i32> addrspace(local) %p0, i32 %p1) {
entry:
  store i32 %p1, ptr %p0
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
  %0 = icmp sge i32 %p1, 0
  %1 = icmp slt i32 %p1, %p2
  %2 = and i1 %0, %1
  %3 = icmp eq i32 %p1, 0
  %4 = icmp eq i32 %p2, 0
  %5 = and i1 %3, %4
  %6 = or i1 %2, %5
  %7 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  %8 = alloca i32, i32 1
  store i32 %p1, ptr %8
  %9 = call i32 @get_X(ptr<i32> addrspace(local) %8)
  ret i32 %9

}

define i32 @get_X(ptr<i32> addrspace(local) %p0) {
entry:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define i32 @ToIntIndex(ptr<i64> addrspace(local) %p0) {
entry:
  %0 = load i64, ptr %p0
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = load i64, ptr %p0
  %6 = trunc i64 %5 to i32
  ret i32 %6

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


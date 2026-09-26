; stage: AfterGlobalOpt  opt: O0
; module: EmptyArrayKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global i32 zeroinitializer ; local
@g2 = internal global i32 zeroinitializer ; local

define void @EmptyArrayKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = and i32 %p0, 1
  %2 = icmp eq i32 %1, 0
  %3 = call array<i32, 1> @ilgpu.array.new(ptr @g2, i32 0)
  %4 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %5 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %6 = getelementptr i32, ptr %5, i32 0
  %7 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %8 = call i32 @ilgpu.array.length(array<i32, 1> %5)
  %9 = mul i32 %8, 100000
  %10 = add i32 %9, 11
  br i1 %2, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %11 = phi array<i32, 1> [ %3, %bb1 ], [ %4, %bb2 ]
  %12 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %13 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %14 = getelementptr i32, ptr %11, i32 0
  %15 = icmp eq ptr<i32> %14, %6
  %16 = getelementptr i32, ptr %12, i32 %13
  br i1 %15, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %17 = phi i32 [ 0, %bb4 ], [ 100, %bb5 ]
  %18 = call i1 @IsEmptyArray(array<i32, 1> %7)
  %19 = add i32 %10, %17
  br i1 %18, label %bb8, label %bb7

bb7:
  br label %bb9

bb8:
  br label %bb9

bb9:
  %20 = phi i32 [ 0, %bb7 ], [ 1000, %bb8 ]
  %21 = call i1 @IsEmptyUIntArray(array<i32, 1> %7)
  %22 = add i32 %19, %20
  br i1 %21, label %bb11, label %bb10

bb10:
  br label %bb12

bb11:
  br label %bb12

bb12:
  %23 = phi i32 [ 0, %bb10 ], [ 10000000, %bb11 ]
  %24 = add i32 %22, %23
  store i32 %24, ptr %16
  ret void

}

define i1 @IsEmptyUIntArray(array<i32, 1> %p0) {
entry:
  %0 = getelementptr i32, ptr %p0, i32 0
  %1 = call array<i32, 1> @ilgpu.array.new(ptr @g1, i32 0)
  %2 = getelementptr i32, ptr %1, i32 0
  %3 = icmp eq ptr<i32> %0, %2
  ret i1 %3

}

define i1 @IsEmptyArray(array<i32, 1> %p0) {
entry:
  %0 = getelementptr i32, ptr %p0, i32 0
  %1 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %2 = getelementptr i32, ptr %1, i32 0
  %3 = icmp eq ptr<i32> %0, %2
  ret i1 %3

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


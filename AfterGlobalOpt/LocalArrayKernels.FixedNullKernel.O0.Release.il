; stage: AfterGlobalOpt  opt: O0
; module: FixedNullKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @FixedNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 2)
  %2 = and i32 %p0, 1
  %3 = getelementptr i32, ptr %1, i32 %2
  store i32 %p0, ptr %3
  %4 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %5 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %6 = call i32 @ilgpu.array.length(array<i32, 1> %1)
  %7 = icmp ne i32 %6, 0
  %8 = getelementptr i32, ptr %1, i32 0
  %9 = call array<i32, 1> @ilgpu.array.new(ptr undef, i32 0)
  %10 = call i32 @ilgpu.array.length(array<i32, 1> %9)
  %11 = icmp ne i32 %10, 0
  %12 = getelementptr i32, ptr %9, i32 0
  %13 = call i32 @ilgpu.array.length(array<i32, 1> null)
  %14 = icmp ne i32 %13, 0
  %15 = getelementptr i32, ptr null, i32 0
  %16 = getelementptr i32, ptr %4, i32 %5
  br i1 %7, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %17 = phi ptr<i32> [ %8, %bb2 ], [ null, %bb1 ]
  %18 = icmp eq ptr<i32> %17, null
  br i1 %18, label %bb5, label %bb4

bb4:
  %19 = load i32, ptr %17
  br label %bb6

bb5:
  br label %bb6

bb6:
  %20 = phi i32 [ %19, %bb4 ], [ -1, %bb5 ]
  br i1 %11, label %bb8, label %bb7

bb7:
  br label %bb9

bb8:
  br label %bb9

bb9:
  %21 = phi ptr<i32> [ %12, %bb8 ], [ null, %bb7 ]
  %22 = icmp eq ptr<i32> %21, null
  br i1 %22, label %bb11, label %bb10

bb10:
  %23 = load i32, ptr %21
  br label %bb12

bb11:
  br label %bb12

bb12:
  %24 = phi i32 [ %23, %bb10 ], [ -1, %bb11 ]
  %25 = add i32 %20, %24
  br i1 %14, label %bb14, label %bb13

bb13:
  br label %bb15

bb14:
  br label %bb15

bb15:
  %26 = phi ptr<i32> [ %15, %bb14 ], [ null, %bb13 ]
  %27 = icmp eq ptr<i32> %26, null
  br i1 %27, label %bb17, label %bb16

bb16:
  %28 = load i32, ptr %26
  br label %bb18

bb17:
  br label %bb18

bb18:
  %29 = phi i32 [ %28, %bb16 ], [ -1, %bb17 ]
  %30 = add i32 %25, %29
  store i32 %30, ptr %16
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


; stage: AfterGlobalOpt  opt: O0
; module: MixedSpaceRefKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @MixedSpaceRefKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p0, ptr %0
  %1 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %1
  %2 = alloca %view.i32, i32 1
  %3 = bitcast %view.i32 null to %view.i32
  store %view.i32 %3, ptr %2
  %4 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 32)
  store %view.i32 %4, ptr %2
  %5 = call i32 @ilgpu.group.index()
  %6 = icmp sge i32 %5, 32
  %7 = add i32 %5, 1
  %8 = mul i32 %7, 10
  %9 = icmp sge i32 %5, 32
  %10 = srem i32 %5, 2
  %11 = icmp eq i32 %10, 0
  %12 = icmp sge i32 %5, 32
  br i1 %6, label %bb2, label %bb1

bb1:
  %13 = load %view.i32, ptr %2
  %14 = getelementptr i32, ptr %13, i32 %5
  store i32 %8, ptr %14
  br label %bb2

bb2:
  %15 = load i32, ptr %0
  %16 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %1)
  %17 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %1, i32 %15)
  %18 = load i32, ptr %0
  %19 = getelementptr i32, ptr %16, i32 %17
  br label %bb3

bb3:
  store i32 %18, ptr %19
  call void @ilgpu.barrier.group()
  br i1 %9, label %bb9, label %bb4

bb4:
  br i1 %11, label %bb7, label %bb5

bb5:
  %20 = load i32, ptr %0
  %21 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %1)
  %22 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %1, i32 %20)
  %23 = getelementptr i32, ptr %21, i32 %22
  br label %bb6

bb6:
  br label %bb8

bb7:
  %24 = load %view.i32, ptr %2
  %25 = getelementptr i32, ptr %24, i32 %5
  %26 = addrspacecast ptr %25 to ptr<i32>
  br label %bb8

bb8:
  %27 = phi ptr<i32> [ %23, %bb6 ], [ %26, %bb7 ]
  %28 = load i32, ptr %27
  %29 = add i32 %28, 1
  store i32 %29, ptr %27
  br label %bb9

bb9:
  call void @ilgpu.barrier.group()
  br i1 %12, label %bb11, label %bb10

bb10:
  %30 = load i32, ptr %0
  %31 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %1)
  %32 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %1, i32 %30)
  %33 = getelementptr i32, ptr %31, i32 %32
  %34 = load i32, ptr %33
  %35 = load %view.i32, ptr %2
  %36 = getelementptr i32, ptr %35, i32 %5
  %37 = load i32, ptr %36
  %38 = add i32 %34, %37
  store i32 %38, ptr %33
  br label %bb11

bb11:
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
  %0 = alloca i8, i32 1
  store i8 %p0, ptr %0
  %1 = alloca i32, i32 1
  store i32 %p1, ptr %1
  %2 = call i32 @get_X(ptr<i32> addrspace(local) %1)
  %3 = addrspacecast ptr %0 to ptr<i8>
  %4 = call i32 @get_XStride(ptr<i8> %3)
  %5 = mul i32 %2, %4
  ret i32 %5

}

define i32 @get_XStride(ptr<i8> %p0) {
entry:
  ret i32 1

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


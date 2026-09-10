; stage: AfterGlobalOpt  opt: O0
; module: AccumulateKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @AccumulateKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 3)
  %2 = getelementptr i32, ptr %1, i32 0
  %3 = getelementptr i32, ptr %1, i32 1
  %4 = getelementptr i32, ptr %1, i32 2
  br label %bb1

bb1:
  store i32 1, ptr %2
  store i32 2, ptr %3
  store i32 3, ptr %4
  br label %bb2

bb2:
  %5 = phi i32 [ 0, %bb1 ], [ %7, %bb4 ]
  %6 = phi i32 [ 0, %bb1 ], [ %14, %bb4 ]
  %7 = add i32 %5, 1
  %8 = icmp slt i32 %5, 3
  %9 = getelementptr i32, ptr %1, i32 %5
  br i1 %8, label %bb4, label %bb3

bb3:
  %10 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %11 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %12 = getelementptr i32, ptr %10, i32 %11
  store i32 %6, ptr %12
  ret void

bb4:
  %13 = load i32, ptr %9
  %14 = add i32 %6, %13
  br label %bb2

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


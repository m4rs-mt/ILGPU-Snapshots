; stage: AfterGlobalOpt  opt: O0
; module: LocalNullCheckKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @LocalNullCheckKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca i32, i32 1
  store i32 0, ptr %1
  %2 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %3 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %4 = getelementptr i32, ptr %2, i32 %3
  br label %bb1

bb1:
  %5 = load i32, ptr %4
  store i32 %5, ptr %1
  %6 = load i32, ptr %1
  %7 = icmp sle i32 %6, 15
  br i1 %7, label %bb3, label %bb2

bb2:
  br label %bb3

bb3:
  %8 = phi ptr<i32> addrspace(local) [ null, %bb1 ], [ %1, %bb2 ]
  %9 = icmp eq ptr<i32> addrspace(local) %8, null
  %10 = icmp eq ptr<i32> addrspace(local) %8, null
  br i1 %9, label %bb5, label %bb4

bb4:
  %11 = load i32, ptr %8
  %12 = add i32 %11, 100
  store i32 %12, ptr %8
  br label %bb5

bb5:
  %13 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %14 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %15 = load i32, ptr %1
  %16 = getelementptr i32, ptr %13, i32 %14
  br i1 %10, label %bb7, label %bb6

bb6:
  br label %bb8

bb7:
  br label %bb8

bb8:
  %17 = phi i32 [ 2, %bb6 ], [ 1, %bb7 ]
  %18 = add i32 %15, %17
  store i32 %18, ptr %16
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


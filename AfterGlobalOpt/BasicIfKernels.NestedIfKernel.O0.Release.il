; stage: AfterGlobalOpt  opt: O0
; module: NestedIfKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @NestedIfKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = icmp sle i32 %p2, 10
  %2 = icmp sle i32 %p2, 20
  br i1 %1, label %bb4, label %bb1

bb1:
  br i1 %2, label %bb3, label %bb2

bb2:
  %3 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %4 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %5 = getelementptr i32, ptr %3, i32 %4
  store i32 3, ptr %5
  br label %bb5

bb3:
  %6 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %7 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %8 = getelementptr i32, ptr %6, i32 %7
  store i32 2, ptr %8
  br label %bb5

bb4:
  %9 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %10 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %11 = getelementptr i32, ptr %9, i32 %10
  store i32 1, ptr %11
  br label %bb5

bb5:
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


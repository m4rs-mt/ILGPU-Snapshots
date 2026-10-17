; stage: AfterGlobalOpt  opt: O0
; module: LoopWithContinueKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @LoopWithContinueKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %1 = phi i32 [ 0, %bb1 ], [ %3, %bb7 ]
  %2 = phi i32 [ 0, %bb1 ], [ %11, %bb7 ]
  %3 = add i32 %1, 1
  %4 = icmp slt i32 %1, 10
  %5 = srem i32 %1, 2
  %6 = icmp ne i32 %5, 0
  %7 = add i32 %2, %1
  br i1 %4, label %bb4, label %bb3

bb3:
  %8 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %9 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %10 = getelementptr i32, ptr %8, i32 %9
  store i32 %2, ptr %10
  ret void

bb4:
  br i1 %6, label %bb6, label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %11 = phi i32 [ %2, %bb5 ], [ %7, %bb6 ]
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


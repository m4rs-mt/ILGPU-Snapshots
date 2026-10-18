; stage: AfterGlobalOpt  opt: O0
; module: TwoClosuresCrossBlockKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i32 }

@g0 = internal global %struct.1 zeroinitializer ; local

define void @TwoClosuresCrossBlockKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = call ptr<%struct.1> addrspace(local) @ilgpu.gc_init(@g0)
  %2 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 0
  store i32 %p2, ptr %2
  %3 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 1
  store i32 %p3, ptr %3
  %4 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %5 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %6 = icmp sgt i32 %p0, 0
  %7 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 0
  %8 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 0
  %9 = icmp sgt i32 %p0, 0
  %10 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 1
  %11 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 1
  %12 = getelementptr i32, ptr %4, i32 %5
  br i1 %6, label %bb2, label %bb1

bb1:
  %13 = load i32, ptr %7
  br label %bb3

bb2:
  br label %bb3

bb3:
  %14 = phi i32 [ %13, %bb1 ], [ %p0, %bb2 ]
  %15 = load i32, ptr %8
  %16 = add i32 %14, %15
  br i1 %9, label %bb5, label %bb4

bb4:
  %17 = load i32, ptr %10
  br label %bb6

bb5:
  br label %bb6

bb6:
  %18 = phi i32 [ %17, %bb4 ], [ %p0, %bb5 ]
  %19 = load i32, ptr %11
  %20 = mul i32 %18, %19
  %21 = add i32 %16, %20
  store i32 %21, ptr %12
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


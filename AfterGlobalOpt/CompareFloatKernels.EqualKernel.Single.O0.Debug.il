; stage: AfterGlobalOpt  opt: O0
; module: EqualKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%view.float = view float
%struct.1 = type { %view.float, i64, i8 }

define void @EqualKernel(i32 %p0, %struct.1 %p1, %struct.1 %p2, %struct.0 %p3) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 %p2, ptr %1
  %2 = alloca %struct.0, i32 1
  store %struct.0 %p3, ptr %2
  %3 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %2)
  %4 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %2, i32 %p0)
  %5 = call %view.float @get_BaseView(ptr<%struct.1> addrspace(local) %0)
  %6 = call i32 @ComputeLinearIndex(ptr<%struct.1> addrspace(local) %0, i32 %p0)
  %7 = getelementptr float, ptr %5, i32 %6
  %8 = load float, ptr %7
  %9 = call %view.float @get_BaseView(ptr<%struct.1> addrspace(local) %1)
  %10 = call i32 @ComputeLinearIndex(ptr<%struct.1> addrspace(local) %1, i32 %p0)
  %11 = getelementptr float, ptr %9, i32 %10
  %12 = load float, ptr %11
  %13 = fcmp oeq float %8, %12
  %14 = getelementptr i32, ptr %3, i32 %4
  br i1 %13, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %15 = phi i32 [ 0, %bb1 ], [ 1, %bb2 ]
  store i32 %15, ptr %14
  ret void

}

define i32 @ComputeLinearIndex(ptr<%struct.1> addrspace(local) %p0, i32 %p1) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = call i64 @get_Extent(ptr<%struct.1> addrspace(local) %p0)
  store i64 %3, ptr %2
  %4 = call i32 @ToIntIndex(ptr<i64> addrspace(local) %2)
  %5 = call i32 @ComputeElementIndexChecked(i8 %1, i32 %p1, i32 %4)
  ret i32 %5

}

define i64 @get_Extent(ptr<%struct.1> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.float @get_BaseView(ptr<%struct.1> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 0
  %1 = load %view.float, ptr %0
  ret %view.float %1

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


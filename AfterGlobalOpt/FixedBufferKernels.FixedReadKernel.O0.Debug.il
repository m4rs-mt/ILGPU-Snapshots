; stage: AfterGlobalOpt  opt: O0
; module: FixedReadKernel  [intptr: i64]

%struct.0 = type { i32 }
%view.struct = view %struct.0
%struct.1 = type { %view.struct, i64, i8 }
%view.i32 = view i32
%struct.2 = type { %view.i32, i64, i8 }

define void @FixedReadKernel(i32 %p0, %struct.1 %p1, %struct.2 %p2) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = alloca %struct.2, i32 1
  store %struct.2 %p2, ptr %1
  %2 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %2
  %3 = call %view.struct @get_BaseView(ptr<%struct.1> addrspace(local) %0)
  %4 = call i32 @ComputeLinearIndex(ptr<%struct.1> addrspace(local) %0, i32 %p0)
  %5 = getelementptr %struct.0, ptr %3, i32 %4
  %6 = load %struct.0, ptr %5
  store %struct.0 %6, ptr %2
  %7 = call %view.i32 @get_BaseView(ptr<%struct.2> addrspace(local) %1)
  %8 = call i32 @ComputeLinearIndex(ptr<%struct.2> addrspace(local) %1, i32 %p0)
  %9 = getelementptr inbounds %struct.0, ptr %2, i32 0, i32 0
  %10 = load i32, ptr %9
  %11 = getelementptr inbounds %struct.0, ptr %2, i32 0, i32 0
  %12 = getelementptr i32, ptr %11, i32 1
  %13 = load i32, ptr %12
  %14 = getelementptr inbounds %struct.0, ptr %2, i32 0, i32 0
  %15 = getelementptr i32, ptr %14, i32 2
  %16 = load i32, ptr %15
  %17 = getelementptr inbounds %struct.0, ptr %2, i32 0, i32 0
  %18 = getelementptr i32, ptr %17, i32 3
  %19 = load i32, ptr %18
  %20 = getelementptr i32, ptr %7, i32 %8
  %21 = add i32 %10, %13
  %22 = add i32 %21, %16
  %23 = add i32 %22, %19
  store i32 %23, ptr %20
  ret void

}

define i32 @ComputeLinearIndex(ptr<%struct.2> addrspace(local) %p0, i32 %p1) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = call i64 @get_Extent(ptr<%struct.2> addrspace(local) %p0)
  store i64 %3, ptr %2
  %4 = call i32 @ToIntIndex(ptr<i64> addrspace(local) %2)
  %5 = call i32 @ComputeElementIndexChecked(i8 %1, i32 %p1, i32 %4)
  ret i32 %5

}

define i64 @get_Extent(ptr<%struct.2> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.i32 @get_BaseView(ptr<%struct.2> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 0
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

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

define i64 @get_Extent(ptr<%struct.1> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.struct @get_BaseView(ptr<%struct.1> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 0
  %1 = load %view.struct, ptr %0
  ret %view.struct %1

}


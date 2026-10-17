; stage: AfterGlobalOpt  opt: O0
; module: LengthKernel  [intptr: i64]

%view.i64 = view i64
%struct.0 = type { %view.i64, i64, i8 }
%struct.1 = type { view<i32>, i64, i8 }

define void @LengthKernel(i32 %p0, %struct.1 %p1, %struct.0 %p2) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = alloca %struct.0, i32 1
  store %struct.0 %p2, ptr %1
  %2 = call %view.i64 @get_BaseView(ptr<%struct.0> addrspace(local) %1)
  %3 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %1, i32 %p0)
  %4 = alloca i8, i32 1
  store i8 0, ptr %4
  %5 = call i8 @get_Stride(ptr<%struct.1> addrspace(local) %0)
  store i8 %5, ptr %4
  %6 = call i64 @get_Extent(ptr<%struct.1> addrspace(local) %0)
  %7 = addrspacecast ptr %4 to ptr<i8>
  %8 = call i64 @ComputeBufferLength(ptr<i8> %7, i64 %6)
  %9 = getelementptr i64, ptr %2, i32 %3
  store i64 %8, ptr %9
  ret void

}

define i64 @ComputeBufferLength(ptr<i8> %p0, i64 %p1) {
entry:
  %0 = alloca i64, i32 1
  store i64 %p1, ptr %0
  %1 = call i64 @get_X(ptr<i64> addrspace(local) %0)
  ret i64 %1

}

define i64 @get_X(ptr<i64> addrspace(local) %p0) {
entry:
  %0 = load i64, ptr %p0
  ret i64 %0

}

define i64 @get_Extent(ptr<%struct.1> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define i8 @get_Stride(ptr<%struct.1> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  ret i8 %1

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

define %view.i64 @get_BaseView(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = load %view.i64, ptr %0
  ret %view.i64 %1

}


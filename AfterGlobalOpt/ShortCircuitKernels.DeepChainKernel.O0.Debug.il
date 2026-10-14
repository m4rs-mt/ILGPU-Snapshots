; stage: AfterGlobalOpt  opt: O0
; module: DeepChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DeepChainKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = and i32 %p2, 1
  %2 = icmp eq i32 %1, 0
  %3 = and i32 %p2, 2
  %4 = icmp eq i32 %3, 0
  %5 = and i32 %p2, 4
  %6 = icmp eq i32 %5, 0
  %7 = and i32 %p2, 8
  %8 = icmp eq i32 %7, 0
  %9 = and i32 %p2, 16
  %10 = icmp eq i32 %9, 0
  %11 = and i32 %p2, 32
  %12 = icmp eq i32 %11, 0
  %13 = and i32 %p2, 64
  %14 = icmp eq i32 %13, 0
  %15 = and i32 %p2, 128
  %16 = icmp eq i32 %15, 0
  %17 = and i32 %p2, 256
  %18 = icmp eq i32 %17, 0
  %19 = and i32 %p2, 512
  %20 = icmp ugt i32 %19, 0
  br i1 %2, label %bb10, label %bb1

bb1:
  br i1 %4, label %bb10, label %bb2

bb2:
  br i1 %6, label %bb10, label %bb3

bb3:
  br i1 %8, label %bb10, label %bb4

bb4:
  br i1 %10, label %bb10, label %bb5

bb5:
  br i1 %12, label %bb10, label %bb6

bb6:
  br i1 %14, label %bb10, label %bb7

bb7:
  br i1 %16, label %bb10, label %bb8

bb8:
  br i1 %18, label %bb10, label %bb9

bb9:
  br label %bb11

bb10:
  br label %bb11

bb11:
  %21 = phi i1 [ %20, %bb9 ], [ false, %bb10 ]
  %22 = xor i1 %21, -1
  br i1 %22, label %bb13, label %bb12

bb12:
  %23 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %24 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %25 = getelementptr i32, ptr %23, i32 %24
  store i32 1, ptr %25
  br label %bb14

bb13:
  %26 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %27 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %28 = getelementptr i32, ptr %26, i32 %27
  store i32 0, ptr %28
  br label %bb14

bb14:
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
  %0 = icmp sge i32 %p1, 0
  %1 = icmp slt i32 %p1, %p2
  %2 = and i1 %0, %1
  %3 = icmp eq i32 %p1, 0
  %4 = icmp eq i32 %p2, 0
  %5 = and i1 %3, %4
  %6 = or i1 %2, %5
  %7 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  %8 = alloca i8, i32 1
  store i8 %p0, ptr %8
  %9 = alloca i32, i32 1
  store i32 %p1, ptr %9
  %10 = call i32 @get_X(ptr<i32> addrspace(local) %9)
  %11 = addrspacecast ptr %8 to ptr<i8>
  %12 = call i32 @get_XStride(ptr<i8> %11)
  %13 = mul i32 %10, %12
  ret i32 %13

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


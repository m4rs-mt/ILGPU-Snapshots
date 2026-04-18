; stage: AfterGlobalOpt  opt: O0
; module: DeepPhiKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { view<i32>, i64, i8 }

define void @DeepPhiKernel(i32 %p0, %struct.1 %p1, i32 %p2) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = icmp sle i32 %p2, 100
  %2 = icmp sle i32 %p2, 200
  %3 = icmp sle i32 %p2, 300
  br i1 %1, label %bb8, label %bb1

bb1:
  br i1 %2, label %bb6, label %bb2

bb2:
  br i1 %3, label %bb4, label %bb3

bb3:
  br label %bb5

bb4:
  br label %bb5

bb5:
  %4 = phi i32 [ 4, %bb3 ], [ 3, %bb4 ]
  br label %bb7

bb6:
  br label %bb7

bb7:
  %5 = phi i32 [ %4, %bb5 ], [ 2, %bb6 ]
  br label %bb9

bb8:
  br label %bb9

bb9:
  %6 = phi ptr<%struct.0> addrspace(local)
  %7 = phi i32 [ %p0, %bb7 ], [ %p0, %bb8 ]
  %8 = phi i32 [ %5, %bb7 ], [ 1, %bb8 ]
  %9 = addrspacecast ptr %6 to ptr<%struct.0>
  %10 = call %view.i32 @get_BaseView(ptr<%struct.0> %9)
  %11 = call i32 @ComputeLinearIndex(ptr<%struct.0> %9, i32 %7)
  %12 = getelementptr i32, ptr %10, i32 %11
  store i32 %8, ptr %12
  ret void

}

define i32 @ComputeLinearIndex(ptr<%struct.0> %p0, i32 %p1) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = call i64 @get_Extent(ptr<%struct.0> %p0)
  store i64 %3, ptr %2
  %4 = addrspacecast ptr %2 to ptr<i64>
  %5 = call i32 @ToIntIndex(ptr<i64> %4)
  %6 = call i32 @ComputeElementIndexChecked(i8 %1, i32 %p1, i32 %5)
  ret i32 %6

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
  %10 = addrspacecast ptr %9 to ptr<i32>
  %11 = call i32 @get_X(ptr<i32> %10)
  %12 = addrspacecast ptr %8 to ptr<i8>
  %13 = call i32 @get_XStride(ptr<i8> %12)
  %14 = mul i32 %11, %13
  ret i32 %14

}

define i32 @get_XStride(ptr<i8> %p0) {
entry:
  ret i32 1

}

define i32 @get_X(ptr<i32> %p0) {
entry:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define i32 @ToIntIndex(ptr<i64> %p0) {
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

define i64 @get_Extent(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.i32 @get_BaseView(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

}


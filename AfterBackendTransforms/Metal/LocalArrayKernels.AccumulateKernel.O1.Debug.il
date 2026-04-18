; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: AccumulateKernel  [intptr: i64]

@g0 = internal global i32 zeroinitializer ; local

define void @AccumulateKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = getelementptr i32, ptr @g0, i32 1
  %1 = getelementptr i32, ptr @g0, i32 2
  %2 = icmp sge i64 %p3, -2147483648
  %3 = icmp sle i64 %p3, 2147483647
  %4 = and i1 %2, %3
  %5 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %6 = icmp sge i32 %p0, 0
  %7 = trunc i64 %p3 to i32
  %8 = icmp slt i32 %p0, %7
  %9 = and i1 %6, %8
  %10 = icmp eq i32 %p0, 0
  %11 = icmp eq i32 %7, 0
  %12 = and i1 %10, %11
  %13 = or i1 %9, %12
  %14 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %15 = getelementptr i32, ptr %p1, i32 %p0
  br label %bb1

bb1:
  store i32 1, ptr @g0
  store i32 2, ptr %0
  store i32 3, ptr %1
  br label %bb2

bb2:
  %16 = phi i32 [ 0, %bb1 ], [ %18, %bb4 ]
  %17 = phi i32 [ 0, %bb1 ], [ %22, %bb4 ]
  %18 = add i32 %16, 1
  %19 = icmp slt i32 %16, 3
  %20 = getelementptr i32, ptr @g0, i32 %16
  br i1 %19, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  call void @ilgpu.debug.assert(i1 %13, ptr %14)
  store i32 %17, ptr %15
  ret void

bb4:
  %21 = load i32, ptr %20
  %22 = add i32 %17, %21
  br label %bb2

}


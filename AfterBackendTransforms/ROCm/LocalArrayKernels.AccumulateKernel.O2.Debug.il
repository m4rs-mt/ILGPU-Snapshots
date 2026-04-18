; stage: AfterBackendTransforms  backend: ROCm  opt: O2
; module: AccumulateKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @AccumulateKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = getelementptr i32, ptr @g0, i32 1
  %1 = getelementptr i32, ptr @g0, i32 2
  %2 = extractvalue %struct.0 %p1, 2
  %3 = icmp sge i64 %2, -2147483648
  %4 = icmp sle i64 %2, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %2 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %16 = extractvalue %struct.0 %p1, 0
  %17 = getelementptr i32, ptr %16, i32 %p0
  br label %bb1

bb1:
  store i32 1, ptr @g0
  store i32 2, ptr %0
  store i32 3, ptr %1
  br label %bb2

bb2:
  %18 = phi i32 [ 0, %bb1 ], [ %20, %bb4 ]
  %19 = phi i32 [ 0, %bb1 ], [ %24, %bb4 ]
  %20 = add i32 %18, 1
  %21 = icmp slt i32 %18, 3
  %22 = getelementptr i32, ptr @g0, i32 %18
  br i1 %21, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  store i32 %19, ptr %17
  ret void

bb4:
  %23 = load i32, ptr %22
  %24 = add i32 %19, %23
  br label %bb2

}


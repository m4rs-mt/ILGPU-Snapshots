; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: AccumulateKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @AccumulateKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = getelementptr i32, ptr @g0, i32 1
  %1 = getelementptr i32, ptr @g0, i32 2
  %2 = extractvalue %struct.1 %p1, 2
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
  %16 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %17 = extractvalue %struct.0 %16, 0
  %18 = getelementptr i32, ptr %17, i32 %p0
  br label %bb1

bb1:
  store i32 1, ptr @g0
  store i32 2, ptr %0
  store i32 3, ptr %1
  br label %bb2

bb2:
  %19 = phi i32 [ 0, %bb1 ], [ %21, %bb4 ]
  %20 = phi i32 [ 0, %bb1 ], [ %25, %bb4 ]
  %21 = add i32 %19, 1
  %22 = icmp slt i32 %19, 3
  %23 = getelementptr i32, ptr @g0, i32 %19
  br i1 %22, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  store i32 %20, ptr %18
  ret void

bb4:
  %24 = load i32, ptr %23
  %25 = add i32 %20, %24
  br label %bb2

}


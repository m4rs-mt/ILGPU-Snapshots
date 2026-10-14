; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: SharedPointerLoopKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedPointerLoopKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = getelementptr i32, ptr @g0, i32 %0
  %3 = add i32 %0, 1
  %4 = extractvalue %struct.1 %p1, 2
  %5 = icmp sge i64 %4, -2147483648
  %6 = icmp sle i64 %4, 2147483647
  %7 = and i1 %5, %6
  %8 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %9 = icmp sge i32 %p0, 0
  %10 = trunc i64 %4 to i32
  %11 = icmp slt i32 %p0, %10
  %12 = and i1 %9, %11
  %13 = icmp eq i32 %p0, 0
  %14 = icmp eq i32 %10, 0
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %17 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %18 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %19 = extractvalue %struct.0 %18, 0
  %20 = getelementptr i32, ptr %19, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %3, ptr %2
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br label %bb3

bb3:
  %21 = phi i32 [ 0, %bb2 ], [ %24, %bb5 ]
  %22 = phi i32 [ 0, %bb2 ], [ %28, %bb5 ]
  %23 = phi ptr<i32> addrspace(shared) [ @g0, %bb2 ], [ %25, %bb5 ]
  %24 = add i32 %21, 1
  %25 = getelementptr i32, ptr %23, i32 1
  %26 = icmp sle i32 %21, %0
  br i1 %26, label %bb5, label %bb4

bb4:
  call void @ilgpu.debug.assert(i1 %7, ptr %8)
  call void @ilgpu.debug.assert(i1 %16, ptr %17)
  store i32 %22, ptr %20
  ret void

bb5:
  %27 = load i32, ptr %23
  %28 = add i32 %22, %27
  br label %bb3

}


; stage: AfterBackendTransforms  backend: ROCm  opt: O2
; module: SharedPointerLoopKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedPointerLoopKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = getelementptr i32, ptr @g0, i32 %0
  %3 = add i32 %0, 1
  %4 = extractvalue %struct.0 %p1, 2
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
  %18 = extractvalue %struct.0 %p1, 0
  %19 = getelementptr i32, ptr %18, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %3, ptr %2
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br label %bb3

bb3:
  %20 = phi i32 [ 0, %bb2 ], [ %23, %bb5 ]
  %21 = phi i32 [ 0, %bb2 ], [ %27, %bb5 ]
  %22 = phi ptr<i32> addrspace(shared) [ @g0, %bb2 ], [ %24, %bb5 ]
  %23 = add i32 %20, 1
  %24 = getelementptr i32, ptr %22, i32 1
  %25 = icmp sle i32 %20, %0
  br i1 %25, label %bb5, label %bb4

bb4:
  call void @ilgpu.debug.assert(i1 %7, ptr %8)
  call void @ilgpu.debug.assert(i1 %16, ptr %17)
  store i32 %21, ptr %19
  ret void

bb5:
  %26 = load i32, ptr %22
  %27 = add i32 %21, %26
  br label %bb3

}


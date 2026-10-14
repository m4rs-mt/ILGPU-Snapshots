; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: SharedPointerLoopKernel  [intptr: i64]

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedPointerLoopKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = getelementptr i32, ptr @g0, i32 %0
  %3 = add i32 %0, 1
  %4 = icmp sge i64 %p3, -2147483648
  %5 = icmp sle i64 %p3, 2147483647
  %6 = and i1 %4, %5
  %7 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %8 = icmp sge i32 %p0, 0
  %9 = trunc i64 %p3 to i32
  %10 = icmp slt i32 %p0, %9
  %11 = and i1 %8, %10
  %12 = icmp eq i32 %p0, 0
  %13 = icmp eq i32 %9, 0
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %16 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %17 = getelementptr i32, ptr %p1, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %3, ptr %2
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br label %bb3

bb3:
  %18 = phi i32 [ 0, %bb2 ], [ %21, %bb5 ]
  %19 = phi i32 [ 0, %bb2 ], [ %25, %bb5 ]
  %20 = phi ptr<i32> addrspace(shared) [ @g0, %bb2 ], [ %22, %bb5 ]
  %21 = add i32 %18, 1
  %22 = getelementptr i32, ptr %20, i32 1
  %23 = icmp sle i32 %18, %0
  br i1 %23, label %bb5, label %bb4

bb4:
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  store i32 %19, ptr %17
  ret void

bb5:
  %24 = load i32, ptr %20
  %25 = add i32 %19, %24
  br label %bb3

}


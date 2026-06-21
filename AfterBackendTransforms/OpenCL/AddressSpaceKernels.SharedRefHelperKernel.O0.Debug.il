; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: SharedRefHelperKernel  [intptr: i64]

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedRefHelperKernel(i32 %p0, ptr<i32> %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = getelementptr i32, ptr @g0, i32 %0
  %3 = mul i32 %p0, 10
  %4 = getelementptr i32, ptr @g0, i32 %0
  %5 = icmp sge i32 %0, 32
  %6 = icmp sge i64 %p3, -2147483648
  %7 = icmp sle i64 %p3, 2147483647
  %8 = and i1 %6, %7
  %9 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %10 = icmp sge i32 %p0, 0
  %11 = trunc i64 %p3 to i32
  %12 = icmp slt i32 %p0, %11
  %13 = and i1 %10, %12
  %14 = icmp eq i32 %p0, 0
  %15 = icmp eq i32 %11, 0
  %16 = and i1 %14, %15
  %17 = or i1 %13, %16
  %18 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %19 = getelementptr i32, ptr @g0, i32 %0
  %20 = getelementptr i32, ptr %p1, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %3, ptr %2
  call void @Increment(ptr<i32> addrspace(shared) %4)
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %5, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %8, ptr %9)
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  %21 = load i32, ptr %19
  store i32 %21, ptr %20
  br label %bb4

bb4:
  ret void

}

define void @Increment(ptr<i32> addrspace(shared) %p0) {
entry:
  %0 = load i32, ptr %p0
  %1 = add i32 %0, 1
  store i32 %1, ptr %p0
  ret void

}


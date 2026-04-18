; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: SharedMemoryVariableKernel  [intptr: i64]

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedMemoryVariableKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = getelementptr i32, ptr @g0, i32 %0
  %3 = shl i32 %0, 1
  %4 = icmp sge i32 %0, 32
  %5 = icmp sge i64 %p3, -2147483648
  %6 = icmp sle i64 %p3, 2147483647
  %7 = and i1 %5, %6
  %8 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %9 = icmp sge i32 %p0, 0
  %10 = trunc i64 %p3 to i32
  %11 = icmp slt i32 %p0, %10
  %12 = and i1 %9, %11
  %13 = icmp eq i32 %p0, 0
  %14 = icmp eq i32 %10, 0
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %17 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %18 = getelementptr i32, ptr @g0, i32 %0
  %19 = getelementptr i32, ptr %p1, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %3, ptr %2
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %4, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %7, ptr %8)
  call void @ilgpu.debug.assert(i1 %16, ptr %17)
  %20 = load i32, ptr %18
  store i32 %20, ptr %19
  br label %bb4

bb4:
  ret void

}


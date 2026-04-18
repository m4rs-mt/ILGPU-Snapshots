; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: WriteReadKernel  [intptr: i64]

@g0 = internal global i32 zeroinitializer ; local

define void @WriteReadKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  store i32 10, ptr @g0
  %0 = getelementptr i32, ptr @g0, i32 1
  store i32 20, ptr %0
  %1 = getelementptr i32, ptr @g0, i32 2
  store i32 30, ptr %1
  %2 = getelementptr i32, ptr @g0, i32 3
  store i32 40, ptr %2
  %3 = icmp sge i64 %p3, -2147483648
  %4 = icmp sle i64 %p3, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %p3 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  %16 = getelementptr i32, ptr @g0, i32 %p0
  %17 = load i32, ptr %16
  %18 = getelementptr i32, ptr %p1, i32 %p0
  store i32 %17, ptr %18
  ret void

}


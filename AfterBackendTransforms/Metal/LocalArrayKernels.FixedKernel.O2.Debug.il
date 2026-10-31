; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: FixedKernel  [intptr: i64]

@g0 = internal global i32 zeroinitializer ; local

define void @FixedKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = and i32 %p0, 3
  %1 = getelementptr i32, ptr @g0, i32 %0
  %2 = mul i32 %p0, 10
  store i32 %2, ptr %1
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
  %16 = and i32 %p0, 3
  %17 = getelementptr i32, ptr @g0, i32 %16
  %18 = load i32, ptr %17
  %19 = getelementptr i32, ptr %p1, i32 %p0
  store i32 %18, ptr %19
  ret void

}


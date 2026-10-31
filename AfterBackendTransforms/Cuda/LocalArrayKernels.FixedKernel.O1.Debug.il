; stage: AfterBackendTransforms  backend: Cuda  opt: O1
; module: FixedKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @FixedKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = and i32 %p0, 3
  %1 = getelementptr i32, ptr @g0, i32 %0
  %2 = mul i32 %p0, 10
  store i32 %2, ptr %1
  %3 = extractvalue %struct.0 %p1, 2
  %4 = icmp sge i64 %3, -2147483648
  %5 = icmp sle i64 %3, 2147483647
  %6 = and i1 %4, %5
  %7 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  %8 = icmp sge i32 %p0, 0
  %9 = trunc i64 %3 to i32
  %10 = icmp slt i32 %p0, %9
  %11 = and i1 %8, %10
  %12 = icmp eq i32 %p0, 0
  %13 = icmp eq i32 %9, 0
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %16 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  %17 = and i32 %p0, 3
  %18 = getelementptr i32, ptr @g0, i32 %17
  %19 = load i32, ptr %18
  %20 = extractvalue %struct.0 %p1, 0
  %21 = getelementptr i32, ptr %20, i32 %p0
  store i32 %19, ptr %21
  ret void

}


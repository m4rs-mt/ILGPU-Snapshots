; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: FixedKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @FixedKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = addrspacecast ptr @g0 to ptr<i32>
  %1 = and i32 %p0, 3
  %2 = getelementptr i32, ptr %0, i32 %1
  %3 = mul i32 %p0, 10
  store i32 %3, ptr %2
  %4 = extractvalue %struct.1 %p1, 2
  %5 = icmp sge i64 %4, -2147483648
  %6 = icmp sle i64 %4, 2147483647
  %7 = and i1 %5, %6
  %8 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %7, ptr %8)
  %9 = icmp sge i32 %p0, 0
  %10 = trunc i64 %4 to i32
  %11 = icmp slt i32 %p0, %10
  %12 = and i1 %9, %11
  %13 = icmp eq i32 %p0, 0
  %14 = icmp eq i32 %10, 0
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %17 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %16, ptr %17)
  %18 = and i32 %p0, 3
  %19 = getelementptr i32, ptr @g0, i32 %18
  %20 = load i32, ptr %19
  %21 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %22 = extractvalue %struct.0 %21, 0
  %23 = getelementptr i32, ptr %22, i32 %p0
  store i32 %20, ptr %23
  ret void

}


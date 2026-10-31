; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: FixedKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @FixedKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 4)
  %1 = getelementptr i32, ptr %0, i32 0
  %2 = addrspacecast ptr %1 to ptr<i32>
  %3 = and i32 %p0, 3
  %4 = getelementptr i32, ptr %2, i32 %3
  %5 = mul i32 %p0, 10
  store i32 %5, ptr %4
  %6 = extractvalue %struct.0 %p1, 1
  %7 = icmp sge i64 %6, -2147483648
  %8 = icmp sle i64 %6, 2147483647
  %9 = and i1 %7, %8
  %10 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %9, ptr %10)
  %11 = icmp sge i32 %p0, 0
  %12 = trunc i64 %6 to i32
  %13 = icmp slt i32 %p0, %12
  %14 = and i1 %11, %13
  %15 = icmp eq i32 %p0, 0
  %16 = icmp eq i32 %12, 0
  %17 = and i1 %15, %16
  %18 = or i1 %14, %17
  %19 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %18, ptr %19)
  %20 = and i32 %p0, 3
  %21 = getelementptr i32, ptr %0, i32 %20
  %22 = load i32, ptr %21
  %23 = extractvalue %struct.0 %p1, 0
  %24 = getelementptr i32, ptr %23, i32 %p0
  store i32 %22, ptr %24
  ret void

}


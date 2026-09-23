; stage: AfterBackendTransforms  backend: CPU  opt: O2
; module: FixedKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @FixedKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 4)
  %1 = getelementptr i32, ptr %0, i32 0
  %2 = and i32 %p0, 3
  %3 = getelementptr i32, ptr %1, i32 %2
  %4 = mul i32 %p0, 10
  store i32 %4, ptr %3
  %5 = extractvalue %struct.0 %p1, 1
  %6 = icmp sge i64 %5, -2147483648
  %7 = icmp sle i64 %5, 2147483647
  %8 = and i1 %6, %7
  %9 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %8, ptr %9)
  %10 = icmp sge i32 %p0, 0
  %11 = trunc i64 %5 to i32
  %12 = icmp slt i32 %p0, %11
  %13 = and i1 %10, %12
  %14 = icmp eq i32 %p0, 0
  %15 = icmp eq i32 %11, 0
  %16 = and i1 %14, %15
  %17 = or i1 %13, %16
  %18 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  %19 = and i32 %p0, 3
  %20 = getelementptr i32, ptr %0, i32 %19
  %21 = load i32, ptr %20
  %22 = extractvalue %struct.0 %p1, 0
  %23 = getelementptr i32, ptr %22, i32 %p0
  store i32 %21, ptr %23
  ret void

}


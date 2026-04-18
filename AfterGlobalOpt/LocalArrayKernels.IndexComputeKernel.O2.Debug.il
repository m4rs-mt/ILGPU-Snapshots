; stage: AfterGlobalOpt  opt: O2
; module: IndexComputeKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @IndexComputeKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 4)
  %1 = getelementptr i32, ptr %0, i32 0
  store i32 100, ptr %1
  %2 = getelementptr i32, ptr %0, i32 1
  store i32 200, ptr %2
  %3 = getelementptr i32, ptr %0, i32 2
  store i32 300, ptr %3
  %4 = getelementptr i32, ptr %0, i32 3
  store i32 400, ptr %4
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
  %19 = getelementptr i32, ptr %0, i32 %p0
  %20 = load i32, ptr %19
  %21 = extractvalue %struct.0 %p1, 0
  %22 = getelementptr i32, ptr %21, i32 %p0
  store i32 %20, ptr %22
  ret void

}


; stage: AfterGlobalOpt  opt: O1
; module: FixedKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @FixedKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 4)
  %1 = call i32 @ilgpu.array.length(array<i32, 1> %0)
  %2 = icmp ne i32 %1, 0
  %3 = getelementptr i32, ptr %0, i32 0
  %4 = select i1 %2, ptr<i32> %3, ptr<i32> null
  %5 = and i32 %p0, 3
  %6 = getelementptr i32, ptr %4, i32 %5
  %7 = mul i32 %p0, 10
  store i32 %7, ptr %6
  %8 = extractvalue %struct.0 %p1, 1
  %9 = icmp sge i64 %8, -2147483648
  %10 = icmp sle i64 %8, 2147483647
  %11 = and i1 %9, %10
  %12 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  %13 = icmp sge i32 %p0, 0
  %14 = trunc i64 %8 to i32
  %15 = icmp slt i32 %p0, %14
  %16 = and i1 %13, %15
  %17 = icmp eq i32 %p0, 0
  %18 = icmp eq i32 %14, 0
  %19 = and i1 %17, %18
  %20 = or i1 %16, %19
  %21 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %20, ptr %21)
  %22 = and i32 %p0, 3
  %23 = getelementptr i32, ptr %0, i32 %22
  %24 = load i32, ptr %23
  %25 = extractvalue %struct.0 %p1, 0
  %26 = getelementptr i32, ptr %25, i32 %p0
  store i32 %24, ptr %26
  ret void

}


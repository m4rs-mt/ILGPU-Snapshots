; stage: AfterGlobalOpt  opt: O1
; module: NullArgumentKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global i32 zeroinitializer ; local

define void @NullArgumentKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 1
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = icmp sge i32 %p0, 0
  %6 = trunc i64 %0 to i32
  %7 = icmp slt i32 %p0, %6
  %8 = and i1 %5, %7
  %9 = icmp eq i32 %p0, 0
  %10 = icmp eq i32 %6, 0
  %11 = and i1 %9, %10
  %12 = or i1 %8, %11
  %13 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  %14 = extractvalue %struct.0 %p1, 0
  %15 = getelementptr i32, ptr %14, i32 %p0
  %16 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %17 = call i32 @ilgpu.array.length(array<i32, 1> %16)
  %18 = mul i32 %17, 10
  %19 = add i32 %18, -100
  %20 = call array<i32, 1> @ilgpu.array.new(ptr @g1, i32 3)
  %21 = call i32 @ilgpu.array.length(array<i32, 1> %20)
  %22 = add i32 %19, %21
  %23 = add i32 %22, 1000
  store i32 %23, ptr %15
  ret void

}


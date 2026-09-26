; stage: AfterGlobalOpt  opt: O2
; module: EmptyArrayKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global i32 zeroinitializer ; local
@g2 = internal global i32 zeroinitializer ; local

define void @EmptyArrayKernel(i32 %p0, %struct.0 %p1) {
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
  %14 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %15 = call i1 @IsEmptyArray(array<i32, 1> %14)
  %16 = call i1 @IsEmptyUIntArray(array<i32, 1> %14)
  %17 = extractvalue %struct.0 %p1, 0
  %18 = getelementptr i32, ptr %17, i32 %p0
  %19 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %20 = call i32 @ilgpu.array.length(array<i32, 1> %19)
  %21 = mul i32 %20, 100000
  %22 = add i32 %21, 11
  %23 = and i32 %p0, 1
  %24 = icmp eq i32 %23, 0
  %25 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %26 = call array<i32, 1> @ilgpu.array.new(ptr @g2, i32 0)
  %27 = select i1 %24, array<i32, 1> %25, array<i32, 1> %26
  %28 = getelementptr i32, ptr %27, i32 0
  %29 = getelementptr i32, ptr %19, i32 0
  %30 = icmp eq ptr<i32> %28, %29
  %31 = select i1 %30, i32 100, i32 0
  %32 = add i32 %22, %31
  %33 = select i1 %15, i32 1000, i32 0
  %34 = add i32 %32, %33
  %35 = select i1 %16, i32 10000000, i32 0
  %36 = add i32 %34, %35
  store i32 %36, ptr %18
  ret void

}

define i1 @IsEmptyUIntArray(array<i32, 1> %p0) {
entry:
  %0 = getelementptr i32, ptr %p0, i32 0
  %1 = call array<i32, 1> @ilgpu.array.new(ptr @g1, i32 0)
  %2 = getelementptr i32, ptr %1, i32 0
  %3 = icmp eq ptr<i32> %0, %2
  ret i1 %3

}

define i1 @IsEmptyArray(array<i32, 1> %p0) {
entry:
  %0 = getelementptr i32, ptr %p0, i32 0
  %1 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %2 = getelementptr i32, ptr %1, i32 0
  %3 = icmp eq ptr<i32> %0, %2
  ret i1 %3

}


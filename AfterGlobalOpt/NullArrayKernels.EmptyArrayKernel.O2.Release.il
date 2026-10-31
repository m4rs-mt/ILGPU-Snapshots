; stage: AfterGlobalOpt  opt: O2
; module: EmptyArrayKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global i32 zeroinitializer ; local
@g2 = internal global i32 zeroinitializer ; local

define void @EmptyArrayKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %1 = call i1 @IsEmptyArray(array<i32, 1> %0)
  %2 = call i1 @IsEmptyUIntArray(array<i32, 1> %0)
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  %5 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %6 = call i32 @ilgpu.array.length(array<i32, 1> %5)
  %7 = mul i32 %6, 100000
  %8 = add i32 %7, 11
  %9 = and i32 %p0, 1
  %10 = icmp eq i32 %9, 0
  %11 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %12 = call array<i32, 1> @ilgpu.array.new(ptr @g2, i32 0)
  %13 = select i1 %10, array<i32, 1> %11, array<i32, 1> %12
  %14 = getelementptr i32, ptr %13, i32 0
  %15 = getelementptr i32, ptr %5, i32 0
  %16 = icmp eq ptr<i32> %14, %15
  %17 = select i1 %16, i32 100, i32 0
  %18 = add i32 %8, %17
  %19 = select i1 %1, i32 1000, i32 0
  %20 = add i32 %18, %19
  %21 = select i1 %2, i32 10000000, i32 0
  %22 = add i32 %20, %21
  store i32 %22, ptr %4
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


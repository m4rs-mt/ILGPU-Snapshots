; stage: AfterGlobalOpt  opt: O2
; module: EmptyNotNullKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @EmptyNotNullKernel(i32 %p0, %struct.0 %p1) {
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
  %16 = icmp sgt i32 %p0, 1
  %17 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %18 = select i1 %16, array<i32, 1> %17, array<i32, 1> null
  %19 = getelementptr i32, ptr %18, i32 0
  %20 = getelementptr i32, ptr null, i32 0
  %21 = icmp eq ptr<i32> %19, %20
  %22 = call i32 @ilgpu.array.length(array<i32, 1> %18)
  %23 = select i1 %21, i32 -1, i32 %22
  store i32 %23, ptr %15
  ret void

}


; stage: AfterGlobalOpt  opt: O2
; module: GroupRadixSortAscendingInt32Kernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @GroupRadixSortAscendingInt32Kernel(i32 %p0, %struct.0 %p1) {
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
  %16 = load i32, ptr %15
  %17 = ; unhandled: GroupRadixSort
  %18 = extractvalue %struct.0 %p1, 1
  %19 = icmp sge i64 %18, -2147483648
  %20 = icmp sle i64 %18, 2147483647
  %21 = and i1 %19, %20
  %22 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %21, ptr %22)
  %23 = icmp sge i32 %p0, 0
  %24 = trunc i64 %18 to i32
  %25 = icmp slt i32 %p0, %24
  %26 = and i1 %23, %25
  %27 = icmp eq i32 %p0, 0
  %28 = icmp eq i32 %24, 0
  %29 = and i1 %27, %28
  %30 = or i1 %26, %29
  %31 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %30, ptr %31)
  %32 = extractvalue %struct.0 %p1, 0
  %33 = getelementptr i32, ptr %32, i32 %p0
  store i32 %17, ptr %33
  ret void

}

define i32 @ExtractRadixBits(i32 %p0, i32 %p1, i32 %p2) {
entry:
  %0 = xor i32 %p0, -2147483648
  %1 = and i32 %p1, 31
  %2 = ashr i32 %0, %1
  %3 = and i32 %2, %p2
  ret i32 %3

}


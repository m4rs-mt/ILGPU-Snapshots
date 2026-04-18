; stage: AfterGlobalOpt  opt: O1
; module: StructPassByValueKernel  [intptr: i64]

%struct.0 = type { i32, i64, i16, i32 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @StructPassByValueKernel(i32 %p0, %struct.1 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.1 %p1, 1
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
  %14 = extractvalue %struct.1 %p1, 0
  %15 = getelementptr i32, ptr %14, i32 %p0
  %16 = extractvalue %struct.0 %p2, 0
  %17 = add i32 %16, 1
  %18 = extractvalue %struct.0 %p2, 1
  %19 = add i64 %18, 10
  %20 = trunc i64 %19 to i32
  %21 = add i32 %17, %20
  %22 = extractvalue %struct.0 %p2, 2
  %23 = sext i16 %22 to i32
  %24 = add i32 %23, 100
  %25 = trunc i32 %24 to i16
  %26 = sext i16 %25 to i32
  %27 = add i32 %21, %26
  %28 = extractvalue %struct.0 %p2, 3
  %29 = add i32 %28, 1000
  %30 = add i32 %27, %29
  store i32 %30, ptr %15
  ret void

}


; stage: AfterGlobalOpt  opt: O2
; module: DiamondFeedChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DiamondFeedChainKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4, i32 %p5) {
entry:
  %0 = icmp sle i32 %p2, 0
  %1 = icmp sgt i32 %p2, 0
  %2 = or i1 %0, %1
  %3 = icmp sgt i32 %p2, 0
  %4 = icmp sgt i32 %p3, 0
  %5 = icmp sgt i32 %p4, 0
  %6 = select i1 %3, i1 %4, i1 %5
  %7 = xor i1 %6, -1
  %8 = and i1 %2, %7
  %9 = icmp sle i32 %p5, 0
  %10 = or i1 %8, %9
  %11 = extractvalue %struct.0 %p1, 1
  %12 = icmp sge i64 %11, -2147483648
  %13 = icmp sle i64 %11, 2147483647
  %14 = and i1 %12, %13
  %15 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %16 = icmp sge i32 %p0, 0
  %17 = trunc i64 %11 to i32
  %18 = icmp slt i32 %p0, %17
  %19 = and i1 %16, %18
  %20 = icmp eq i32 %p0, 0
  %21 = icmp eq i32 %17, 0
  %22 = and i1 %20, %21
  %23 = or i1 %19, %22
  %24 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %25 = extractvalue %struct.0 %p1, 0
  %26 = getelementptr i32, ptr %25, i32 %p0
  %27 = extractvalue %struct.0 %p1, 1
  %28 = icmp sge i64 %27, -2147483648
  %29 = icmp sle i64 %27, 2147483647
  %30 = and i1 %28, %29
  %31 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %32 = icmp sge i32 %p0, 0
  %33 = trunc i64 %27 to i32
  %34 = icmp slt i32 %p0, %33
  %35 = and i1 %32, %34
  %36 = icmp eq i32 %p0, 0
  %37 = icmp eq i32 %33, 0
  %38 = and i1 %36, %37
  %39 = or i1 %35, %38
  %40 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %41 = extractvalue %struct.0 %p1, 0
  %42 = getelementptr i32, ptr %41, i32 %p0
  br i1 %10, label %bb2, label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  call void @ilgpu.debug.assert(i1 %23, ptr %24)
  store i32 1, ptr %26
  br label %bb3

bb2:
  call void @ilgpu.debug.assert(i1 %30, ptr %31)
  call void @ilgpu.debug.assert(i1 %39, ptr %40)
  store i32 0, ptr %42
  br label %bb3

bb3:
  ret void

}


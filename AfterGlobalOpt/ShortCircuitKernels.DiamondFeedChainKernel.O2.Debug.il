; stage: AfterGlobalOpt  opt: O2
; module: DiamondFeedChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DiamondFeedChainKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4, i32 %p5) {
entry:
  %0 = icmp sgt i32 %p2, 0
  %1 = icmp sgt i32 %p3, 0
  %2 = icmp sgt i32 %p4, 0
  %3 = select i1 %0, i1 %1, i1 %2
  %4 = xor i1 %3, -1
  %5 = icmp sle i32 %p5, 0
  %6 = or i1 %4, %5
  %7 = extractvalue %struct.0 %p1, 1
  %8 = icmp sge i64 %7, -2147483648
  %9 = icmp sle i64 %7, 2147483647
  %10 = and i1 %8, %9
  %11 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %12 = icmp sge i32 %p0, 0
  %13 = trunc i64 %7 to i32
  %14 = icmp slt i32 %p0, %13
  %15 = and i1 %12, %14
  %16 = icmp eq i32 %p0, 0
  %17 = icmp eq i32 %13, 0
  %18 = and i1 %16, %17
  %19 = or i1 %15, %18
  %20 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %21 = extractvalue %struct.0 %p1, 0
  %22 = getelementptr i32, ptr %21, i32 %p0
  %23 = extractvalue %struct.0 %p1, 1
  %24 = icmp sge i64 %23, -2147483648
  %25 = icmp sle i64 %23, 2147483647
  %26 = and i1 %24, %25
  %27 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %28 = icmp sge i32 %p0, 0
  %29 = trunc i64 %23 to i32
  %30 = icmp slt i32 %p0, %29
  %31 = and i1 %28, %30
  %32 = icmp eq i32 %p0, 0
  %33 = icmp eq i32 %29, 0
  %34 = and i1 %32, %33
  %35 = or i1 %31, %34
  %36 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %37 = extractvalue %struct.0 %p1, 0
  %38 = getelementptr i32, ptr %37, i32 %p0
  br i1 %6, label %bb2, label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %10, ptr %11)
  call void @ilgpu.debug.assert(i1 %19, ptr %20)
  store i32 1, ptr %22
  br label %bb3

bb2:
  call void @ilgpu.debug.assert(i1 %26, ptr %27)
  call void @ilgpu.debug.assert(i1 %35, ptr %36)
  store i32 0, ptr %38
  br label %bb3

bb3:
  ret void

}


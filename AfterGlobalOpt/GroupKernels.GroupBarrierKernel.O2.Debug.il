; stage: AfterGlobalOpt  opt: O2
; module: GroupBarrierKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @GroupBarrierKernel(i32 %p0, %struct.0 %p1) {
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
  store i32 %p0, ptr %15
  call void @ilgpu.barrier.group()
  %16 = extractvalue %struct.0 %p1, 1
  %17 = icmp sge i64 %16, -2147483648
  %18 = icmp sle i64 %16, 2147483647
  %19 = and i1 %17, %18
  %20 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %19, ptr %20)
  %21 = icmp sge i32 %p0, 0
  %22 = trunc i64 %16 to i32
  %23 = icmp slt i32 %p0, %22
  %24 = and i1 %21, %23
  %25 = icmp eq i32 %p0, 0
  %26 = icmp eq i32 %22, 0
  %27 = and i1 %25, %26
  %28 = or i1 %24, %27
  %29 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %28, ptr %29)
  %30 = extractvalue %struct.0 %p1, 1
  %31 = icmp sge i64 %30, -2147483648
  %32 = icmp sle i64 %30, 2147483647
  %33 = and i1 %31, %32
  %34 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %33, ptr %34)
  %35 = icmp sge i32 %p0, 0
  %36 = trunc i64 %30 to i32
  %37 = icmp slt i32 %p0, %36
  %38 = and i1 %35, %37
  %39 = icmp eq i32 %p0, 0
  %40 = icmp eq i32 %36, 0
  %41 = and i1 %39, %40
  %42 = or i1 %38, %41
  %43 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %42, ptr %43)
  %44 = extractvalue %struct.0 %p1, 0
  %45 = getelementptr i32, ptr %44, i32 %p0
  %46 = load i32, ptr %45
  %47 = extractvalue %struct.0 %p1, 0
  %48 = getelementptr i32, ptr %47, i32 %p0
  %49 = add i32 %46, 1
  store i32 %49, ptr %48
  ret void

}


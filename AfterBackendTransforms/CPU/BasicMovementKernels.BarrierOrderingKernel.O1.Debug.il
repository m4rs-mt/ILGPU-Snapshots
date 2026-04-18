; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: BarrierOrderingKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @BarrierOrderingKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2) {
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
  %16 = shl i32 %p0, 1
  store i32 %16, ptr %15
  call void @ilgpu.barrier.group()
  %17 = extractvalue %struct.0 %p2, 1
  %18 = icmp sge i64 %17, -2147483648
  %19 = icmp sle i64 %17, 2147483647
  %20 = and i1 %18, %19
  %21 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %20, ptr %21)
  %22 = icmp sge i32 %p0, 0
  %23 = trunc i64 %17 to i32
  %24 = icmp slt i32 %p0, %23
  %25 = and i1 %22, %24
  %26 = icmp eq i32 %p0, 0
  %27 = icmp eq i32 %23, 0
  %28 = and i1 %26, %27
  %29 = or i1 %25, %28
  %30 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %29, ptr %30)
  %31 = extractvalue %struct.0 %p1, 1
  %32 = icmp sge i64 %31, -2147483648
  %33 = icmp sle i64 %31, 2147483647
  %34 = and i1 %32, %33
  %35 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %34, ptr %35)
  %36 = icmp sge i32 %p0, 0
  %37 = trunc i64 %31 to i32
  %38 = icmp slt i32 %p0, %37
  %39 = and i1 %36, %38
  %40 = icmp eq i32 %p0, 0
  %41 = icmp eq i32 %37, 0
  %42 = and i1 %40, %41
  %43 = or i1 %39, %42
  %44 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %43, ptr %44)
  %45 = extractvalue %struct.0 %p1, 0
  %46 = getelementptr i32, ptr %45, i32 %p0
  %47 = load i32, ptr %46
  %48 = extractvalue %struct.0 %p2, 0
  %49 = getelementptr i32, ptr %48, i32 %p0
  %50 = add i32 %47, 1
  store i32 %50, ptr %49
  ret void

}


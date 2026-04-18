; stage: AfterGlobalOpt  opt: O1
; module: SwitchStoreKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @SwitchStoreKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 1
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %5 = icmp sge i32 %p0, 0
  %6 = trunc i64 %0 to i32
  %7 = icmp slt i32 %p0, %6
  %8 = and i1 %5, %7
  %9 = icmp eq i32 %p0, 0
  %10 = icmp eq i32 %6, 0
  %11 = and i1 %9, %10
  %12 = or i1 %8, %11
  %13 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %14 = extractvalue %struct.0 %p1, 0
  %15 = getelementptr i32, ptr %14, i32 %p0
  %16 = mul i32 %p0, %p0
  %17 = extractvalue %struct.0 %p1, 1
  %18 = icmp sge i64 %17, -2147483648
  %19 = icmp sle i64 %17, 2147483647
  %20 = and i1 %18, %19
  %21 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %22 = icmp sge i32 %p0, 0
  %23 = trunc i64 %17 to i32
  %24 = icmp slt i32 %p0, %23
  %25 = and i1 %22, %24
  %26 = icmp eq i32 %p0, 0
  %27 = icmp eq i32 %23, 0
  %28 = and i1 %26, %27
  %29 = or i1 %25, %28
  %30 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %31 = extractvalue %struct.0 %p1, 0
  %32 = getelementptr i32, ptr %31, i32 %p0
  %33 = add i32 %p0, 100
  %34 = extractvalue %struct.0 %p1, 1
  %35 = icmp sge i64 %34, -2147483648
  %36 = icmp sle i64 %34, 2147483647
  %37 = and i1 %35, %36
  %38 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %39 = icmp sge i32 %p0, 0
  %40 = trunc i64 %34 to i32
  %41 = icmp slt i32 %p0, %40
  %42 = and i1 %39, %41
  %43 = icmp eq i32 %p0, 0
  %44 = icmp eq i32 %40, 0
  %45 = and i1 %43, %44
  %46 = or i1 %42, %45
  %47 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %48 = extractvalue %struct.0 %p1, 0
  %49 = getelementptr i32, ptr %48, i32 %p0
  %50 = shl i32 %p0, 1
  %51 = extractvalue %struct.0 %p1, 1
  %52 = icmp sge i64 %51, -2147483648
  %53 = icmp sle i64 %51, 2147483647
  %54 = and i1 %52, %53
  %55 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %56 = icmp sge i32 %p0, 0
  %57 = trunc i64 %51 to i32
  %58 = icmp slt i32 %p0, %57
  %59 = and i1 %56, %58
  %60 = icmp eq i32 %p0, 0
  %61 = icmp eq i32 %57, 0
  %62 = and i1 %60, %61
  %63 = or i1 %59, %62
  %64 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %65 = extractvalue %struct.0 %p1, 0
  %66 = getelementptr i32, ptr %65, i32 %p0
  switch i32 %p2, label %bb4 [
    i32 0, label %bb3
    i32 1, label %bb2
    i32 2, label %bb1
  ]

bb1:
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  store i32 %16, ptr %15
  br label %bb5

bb2:
  call void @ilgpu.debug.assert(i1 %20, ptr %21)
  call void @ilgpu.debug.assert(i1 %29, ptr %30)
  store i32 %33, ptr %32
  br label %bb5

bb3:
  call void @ilgpu.debug.assert(i1 %37, ptr %38)
  call void @ilgpu.debug.assert(i1 %46, ptr %47)
  store i32 %50, ptr %49
  br label %bb5

bb4:
  call void @ilgpu.debug.assert(i1 %54, ptr %55)
  call void @ilgpu.debug.assert(i1 %63, ptr %64)
  store i32 0, ptr %66
  br label %bb5

bb5:
  ret void

}


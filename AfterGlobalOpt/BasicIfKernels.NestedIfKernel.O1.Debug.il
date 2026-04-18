; stage: AfterGlobalOpt  opt: O1
; module: NestedIfKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @NestedIfKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = icmp sle i32 %p2, 10
  %1 = icmp sle i32 %p2, 20
  %2 = extractvalue %struct.0 %p1, 1
  %3 = icmp sge i64 %2, -2147483648
  %4 = icmp sle i64 %2, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %2 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %16 = extractvalue %struct.0 %p1, 0
  %17 = getelementptr i32, ptr %16, i32 %p0
  %18 = extractvalue %struct.0 %p1, 1
  %19 = icmp sge i64 %18, -2147483648
  %20 = icmp sle i64 %18, 2147483647
  %21 = and i1 %19, %20
  %22 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %23 = icmp sge i32 %p0, 0
  %24 = trunc i64 %18 to i32
  %25 = icmp slt i32 %p0, %24
  %26 = and i1 %23, %25
  %27 = icmp eq i32 %p0, 0
  %28 = icmp eq i32 %24, 0
  %29 = and i1 %27, %28
  %30 = or i1 %26, %29
  %31 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %32 = extractvalue %struct.0 %p1, 0
  %33 = getelementptr i32, ptr %32, i32 %p0
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
  br i1 %0, label %bb5, label %bb1

bb1:
  br i1 %1, label %bb3, label %bb2

bb2:
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  store i32 3, ptr %17
  br label %bb4

bb3:
  call void @ilgpu.debug.assert(i1 %21, ptr %22)
  call void @ilgpu.debug.assert(i1 %30, ptr %31)
  store i32 2, ptr %33
  br label %bb4

bb4:
  br label %bb6

bb5:
  call void @ilgpu.debug.assert(i1 %37, ptr %38)
  call void @ilgpu.debug.assert(i1 %46, ptr %47)
  store i32 1, ptr %49
  br label %bb6

bb6:
  ret void

}


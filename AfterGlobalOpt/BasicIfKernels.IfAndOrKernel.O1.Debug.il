; stage: AfterGlobalOpt  opt: O1
; module: IfAndOrKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @IfAndOrKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp sgt i32 %p2, 0
  %1 = icmp sgt i32 %p3, 0
  %2 = and i1 %0, %1
  %3 = icmp sle i32 %p2, 0
  %4 = icmp sle i32 %p3, 0
  %5 = and i1 %3, %4
  %6 = extractvalue %struct.0 %p1, 1
  %7 = icmp sge i64 %6, -2147483648
  %8 = icmp sle i64 %6, 2147483647
  %9 = and i1 %7, %8
  %10 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %11 = icmp sge i32 %p0, 0
  %12 = trunc i64 %6 to i32
  %13 = icmp slt i32 %p0, %12
  %14 = and i1 %11, %13
  %15 = icmp eq i32 %p0, 0
  %16 = icmp eq i32 %12, 0
  %17 = and i1 %15, %16
  %18 = or i1 %14, %17
  %19 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %20 = extractvalue %struct.0 %p1, 0
  %21 = getelementptr i32, ptr %20, i32 %p0
  %22 = extractvalue %struct.0 %p1, 1
  %23 = icmp sge i64 %22, -2147483648
  %24 = icmp sle i64 %22, 2147483647
  %25 = and i1 %23, %24
  %26 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %27 = icmp sge i32 %p0, 0
  %28 = trunc i64 %22 to i32
  %29 = icmp slt i32 %p0, %28
  %30 = and i1 %27, %29
  %31 = icmp eq i32 %p0, 0
  %32 = icmp eq i32 %28, 0
  %33 = and i1 %31, %32
  %34 = or i1 %30, %33
  %35 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %36 = extractvalue %struct.0 %p1, 0
  %37 = getelementptr i32, ptr %36, i32 %p0
  %38 = extractvalue %struct.0 %p1, 1
  %39 = icmp sge i64 %38, -2147483648
  %40 = icmp sle i64 %38, 2147483647
  %41 = and i1 %39, %40
  %42 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %43 = icmp sge i32 %p0, 0
  %44 = trunc i64 %38 to i32
  %45 = icmp slt i32 %p0, %44
  %46 = and i1 %43, %45
  %47 = icmp eq i32 %p0, 0
  %48 = icmp eq i32 %44, 0
  %49 = and i1 %47, %48
  %50 = or i1 %46, %49
  %51 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %52 = extractvalue %struct.0 %p1, 0
  %53 = getelementptr i32, ptr %52, i32 %p0
  br i1 %2, label %bb4, label %bb1

bb1:
  br i1 %5, label %bb3, label %bb2

bb2:
  call void @ilgpu.debug.assert(i1 %9, ptr %10)
  call void @ilgpu.debug.assert(i1 %18, ptr %19)
  store i32 2, ptr %21
  br label %bb5

bb3:
  call void @ilgpu.debug.assert(i1 %25, ptr %26)
  call void @ilgpu.debug.assert(i1 %34, ptr %35)
  store i32 0, ptr %37
  br label %bb5

bb4:
  call void @ilgpu.debug.assert(i1 %41, ptr %42)
  call void @ilgpu.debug.assert(i1 %50, ptr %51)
  store i32 1, ptr %53
  br label %bb5

bb5:
  ret void

}


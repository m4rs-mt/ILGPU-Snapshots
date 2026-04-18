; stage: AfterGlobalOpt  opt: O1
; module: IfAndOrKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @IfAndOrKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp sle i32 %p2, 0
  %1 = icmp sle i32 %p3, 0
  %2 = or i1 %0, %1
  %3 = extractvalue %struct.0 %p1, 1
  %4 = icmp sge i64 %3, -2147483648
  %5 = icmp sle i64 %3, 2147483647
  %6 = and i1 %4, %5
  %7 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %8 = icmp sge i32 %p0, 0
  %9 = trunc i64 %3 to i32
  %10 = icmp slt i32 %p0, %9
  %11 = and i1 %8, %10
  %12 = icmp eq i32 %p0, 0
  %13 = icmp eq i32 %9, 0
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %16 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %17 = extractvalue %struct.0 %p1, 0
  %18 = getelementptr i32, ptr %17, i32 %p0
  %19 = icmp sle i32 %p2, 0
  %20 = icmp sle i32 %p3, 0
  %21 = and i1 %19, %20
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
  br i1 %2, label %bb2, label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  store i32 1, ptr %18
  br label %bb5

bb2:
  br i1 %21, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %25, ptr %26)
  call void @ilgpu.debug.assert(i1 %34, ptr %35)
  store i32 2, ptr %37
  br label %bb5

bb4:
  call void @ilgpu.debug.assert(i1 %41, ptr %42)
  call void @ilgpu.debug.assert(i1 %50, ptr %51)
  store i32 0, ptr %53
  br label %bb5

bb5:
  ret void

}


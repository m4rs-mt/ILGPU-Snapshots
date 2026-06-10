; stage: AfterGlobalOpt  opt: O2
; module: IfAndOrKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @IfAndOrKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp sgt i32 %p2, 0
  %1 = icmp sgt i32 %p3, 0
  %2 = and i1 %0, %1
  %3 = icmp sle i32 %p2, 0
  %4 = icmp sgt i32 %p2, 0
  %5 = and i1 %3, %4
  %6 = icmp sgt i32 %p2, 0
  %7 = icmp sgt i32 %p3, 0
  %8 = and i1 %6, %7
  %9 = or i1 %5, %8
  %10 = icmp sle i32 %p2, 0
  %11 = or i1 %9, %10
  %12 = icmp sle i32 %p3, 0
  %13 = and i1 %11, %12
  %14 = extractvalue %struct.0 %p1, 1
  %15 = icmp sge i64 %14, -2147483648
  %16 = icmp sle i64 %14, 2147483647
  %17 = and i1 %15, %16
  %18 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %19 = icmp sge i32 %p0, 0
  %20 = trunc i64 %14 to i32
  %21 = icmp slt i32 %p0, %20
  %22 = and i1 %19, %21
  %23 = icmp eq i32 %p0, 0
  %24 = icmp eq i32 %20, 0
  %25 = and i1 %23, %24
  %26 = or i1 %22, %25
  %27 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %28 = extractvalue %struct.0 %p1, 0
  %29 = getelementptr i32, ptr %28, i32 %p0
  %30 = extractvalue %struct.0 %p1, 1
  %31 = icmp sge i64 %30, -2147483648
  %32 = icmp sle i64 %30, 2147483647
  %33 = and i1 %31, %32
  %34 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %35 = icmp sge i32 %p0, 0
  %36 = trunc i64 %30 to i32
  %37 = icmp slt i32 %p0, %36
  %38 = and i1 %35, %37
  %39 = icmp eq i32 %p0, 0
  %40 = icmp eq i32 %36, 0
  %41 = and i1 %39, %40
  %42 = or i1 %38, %41
  %43 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %44 = extractvalue %struct.0 %p1, 0
  %45 = getelementptr i32, ptr %44, i32 %p0
  %46 = extractvalue %struct.0 %p1, 1
  %47 = icmp sge i64 %46, -2147483648
  %48 = icmp sle i64 %46, 2147483647
  %49 = and i1 %47, %48
  %50 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %51 = icmp sge i32 %p0, 0
  %52 = trunc i64 %46 to i32
  %53 = icmp slt i32 %p0, %52
  %54 = and i1 %51, %53
  %55 = icmp eq i32 %p0, 0
  %56 = icmp eq i32 %52, 0
  %57 = and i1 %55, %56
  %58 = or i1 %54, %57
  %59 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %60 = extractvalue %struct.0 %p1, 0
  %61 = getelementptr i32, ptr %60, i32 %p0
  br i1 %2, label %bb4, label %bb1

bb1:
  br i1 %13, label %bb3, label %bb2

bb2:
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  call void @ilgpu.debug.assert(i1 %26, ptr %27)
  store i32 2, ptr %29
  br label %bb5

bb3:
  call void @ilgpu.debug.assert(i1 %33, ptr %34)
  call void @ilgpu.debug.assert(i1 %42, ptr %43)
  store i32 0, ptr %45
  br label %bb5

bb4:
  call void @ilgpu.debug.assert(i1 %49, ptr %50)
  call void @ilgpu.debug.assert(i1 %58, ptr %59)
  store i32 1, ptr %61
  br label %bb5

bb5:
  ret void

}


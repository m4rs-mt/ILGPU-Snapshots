; stage: AfterGlobalOpt  opt: O2
; module: DeepMixedKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DeepMixedKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4, i32 %p5, i32 %p6) {
entry:
  %0 = icmp sgt i32 %p2, 0
  %1 = icmp sgt i32 %p3, 0
  %2 = and i1 %0, %1
  %3 = icmp sle i32 %p3, 0
  %4 = and i1 %0, %3
  %5 = icmp sgt i32 %p4, 0
  %6 = and i1 %4, %5
  %7 = or i1 %2, %6
  %8 = icmp sle i32 %p2, 0
  %9 = icmp sgt i32 %p3, 0
  %10 = or i1 %8, %9
  %11 = icmp sgt i32 %p4, 0
  %12 = or i1 %10, %11
  %13 = and i1 %0, %12
  %14 = icmp sgt i32 %p5, 0
  %15 = or i1 %13, %14
  %16 = icmp sgt i32 %p6, 0
  %17 = and i1 %15, %16
  %18 = select i1 %17, i32 1, i32 0
  %19 = select i1 %7, i32 1, i32 %18
  %20 = icmp eq i32 %19, 0
  %21 = extractvalue %struct.0 %p1, 1
  %22 = icmp sge i64 %21, -2147483648
  %23 = icmp sle i64 %21, 2147483647
  %24 = and i1 %22, %23
  %25 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %26 = icmp sge i32 %p0, 0
  %27 = trunc i64 %21 to i32
  %28 = icmp slt i32 %p0, %27
  %29 = and i1 %26, %28
  %30 = icmp eq i32 %p0, 0
  %31 = icmp eq i32 %27, 0
  %32 = and i1 %30, %31
  %33 = or i1 %29, %32
  %34 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %35 = extractvalue %struct.0 %p1, 0
  %36 = getelementptr i32, ptr %35, i32 %p0
  %37 = extractvalue %struct.0 %p1, 1
  %38 = icmp sge i64 %37, -2147483648
  %39 = icmp sle i64 %37, 2147483647
  %40 = and i1 %38, %39
  %41 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %42 = icmp sge i32 %p0, 0
  %43 = trunc i64 %37 to i32
  %44 = icmp slt i32 %p0, %43
  %45 = and i1 %42, %44
  %46 = icmp eq i32 %p0, 0
  %47 = icmp eq i32 %43, 0
  %48 = and i1 %46, %47
  %49 = or i1 %45, %48
  %50 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %51 = extractvalue %struct.0 %p1, 0
  %52 = getelementptr i32, ptr %51, i32 %p0
  br i1 %20, label %bb2, label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %24, ptr %25)
  call void @ilgpu.debug.assert(i1 %33, ptr %34)
  store i32 1, ptr %36
  br label %bb3

bb2:
  call void @ilgpu.debug.assert(i1 %40, ptr %41)
  call void @ilgpu.debug.assert(i1 %49, ptr %50)
  store i32 0, ptr %52
  br label %bb3

bb3:
  ret void

}


; stage: AfterGlobalOpt  opt: O1
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
  %8 = icmp sgt i32 %p2, 0
  %9 = icmp sle i32 %p2, 0
  %10 = icmp sgt i32 %p3, 0
  %11 = or i1 %9, %10
  %12 = icmp sgt i32 %p4, 0
  %13 = or i1 %11, %12
  %14 = and i1 %8, %13
  %15 = icmp sgt i32 %p5, 0
  %16 = or i1 %14, %15
  %17 = icmp sgt i32 %p6, 0
  %18 = and i1 %16, %17
  %19 = select i1 %18, i32 1, i32 0
  %20 = select i1 %7, i32 1, i32 %19
  %21 = icmp eq i32 %20, 0
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
  br i1 %21, label %bb2, label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %25, ptr %26)
  call void @ilgpu.debug.assert(i1 %34, ptr %35)
  store i32 1, ptr %37
  br label %bb3

bb2:
  call void @ilgpu.debug.assert(i1 %41, ptr %42)
  call void @ilgpu.debug.assert(i1 %50, ptr %51)
  store i32 0, ptr %53
  br label %bb3

bb3:
  ret void

}


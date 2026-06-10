; stage: AfterGlobalOpt  opt: O1
; module: MixedNesting2Kernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @MixedNesting2Kernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4) {
entry:
  %0 = icmp sle i32 %p2, 0
  %1 = icmp sgt i32 %p3, 0
  %2 = or i1 %0, %1
  %3 = icmp sle i32 %p2, 0
  %4 = icmp sle i32 %p3, 0
  %5 = or i1 %3, %4
  %6 = and i1 %2, %5
  %7 = icmp sle i32 %p2, 0
  %8 = icmp sle i32 %p3, 0
  %9 = or i1 %7, %8
  %10 = icmp sle i32 %p4, 0
  %11 = and i1 %9, %10
  %12 = or i1 %6, %11
  %13 = extractvalue %struct.0 %p1, 1
  %14 = icmp sge i64 %13, -2147483648
  %15 = icmp sle i64 %13, 2147483647
  %16 = and i1 %14, %15
  %17 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %18 = icmp sge i32 %p0, 0
  %19 = trunc i64 %13 to i32
  %20 = icmp slt i32 %p0, %19
  %21 = and i1 %18, %20
  %22 = icmp eq i32 %p0, 0
  %23 = icmp eq i32 %19, 0
  %24 = and i1 %22, %23
  %25 = or i1 %21, %24
  %26 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %27 = extractvalue %struct.0 %p1, 0
  %28 = getelementptr i32, ptr %27, i32 %p0
  %29 = extractvalue %struct.0 %p1, 1
  %30 = icmp sge i64 %29, -2147483648
  %31 = icmp sle i64 %29, 2147483647
  %32 = and i1 %30, %31
  %33 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %34 = icmp sge i32 %p0, 0
  %35 = trunc i64 %29 to i32
  %36 = icmp slt i32 %p0, %35
  %37 = and i1 %34, %36
  %38 = icmp eq i32 %p0, 0
  %39 = icmp eq i32 %35, 0
  %40 = and i1 %38, %39
  %41 = or i1 %37, %40
  %42 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %43 = extractvalue %struct.0 %p1, 0
  %44 = getelementptr i32, ptr %43, i32 %p0
  br i1 %12, label %bb2, label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %16, ptr %17)
  call void @ilgpu.debug.assert(i1 %25, ptr %26)
  store i32 1, ptr %28
  br label %bb3

bb2:
  call void @ilgpu.debug.assert(i1 %32, ptr %33)
  call void @ilgpu.debug.assert(i1 %41, ptr %42)
  store i32 0, ptr %44
  br label %bb3

bb3:
  ret void

}


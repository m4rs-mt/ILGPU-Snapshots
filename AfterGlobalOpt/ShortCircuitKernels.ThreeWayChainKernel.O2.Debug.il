; stage: AfterGlobalOpt  opt: O2
; module: ThreeWayChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @ThreeWayChainKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4) {
entry:
  %0 = icmp sgt i32 %p2, 0
  %1 = icmp sgt i32 %p3, 0
  %2 = or i1 %0, %1
  %3 = icmp sle i32 %p4, 0
  %4 = extractvalue %struct.0 %p1, 1
  %5 = icmp sge i64 %4, -2147483648
  %6 = icmp sle i64 %4, 2147483647
  %7 = and i1 %5, %6
  %8 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %9 = icmp sge i32 %p0, 0
  %10 = trunc i64 %4 to i32
  %11 = icmp slt i32 %p0, %10
  %12 = and i1 %9, %11
  %13 = icmp eq i32 %p0, 0
  %14 = icmp eq i32 %10, 0
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  %17 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %18 = extractvalue %struct.0 %p1, 0
  %19 = getelementptr i32, ptr %18, i32 %p0
  %20 = extractvalue %struct.0 %p1, 1
  %21 = icmp sge i64 %20, -2147483648
  %22 = icmp sle i64 %20, 2147483647
  %23 = and i1 %21, %22
  %24 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %25 = icmp sge i32 %p0, 0
  %26 = trunc i64 %20 to i32
  %27 = icmp slt i32 %p0, %26
  %28 = and i1 %25, %27
  %29 = icmp eq i32 %p0, 0
  %30 = icmp eq i32 %26, 0
  %31 = and i1 %29, %30
  %32 = or i1 %28, %31
  %33 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %34 = extractvalue %struct.0 %p1, 0
  %35 = getelementptr i32, ptr %34, i32 %p0
  %36 = extractvalue %struct.0 %p1, 1
  %37 = icmp sge i64 %36, -2147483648
  %38 = icmp sle i64 %36, 2147483647
  %39 = and i1 %37, %38
  %40 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %41 = icmp sge i32 %p0, 0
  %42 = trunc i64 %36 to i32
  %43 = icmp slt i32 %p0, %42
  %44 = and i1 %41, %43
  %45 = icmp eq i32 %p0, 0
  %46 = icmp eq i32 %42, 0
  %47 = and i1 %45, %46
  %48 = or i1 %44, %47
  %49 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %50 = extractvalue %struct.0 %p1, 0
  %51 = getelementptr i32, ptr %50, i32 %p0
  br i1 %2, label %bb4, label %bb1

bb1:
  br i1 %3, label %bb3, label %bb2

bb2:
  call void @ilgpu.debug.assert(i1 %7, ptr %8)
  call void @ilgpu.debug.assert(i1 %16, ptr %17)
  store i32 20, ptr %19
  br label %bb5

bb3:
  call void @ilgpu.debug.assert(i1 %23, ptr %24)
  call void @ilgpu.debug.assert(i1 %32, ptr %33)
  store i32 30, ptr %35
  br label %bb5

bb4:
  call void @ilgpu.debug.assert(i1 %39, ptr %40)
  call void @ilgpu.debug.assert(i1 %48, ptr %49)
  store i32 10, ptr %51
  br label %bb5

bb5:
  ret void

}


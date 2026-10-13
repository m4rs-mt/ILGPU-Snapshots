; stage: AfterGlobalOpt  opt: O2
; module: DivGuardKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DivGuardKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp eq i32 %p3, 0
  %1 = extractvalue %struct.0 %p1, 1
  %2 = icmp sge i64 %1, -2147483648
  %3 = icmp sle i64 %1, 2147483647
  %4 = and i1 %2, %3
  %5 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %6 = icmp sge i32 %p0, 0
  %7 = trunc i64 %1 to i32
  %8 = icmp slt i32 %p0, %7
  %9 = and i1 %6, %8
  %10 = icmp eq i32 %p0, 0
  %11 = icmp eq i32 %7, 0
  %12 = and i1 %10, %11
  %13 = or i1 %9, %12
  %14 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %15 = extractvalue %struct.0 %p1, 0
  %16 = getelementptr i32, ptr %15, i32 %p0
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
  br i1 %0, label %bb2, label %bb1

bb1:
  %33 = sdiv i32 %p2, %p3
  %34 = icmp sgt i32 %33, 2
  br label %bb3

bb2:
  br label %bb3

bb3:
  %35 = phi i1 [ %34, %bb1 ], [ false, %bb2 ]
  %36 = xor i1 %35, -1
  br i1 %36, label %bb5, label %bb4

bb4:
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  call void @ilgpu.debug.assert(i1 %13, ptr %14)
  store i32 1, ptr %16
  br label %bb6

bb5:
  call void @ilgpu.debug.assert(i1 %20, ptr %21)
  call void @ilgpu.debug.assert(i1 %29, ptr %30)
  store i32 0, ptr %32
  br label %bb6

bb6:
  ret void

}


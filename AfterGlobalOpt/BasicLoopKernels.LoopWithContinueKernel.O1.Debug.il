; stage: AfterGlobalOpt  opt: O1
; module: LoopWithContinueKernel  [intptr: i64]

%struct.0 = type { view<i32>, i64, i8 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @LoopWithContinueKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = extractvalue %struct.1 %p1, 0
  %1 = extractvalue %struct.1 %p1, 1
  %2 = extractvalue %struct.1 %p1, 2
  %3 = { %view.i32 %0, i64 %1, i8 %2 }  ; %struct.1
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %5 = icmp sge i32 %p0, 0
  %6 = icmp eq i32 %p0, 0
  %7 = call ptr @ilgpu.string("X_index_out_of_bounds")
  br label %bb1

bb1:
  br label %bb2

bb2:
  %8 = phi i32 [ 0, %bb1 ], [ %11, %bb5 ]
  %9 = phi i32 [ 0, %bb1 ], [ %15, %bb5 ]
  %10 = phi %struct.1 [ %3, %bb1 ], [ %19, %bb5 ]
  %11 = add i32 %8, 1
  %12 = srem i32 %8, 2
  %13 = icmp ne i32 %12, 0
  %14 = add i32 %9, %8
  %15 = select i1 %13, i32 %14, i32 %9
  %16 = extractvalue %struct.1 %10, 0
  %17 = extractvalue %struct.1 %10, 1
  %18 = extractvalue %struct.1 %10, 2
  %19 = { %view.i32 %16, i64 %17, i8 %18 }  ; %struct.1
  %20 = icmp slt i32 %8, 10
  %21 = extractvalue %struct.1 %10, 1
  %22 = icmp sge i64 %21, -2147483648
  %23 = icmp sle i64 %21, 2147483647
  %24 = and i1 %22, %23
  %25 = trunc i64 %21 to i32
  %26 = icmp slt i32 %p0, %25
  %27 = and i1 %5, %26
  %28 = icmp eq i32 %25, 0
  %29 = and i1 %6, %28
  %30 = or i1 %27, %29
  %31 = extractvalue %struct.1 %10, 0
  %32 = getelementptr i32, ptr %31, i32 %p0
  br i1 %20, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %24, ptr %4)
  call void @ilgpu.debug.assert(i1 %30, ptr %7)
  store i32 %9, ptr %32
  ret void

bb4:
  br label %bb5

bb5:
  br label %bb2

}


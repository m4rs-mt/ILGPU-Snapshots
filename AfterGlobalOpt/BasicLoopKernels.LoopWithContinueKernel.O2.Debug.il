; stage: AfterGlobalOpt  opt: O2
; module: LoopWithContinueKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { %view.i32, i64, i8 }

define void @LoopWithContinueKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = bitcast %view.i32 %0 to %view.i32
  %2 = extractvalue %struct.0 %p1, 1
  %3 = extractvalue %struct.0 %p1, 2
  %4 = { %view.i32 %1, i64 %2, i8 %3 }  ; %struct.1
  %5 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %6 = icmp sge i32 %p0, 0
  %7 = icmp eq i32 %p0, 0
  %8 = call ptr @ilgpu.string("X_index_out_of_bounds")
  br label %bb1

bb1:
  br label %bb2

bb2:
  %9 = phi i32 [ 0, %bb1 ], [ %12, %bb5 ]
  %10 = phi i32 [ 0, %bb1 ], [ %16, %bb5 ]
  %11 = phi %struct.1 [ %4, %bb1 ], [ %20, %bb5 ]
  %12 = add i32 %9, 1
  %13 = srem i32 %9, 2
  %14 = icmp ne i32 %13, 0
  %15 = add i32 %10, %9
  %16 = select i1 %14, i32 %15, i32 %10
  %17 = extractvalue %struct.1 %11, 0
  %18 = extractvalue %struct.1 %11, 1
  %19 = extractvalue %struct.1 %11, 2
  %20 = { %view.i32 %17, i64 %18, i8 %19 }  ; %struct.1
  %21 = icmp slt i32 %9, 10
  %22 = extractvalue %struct.1 %11, 1
  %23 = icmp sge i64 %22, -2147483648
  %24 = icmp sle i64 %22, 2147483647
  %25 = and i1 %23, %24
  %26 = trunc i64 %22 to i32
  %27 = icmp slt i32 %p0, %26
  %28 = and i1 %6, %27
  %29 = icmp eq i32 %26, 0
  %30 = and i1 %7, %29
  %31 = or i1 %28, %30
  %32 = extractvalue %struct.1 %11, 0
  %33 = getelementptr i32, ptr %32, i32 %p0
  br i1 %21, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %25, ptr %5)
  call void @ilgpu.debug.assert(i1 %31, ptr %8)
  store i32 %10, ptr %33
  ret void

bb4:
  br label %bb5

bb5:
  br label %bb2

}


; stage: AfterGlobalOpt  opt: O2
; module: NestedLoopKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { %view.i32, i64, i8 }

define void @NestedLoopKernel(i32 %p0, %struct.0 %p1) {
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
  %9 = phi i32 [ 0, %bb1 ], [ %12, %bb6 ]
  %10 = phi i32 [ 0, %bb1 ], [ %32, %bb6 ]
  %11 = phi %struct.1 [ %4, %bb1 ], [ %16, %bb6 ]
  %12 = add i32 %9, 1
  %13 = extractvalue %struct.1 %11, 0
  %14 = extractvalue %struct.1 %11, 1
  %15 = extractvalue %struct.1 %11, 2
  %16 = { %view.i32 %13, i64 %14, i8 %15 }  ; %struct.1
  %17 = icmp slt i32 %9, 4
  %18 = extractvalue %struct.1 %11, 1
  %19 = icmp sge i64 %18, -2147483648
  %20 = icmp sle i64 %18, 2147483647
  %21 = and i1 %19, %20
  %22 = trunc i64 %18 to i32
  %23 = icmp slt i32 %p0, %22
  %24 = and i1 %6, %23
  %25 = icmp eq i32 %22, 0
  %26 = and i1 %7, %25
  %27 = or i1 %24, %26
  %28 = extractvalue %struct.1 %11, 0
  %29 = getelementptr i32, ptr %28, i32 %p0
  %30 = shl i32 %9, 2
  br i1 %17, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %21, ptr %5)
  call void @ilgpu.debug.assert(i1 %27, ptr %8)
  store i32 %10, ptr %29
  ret void

bb4:
  br label %bb5

bb5:
  %31 = phi i32 [ 0, %bb4 ], [ %33, %bb7 ]
  %32 = phi i32 [ %10, %bb4 ], [ %35, %bb7 ]
  %33 = add i32 %31, 1
  %34 = add i32 %30, %31
  %35 = add i32 %32, %34
  %36 = icmp slt i32 %31, 4
  br i1 %36, label %bb7, label %bb6

bb6:
  br label %bb2

bb7:
  br label %bb5

}


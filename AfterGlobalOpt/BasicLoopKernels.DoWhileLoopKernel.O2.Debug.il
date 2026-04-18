; stage: AfterGlobalOpt  opt: O2
; module: DoWhileLoopKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DoWhileLoopKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 1
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %5 = icmp sge i32 %p0, 0
  %6 = trunc i64 %0 to i32
  %7 = icmp slt i32 %p0, %6
  %8 = and i1 %5, %7
  %9 = icmp eq i32 %p0, 0
  %10 = icmp eq i32 %6, 0
  %11 = and i1 %9, %10
  %12 = or i1 %8, %11
  %13 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %14 = extractvalue %struct.0 %p1, 0
  %15 = getelementptr i32, ptr %14, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %16 = phi i32 [ 0, %bb1 ], [ %18, %bb2 ]
  %17 = phi i32 [ %p2, %bb1 ], [ %19, %bb2 ]
  %18 = add i32 %16, 1
  %19 = sub i32 %17, 1
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %bb2, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  store i32 %18, ptr %15
  ret void

}


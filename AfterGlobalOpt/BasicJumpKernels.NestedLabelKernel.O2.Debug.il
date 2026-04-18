; stage: AfterGlobalOpt  opt: O2
; module: NestedLabelKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @NestedLabelKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = icmp ne i32 %p2, 0
  %1 = icmp ne i32 %p2, 1
  %2 = mul i32 %p2, 3
  %3 = extractvalue %struct.0 %p1, 1
  %4 = icmp sge i64 %3, -2147483648
  %5 = icmp sle i64 %3, 2147483647
  %6 = and i1 %4, %5
  %7 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %8 = icmp sge i32 %p0, 0
  %9 = trunc i64 %3 to i32
  %10 = icmp slt i32 %p0, %9
  %11 = and i1 %8, %10
  %12 = icmp eq i32 %p0, 0
  %13 = icmp eq i32 %9, 0
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %16 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %17 = extractvalue %struct.0 %p1, 0
  %18 = getelementptr i32, ptr %17, i32 %p0
  br i1 %0, label %bb3, label %bb1

bb1:
  br label %bb2

bb2:
  br label %bb7

bb3:
  br i1 %1, label %bb6, label %bb4

bb4:
  br label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %19 = phi i32 [ 100, %bb2 ], [ 200, %bb5 ], [ %2, %bb6 ]
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  store i32 %19, ptr %18
  ret void

}


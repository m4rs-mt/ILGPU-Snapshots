; stage: AfterGlobalOpt  opt: O2
; module: AccumulateKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @AccumulateKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 3)
  %1 = getelementptr i32, ptr %0, i32 0
  %2 = getelementptr i32, ptr %0, i32 1
  %3 = getelementptr i32, ptr %0, i32 2
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
  br label %bb1

bb1:
  store i32 1, ptr %1
  store i32 2, ptr %2
  store i32 3, ptr %3
  br label %bb2

bb2:
  %20 = phi i32 [ 0, %bb1 ], [ %22, %bb4 ]
  %21 = phi i32 [ 0, %bb1 ], [ %26, %bb4 ]
  %22 = add i32 %20, 1
  %23 = icmp slt i32 %20, 3
  %24 = getelementptr i32, ptr %0, i32 %20
  br i1 %23, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %7, ptr %8)
  call void @ilgpu.debug.assert(i1 %16, ptr %17)
  store i32 %21, ptr %19
  ret void

bb4:
  %25 = load i32, ptr %24
  %26 = add i32 %21, %25
  br label %bb2

}


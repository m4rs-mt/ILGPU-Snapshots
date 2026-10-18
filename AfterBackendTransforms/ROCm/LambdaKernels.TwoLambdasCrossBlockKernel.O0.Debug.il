; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: TwoLambdasCrossBlockKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }

define void @TwoLambdasCrossBlockKernel(i32 %p0, %struct.1 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.1 %p1, 2
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = icmp sge i32 %p0, 0
  %6 = trunc i64 %0 to i32
  %7 = icmp slt i32 %p0, %6
  %8 = and i1 %5, %7
  %9 = icmp eq i32 %p0, 0
  %10 = icmp eq i32 %6, 0
  %11 = and i1 %9, %10
  %12 = or i1 %8, %11
  %13 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  %14 = icmp sgt i32 %p2, 0
  %15 = icmp sgt i32 %p2, 0
  %16 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %17 = extractvalue %struct.0 %16, 0
  %18 = getelementptr i32, ptr %17, i32 %p0
  br i1 %14, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %19 = phi i32 [ 0, %bb1 ], [ %p0, %bb2 ]
  %20 = add i32 %19, 1
  br i1 %15, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %21 = phi i32 [ 1, %bb4 ], [ %p0, %bb5 ]
  %22 = shl i32 %21, 1
  %23 = add i32 %20, %22
  store i32 %23, ptr %18
  ret void

}


; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: LambdaConditionalKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @LambdaConditionalKernel(i32 %p0, %struct.1 %p1, i32 %p2) {
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
  %14 = icmp sgt i32 %p0, %p2
  %15 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %16 = extractvalue %struct.0 %15, 0
  %17 = getelementptr i32, ptr %16, i32 %p0
  br i1 %14, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %18 = phi i32 [ %p0, %bb1 ], [ %p2, %bb2 ]
  store i32 %18, ptr %17
  ret void

}


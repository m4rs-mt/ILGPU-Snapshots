; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: WhileLoopKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @WhileLoopKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = extractvalue %struct.1 %p1, 2
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
  %14 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %15 = extractvalue %struct.0 %14, 0
  %16 = getelementptr i32, ptr %15, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %17 = phi i32 [ 0, %bb1 ], [ %19, %bb4 ]
  %18 = phi i32 [ 0, %bb1 ], [ %20, %bb4 ]
  %19 = add i32 %17, 1
  %20 = add i32 %18, %17
  %21 = icmp slt i32 %17, 10
  br i1 %21, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  store i32 %18, ptr %16
  ret void

bb4:
  br label %bb2

}


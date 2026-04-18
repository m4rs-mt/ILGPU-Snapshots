; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: PhiInliningKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @PhiInliningKernel(i32 %p0, %struct.1 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp sle i32 %p2, %p3
  %1 = sub i32 %p2, %p3
  %2 = sub i32 %p3, %p2
  %3 = extractvalue %struct.1 %p1, 2
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
  %17 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %18 = extractvalue %struct.0 %17, 0
  %19 = getelementptr i32, ptr %18, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %20 = phi i32 [ %1, %bb1 ], [ %2, %bb2 ]
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  store i32 %20, ptr %19
  ret void

}


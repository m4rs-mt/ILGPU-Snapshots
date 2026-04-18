; stage: AfterBackendTransforms  backend: Cuda  opt: O1
; module: WhileLoopKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @WhileLoopKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 2
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
  %16 = phi i32 [ 0, %bb1 ], [ %18, %bb4 ]
  %17 = phi i32 [ 0, %bb1 ], [ %19, %bb4 ]
  %18 = add i32 %16, 1
  %19 = add i32 %17, %16
  %20 = icmp slt i32 %16, 10
  br i1 %20, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  store i32 %17, ptr %15
  ret void

bb4:
  br label %bb2

}


; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: AndChainKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @AndChainKernel(i32 %p0, %struct.1 %p1, i32 %p2, i32 %p3, i32 %p4) {
entry:
  %0 = icmp sle i32 %p2, 0
  %1 = icmp sle i32 %p3, 0
  %2 = icmp sgt i32 %p4, 0
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
  %20 = extractvalue %struct.1 %p1, 2
  %21 = icmp sge i64 %20, -2147483648
  %22 = icmp sle i64 %20, 2147483647
  %23 = and i1 %21, %22
  %24 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %25 = icmp sge i32 %p0, 0
  %26 = trunc i64 %20 to i32
  %27 = icmp slt i32 %p0, %26
  %28 = and i1 %25, %27
  %29 = icmp eq i32 %p0, 0
  %30 = icmp eq i32 %26, 0
  %31 = and i1 %29, %30
  %32 = or i1 %28, %31
  %33 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %34 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %35 = extractvalue %struct.0 %34, 0
  %36 = getelementptr i32, ptr %35, i32 %p0
  br i1 %0, label %bb3, label %bb1

bb1:
  br i1 %1, label %bb3, label %bb2

bb2:
  br label %bb4

bb3:
  br label %bb4

bb4:
  %37 = phi i1 [ %2, %bb2 ], [ false, %bb3 ]
  %38 = xor i1 %37, -1
  br i1 %38, label %bb6, label %bb5

bb5:
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  store i32 1, ptr %19
  br label %bb7

bb6:
  call void @ilgpu.debug.assert(i1 %23, ptr %24)
  call void @ilgpu.debug.assert(i1 %32, ptr %33)
  store i32 0, ptr %36
  br label %bb7

bb7:
  ret void

}


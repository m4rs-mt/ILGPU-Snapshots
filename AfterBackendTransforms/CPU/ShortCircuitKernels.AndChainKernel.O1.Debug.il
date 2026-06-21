; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: AndChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @AndChainKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4) {
entry:
  %0 = icmp sle i32 %p3, 0
  %1 = icmp sle i32 %p2, 0
  %2 = or i1 %0, %1
  %3 = icmp sle i32 %p4, 0
  %4 = or i1 %2, %3
  %5 = extractvalue %struct.0 %p1, 1
  %6 = icmp sge i64 %5, -2147483648
  %7 = icmp sle i64 %5, 2147483647
  %8 = and i1 %6, %7
  %9 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %10 = icmp sge i32 %p0, 0
  %11 = trunc i64 %5 to i32
  %12 = icmp slt i32 %p0, %11
  %13 = and i1 %10, %12
  %14 = icmp eq i32 %p0, 0
  %15 = icmp eq i32 %11, 0
  %16 = and i1 %14, %15
  %17 = or i1 %13, %16
  %18 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %19 = extractvalue %struct.0 %p1, 0
  %20 = getelementptr i32, ptr %19, i32 %p0
  %21 = extractvalue %struct.0 %p1, 1
  %22 = icmp sge i64 %21, -2147483648
  %23 = icmp sle i64 %21, 2147483647
  %24 = and i1 %22, %23
  %25 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %26 = icmp sge i32 %p0, 0
  %27 = trunc i64 %21 to i32
  %28 = icmp slt i32 %p0, %27
  %29 = and i1 %26, %28
  %30 = icmp eq i32 %p0, 0
  %31 = icmp eq i32 %27, 0
  %32 = and i1 %30, %31
  %33 = or i1 %29, %32
  %34 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %35 = extractvalue %struct.0 %p1, 0
  %36 = getelementptr i32, ptr %35, i32 %p0
  br i1 %4, label %bb2, label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %8, ptr %9)
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  store i32 1, ptr %20
  br label %bb3

bb2:
  call void @ilgpu.debug.assert(i1 %24, ptr %25)
  call void @ilgpu.debug.assert(i1 %33, ptr %34)
  store i32 0, ptr %36
  br label %bb3

bb3:
  ret void

}


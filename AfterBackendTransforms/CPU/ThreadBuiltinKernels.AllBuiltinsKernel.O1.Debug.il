; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: AllBuiltinsKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @AllBuiltinsKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 1
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
  %14 = call i32 @ilgpu.group.index()
  %15 = call i32 @ilgpu.grid.index()
  %16 = call i32 @ilgpu.group.dim()
  %17 = call i32 @ilgpu.grid.dim()
  %18 = call i32 @ComputeGlobalIndex(i32 %14, i32 %15, i32 %16, i32 %17)
  %19 = extractvalue %struct.0 %p1, 0
  %20 = getelementptr i32, ptr %19, i32 %p0
  store i32 %18, ptr %20
  ret void

}

define i32 @ComputeGlobalIndex(i32 %p0, i32 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = mul i32 %p1, %p2
  %1 = add i32 %0, %p0
  %2 = mul i32 %p3, %p2
  %3 = icmp slt i32 %1, %2
  %4 = sub i32 %2, 1
  %5 = select i1 %3, i32 %1, i32 %4
  ret i32 %5

}


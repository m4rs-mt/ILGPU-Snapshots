; stage: AfterBackendTransforms  backend: Cuda  opt: O1
; module: StructFieldAccessKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.1 = type { i32, i64, i16, i32 }

define void @StructFieldAccessKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 2
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
  %14 = extractvalue %struct.0 %p1, 0
  %15 = getelementptr i32, ptr %14, i32 %p0
  %16 = extractvalue %struct.1 %p2, 0
  %17 = extractvalue %struct.1 %p2, 1
  %18 = trunc i64 %17 to i32
  %19 = add i32 %16, %18
  %20 = extractvalue %struct.1 %p2, 2
  %21 = sext i16 %20 to i32
  %22 = add i32 %19, %21
  %23 = extractvalue %struct.1 %p2, 3
  %24 = add i32 %22, %23
  store i32 %24, ptr %15
  ret void

}


; stage: AfterGlobalOpt  opt: O1
; module: MultiCaptureKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i32 }

@g0 = internal global %struct.1 zeroinitializer ; local

define void @MultiCaptureKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = call ptr<%struct.1> addrspace(local) @ilgpu.gc_init(@g0)
  %1 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  store i32 %p2, ptr %1
  %2 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  store i32 %p3, ptr %2
  %3 = extractvalue %struct.0 %p1, 1
  %4 = icmp sge i64 %3, -2147483648
  %5 = icmp sle i64 %3, 2147483647
  %6 = and i1 %4, %5
  %7 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  %8 = icmp sge i32 %p0, 0
  %9 = trunc i64 %3 to i32
  %10 = icmp slt i32 %p0, %9
  %11 = and i1 %8, %10
  %12 = icmp eq i32 %p0, 0
  %13 = icmp eq i32 %9, 0
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %16 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  %17 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %18 = load i32, ptr %17
  %19 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %20 = load i32, ptr %19
  %21 = extractvalue %struct.0 %p1, 0
  %22 = getelementptr i32, ptr %21, i32 %p0
  %23 = mul i32 %p0, %18
  %24 = add i32 %23, %20
  store i32 %24, ptr %22
  ret void

}


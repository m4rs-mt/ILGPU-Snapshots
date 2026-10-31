; stage: AfterGlobalOpt  opt: O1
; module: ConditionalFieldKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { ptr<i32> addrspace(local), i32 }

define void @ConditionalFieldKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = alloca i32, i32 1
  store i32 0, ptr %1
  %2 = extractvalue %struct.0 %p1, 1
  %3 = icmp sge i64 %2, -2147483648
  %4 = icmp sle i64 %2, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %2 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  %16 = extractvalue %struct.0 %p1, 0
  %17 = getelementptr i32, ptr %16, i32 %p0
  %18 = load i32, ptr %17
  store i32 %18, ptr %0
  store i32 7, ptr %1
  %19 = extractvalue %struct.0 %p1, 1
  %20 = icmp sge i64 %19, -2147483648
  %21 = icmp sle i64 %19, 2147483647
  %22 = and i1 %20, %21
  %23 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %22, ptr %23)
  %24 = icmp sge i32 %p0, 0
  %25 = trunc i64 %19 to i32
  %26 = icmp slt i32 %p0, %25
  %27 = and i1 %24, %26
  %28 = icmp eq i32 %p0, 0
  %29 = icmp eq i32 %25, 0
  %30 = and i1 %28, %29
  %31 = or i1 %27, %30
  %32 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %31, ptr %32)
  %33 = and i32 %p0, 1
  %34 = icmp ule i32 %33, 0
  %35 = { ptr<i32> addrspace(local) %0, i32 1 }  ; %struct.1
  %36 = { ptr<i32> addrspace(local) %1, i32 1 }  ; %struct.1
  %37 = select i1 %34, %struct.1 %35, %struct.1 %36
  %38 = extractvalue %struct.1 %37, 0
  %39 = load i32, ptr %38
  %40 = extractvalue %struct.0 %p1, 0
  %41 = getelementptr i32, ptr %40, i32 %p0
  %42 = extractvalue %struct.1 %37, 1
  %43 = add i32 %39, %42
  store i32 %43, ptr %41
  ret void

}


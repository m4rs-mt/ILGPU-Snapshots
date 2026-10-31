; stage: AfterBackendTransforms  backend: ROCm  opt: O2
; module: LocalNullCheckKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @LocalNullCheckKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = extractvalue %struct.0 %p1, 2
  %2 = icmp sge i64 %1, -2147483648
  %3 = icmp sle i64 %1, 2147483647
  %4 = and i1 %2, %3
  %5 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  %6 = icmp sge i32 %p0, 0
  %7 = trunc i64 %1 to i32
  %8 = icmp slt i32 %p0, %7
  %9 = and i1 %6, %8
  %10 = icmp eq i32 %p0, 0
  %11 = icmp eq i32 %7, 0
  %12 = and i1 %10, %11
  %13 = or i1 %9, %12
  %14 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %13, ptr %14)
  %15 = extractvalue %struct.0 %p1, 0
  %16 = getelementptr i32, ptr %15, i32 %p0
  %17 = load i32, ptr %16
  store i32 %17, ptr %0
  %18 = load i32, ptr %0
  %19 = icmp sle i32 %18, 15
  %20 = select i1 %19, ptr<i32> addrspace(local) null, ptr<i32> addrspace(local) %0
  %21 = icmp eq ptr<i32> addrspace(local) %20, null
  %22 = extractvalue %struct.0 %p1, 2
  %23 = icmp sge i64 %22, -2147483648
  %24 = icmp sle i64 %22, 2147483647
  %25 = and i1 %23, %24
  %26 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %27 = icmp sge i32 %p0, 0
  %28 = trunc i64 %22 to i32
  %29 = icmp slt i32 %p0, %28
  %30 = and i1 %27, %29
  %31 = icmp eq i32 %p0, 0
  %32 = icmp eq i32 %28, 0
  %33 = and i1 %31, %32
  %34 = or i1 %30, %33
  %35 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %36 = extractvalue %struct.0 %p1, 0
  %37 = getelementptr i32, ptr %36, i32 %p0
  %38 = icmp eq ptr<i32> addrspace(local) %20, null
  %39 = select i1 %38, i32 1, i32 2
  br i1 %21, label %bb2, label %bb1

bb1:
  %40 = load i32, ptr %20
  %41 = add i32 %40, 100
  store i32 %41, ptr %20
  br label %bb2

bb2:
  call void @ilgpu.debug.assert(i1 %25, ptr %26)
  call void @ilgpu.debug.assert(i1 %34, ptr %35)
  %42 = load i32, ptr %0
  %43 = add i32 %42, %39
  store i32 %43, ptr %37
  ret void

}


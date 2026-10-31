; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: LocalNullCheckKernel  [intptr: i64]

define void @LocalNullCheckKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = icmp sge i64 %p3, -2147483648
  %2 = icmp sle i64 %p3, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = icmp sge i32 %p0, 0
  %6 = trunc i64 %p3 to i32
  %7 = icmp slt i32 %p0, %6
  %8 = and i1 %5, %7
  %9 = icmp eq i32 %p0, 0
  %10 = icmp eq i32 %6, 0
  %11 = and i1 %9, %10
  %12 = or i1 %8, %11
  %13 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  %14 = getelementptr i32, ptr %p1, i32 %p0
  %15 = load i32, ptr %14
  store i32 %15, ptr %0
  %16 = load i32, ptr %0
  %17 = icmp sle i32 %16, 15
  %18 = select i1 %17, ptr<i32> addrspace(local) null, ptr<i32> addrspace(local) %0
  %19 = icmp eq ptr<i32> addrspace(local) %18, null
  %20 = icmp sge i64 %p3, -2147483648
  %21 = icmp sle i64 %p3, 2147483647
  %22 = and i1 %20, %21
  %23 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %24 = icmp sge i32 %p0, 0
  %25 = trunc i64 %p3 to i32
  %26 = icmp slt i32 %p0, %25
  %27 = and i1 %24, %26
  %28 = icmp eq i32 %p0, 0
  %29 = icmp eq i32 %25, 0
  %30 = and i1 %28, %29
  %31 = or i1 %27, %30
  %32 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %33 = getelementptr i32, ptr %p1, i32 %p0
  %34 = icmp eq ptr<i32> addrspace(local) %18, null
  %35 = select i1 %34, i32 1, i32 2
  br i1 %19, label %bb2, label %bb1

bb1:
  %36 = load i32, ptr %18
  %37 = add i32 %36, 100
  store i32 %37, ptr %18
  br label %bb2

bb2:
  call void @ilgpu.debug.assert(i1 %22, ptr %23)
  call void @ilgpu.debug.assert(i1 %31, ptr %32)
  %38 = load i32, ptr %0
  %39 = add i32 %38, %35
  store i32 %39, ptr %33
  ret void

}


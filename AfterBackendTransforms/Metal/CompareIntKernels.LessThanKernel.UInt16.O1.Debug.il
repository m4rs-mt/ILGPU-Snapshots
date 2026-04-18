; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: LessThanKernel  [intptr: i64]

define void @LessThanKernel(i32 %p0, ptr<i16> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i16> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8, ptr<i32> addrspace(global) %p9, i64 %p10, i64 %p11, i8 %p12) {
entry:
  %0 = icmp sge i64 %p11, -2147483648
  %1 = icmp sle i64 %p11, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  %4 = icmp sge i32 %p0, 0
  %5 = trunc i64 %p11 to i32
  %6 = icmp slt i32 %p0, %5
  %7 = and i1 %4, %6
  %8 = icmp eq i32 %p0, 0
  %9 = icmp eq i32 %5, 0
  %10 = and i1 %8, %9
  %11 = or i1 %7, %10
  %12 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  %13 = icmp sge i64 %p3, -2147483648
  %14 = icmp sle i64 %p3, 2147483647
  %15 = and i1 %13, %14
  %16 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  %17 = icmp sge i32 %p0, 0
  %18 = trunc i64 %p3 to i32
  %19 = icmp slt i32 %p0, %18
  %20 = and i1 %17, %19
  %21 = icmp eq i32 %p0, 0
  %22 = icmp eq i32 %18, 0
  %23 = and i1 %21, %22
  %24 = or i1 %20, %23
  %25 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %24, ptr %25)
  %26 = icmp sge i64 %p7, -2147483648
  %27 = icmp sle i64 %p7, 2147483647
  %28 = and i1 %26, %27
  %29 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %28, ptr %29)
  %30 = icmp sge i32 %p0, 0
  %31 = trunc i64 %p7 to i32
  %32 = icmp slt i32 %p0, %31
  %33 = and i1 %30, %32
  %34 = icmp eq i32 %p0, 0
  %35 = icmp eq i32 %31, 0
  %36 = and i1 %34, %35
  %37 = or i1 %33, %36
  %38 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %37, ptr %38)
  %39 = getelementptr i16, ptr %p5, i32 %p0
  %40 = load i16, ptr %39
  %41 = getelementptr i16, ptr %p1, i32 %p0
  %42 = load i16, ptr %41
  %43 = getelementptr i32, ptr %p9, i32 %p0
  %44 = zext i16 %42 to i32
  %45 = zext i16 %40 to i32
  %46 = icmp slt i32 %44, %45
  %47 = select i1 %46, i32 1, i32 0
  store i32 %47, ptr %43
  ret void

}


; stage: AfterBackendTransforms  backend: Cuda  opt: O2
; module: LessThanKernel  [intptr: i64]

%struct.0 = type { ptr<i16> addrspace(global), i64, i64, i8 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @LessThanKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, %struct.1 %p3) {
entry:
  %0 = extractvalue %struct.1 %p3, 2
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
  %14 = extractvalue %struct.0 %p1, 2
  %15 = icmp sge i64 %14, -2147483648
  %16 = icmp sle i64 %14, 2147483647
  %17 = and i1 %15, %16
  %18 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  %19 = icmp sge i32 %p0, 0
  %20 = trunc i64 %14 to i32
  %21 = icmp slt i32 %p0, %20
  %22 = and i1 %19, %21
  %23 = icmp eq i32 %p0, 0
  %24 = icmp eq i32 %20, 0
  %25 = and i1 %23, %24
  %26 = or i1 %22, %25
  %27 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %26, ptr %27)
  %28 = extractvalue %struct.0 %p1, 0
  %29 = getelementptr i16, ptr %28, i32 %p0
  %30 = load i16, ptr %29
  %31 = extractvalue %struct.0 %p2, 2
  %32 = icmp sge i64 %31, -2147483648
  %33 = icmp sle i64 %31, 2147483647
  %34 = and i1 %32, %33
  %35 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %34, ptr %35)
  %36 = icmp sge i32 %p0, 0
  %37 = trunc i64 %31 to i32
  %38 = icmp slt i32 %p0, %37
  %39 = and i1 %36, %38
  %40 = icmp eq i32 %p0, 0
  %41 = icmp eq i32 %37, 0
  %42 = and i1 %40, %41
  %43 = or i1 %39, %42
  %44 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %43, ptr %44)
  %45 = extractvalue %struct.0 %p2, 0
  %46 = getelementptr i16, ptr %45, i32 %p0
  %47 = load i16, ptr %46
  %48 = extractvalue %struct.1 %p3, 0
  %49 = getelementptr i32, ptr %48, i32 %p0
  %50 = icmp slt i16 %30, %47
  %51 = select i1 %50, i32 1, i32 0
  store i32 %51, ptr %49
  ret void

}


; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: LocalNullCheckKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }

define void @LocalNullCheckKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = extractvalue %struct.1 %p1, 2
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
  %15 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %16 = extractvalue %struct.0 %15, 0
  %17 = getelementptr i32, ptr %16, i32 %p0
  %18 = extractvalue %struct.1 %p1, 2
  %19 = icmp sge i64 %18, -2147483648
  %20 = icmp sle i64 %18, 2147483647
  %21 = and i1 %19, %20
  %22 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %23 = icmp sge i32 %p0, 0
  %24 = trunc i64 %18 to i32
  %25 = icmp slt i32 %p0, %24
  %26 = and i1 %23, %25
  %27 = icmp eq i32 %p0, 0
  %28 = icmp eq i32 %24, 0
  %29 = and i1 %27, %28
  %30 = or i1 %26, %29
  %31 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %32 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %33 = extractvalue %struct.0 %32, 0
  %34 = getelementptr i32, ptr %33, i32 %p0
  br label %bb1

bb1:
  %35 = load i32, ptr %17
  store i32 %35, ptr %0
  %36 = load i32, ptr %0
  %37 = icmp sle i32 %36, 15
  br i1 %37, label %bb3, label %bb2

bb2:
  br label %bb3

bb3:
  %38 = phi ptr<i32> addrspace(local) [ null, %bb1 ], [ %0, %bb2 ]
  %39 = icmp eq ptr<i32> addrspace(local) %38, null
  %40 = icmp eq ptr<i32> addrspace(local) %38, null
  br i1 %39, label %bb5, label %bb4

bb4:
  %41 = load i32, ptr %38
  %42 = add i32 %41, 100
  store i32 %42, ptr %38
  br label %bb5

bb5:
  call void @ilgpu.debug.assert(i1 %21, ptr %22)
  call void @ilgpu.debug.assert(i1 %30, ptr %31)
  %43 = load i32, ptr %0
  br i1 %40, label %bb7, label %bb6

bb6:
  br label %bb8

bb7:
  br label %bb8

bb8:
  %44 = phi i32 [ 2, %bb6 ], [ 1, %bb7 ]
  %45 = add i32 %43, %44
  store i32 %45, ptr %34
  ret void

}


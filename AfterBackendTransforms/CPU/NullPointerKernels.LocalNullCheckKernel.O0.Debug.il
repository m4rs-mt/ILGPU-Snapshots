; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: LocalNullCheckKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @LocalNullCheckKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = extractvalue %struct.0 %p1, 1
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
  %17 = extractvalue %struct.0 %p1, 1
  %18 = icmp sge i64 %17, -2147483648
  %19 = icmp sle i64 %17, 2147483647
  %20 = and i1 %18, %19
  %21 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %22 = icmp sge i32 %p0, 0
  %23 = trunc i64 %17 to i32
  %24 = icmp slt i32 %p0, %23
  %25 = and i1 %22, %24
  %26 = icmp eq i32 %p0, 0
  %27 = icmp eq i32 %23, 0
  %28 = and i1 %26, %27
  %29 = or i1 %25, %28
  %30 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %31 = extractvalue %struct.0 %p1, 0
  %32 = getelementptr i32, ptr %31, i32 %p0
  br label %bb1

bb1:
  %33 = load i32, ptr %16
  store i32 %33, ptr %0
  %34 = load i32, ptr %0
  %35 = icmp sle i32 %34, 15
  br i1 %35, label %bb3, label %bb2

bb2:
  br label %bb3

bb3:
  %36 = phi ptr<i32> addrspace(local) [ null, %bb1 ], [ %0, %bb2 ]
  %37 = icmp eq ptr<i32> addrspace(local) %36, null
  %38 = icmp eq ptr<i32> addrspace(local) %36, null
  br i1 %37, label %bb5, label %bb4

bb4:
  %39 = load i32, ptr %36
  %40 = add i32 %39, 100
  store i32 %40, ptr %36
  br label %bb5

bb5:
  call void @ilgpu.debug.assert(i1 %20, ptr %21)
  call void @ilgpu.debug.assert(i1 %29, ptr %30)
  %41 = load i32, ptr %0
  br i1 %38, label %bb7, label %bb6

bb6:
  br label %bb8

bb7:
  br label %bb8

bb8:
  %42 = phi i32 [ 2, %bb6 ], [ 1, %bb7 ]
  %43 = add i32 %41, %42
  store i32 %43, ptr %32
  ret void

}


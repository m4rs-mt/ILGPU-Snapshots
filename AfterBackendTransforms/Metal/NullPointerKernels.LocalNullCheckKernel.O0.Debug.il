; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: LocalNullCheckKernel  [intptr: i64]

define void @LocalNullCheckKernel(i32 %p0, ptr<i32> %p1, i64 %p2, i64 %p3, i8 %p4) {
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
  %15 = icmp sge i64 %p3, -2147483648
  %16 = icmp sle i64 %p3, 2147483647
  %17 = and i1 %15, %16
  %18 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %19 = icmp sge i32 %p0, 0
  %20 = trunc i64 %p3 to i32
  %21 = icmp slt i32 %p0, %20
  %22 = and i1 %19, %21
  %23 = icmp eq i32 %p0, 0
  %24 = icmp eq i32 %20, 0
  %25 = and i1 %23, %24
  %26 = or i1 %22, %25
  %27 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %28 = getelementptr i32, ptr %p1, i32 %p0
  br label %bb1

bb1:
  %29 = load i32, ptr %14
  store i32 %29, ptr %0
  %30 = load i32, ptr %0
  %31 = icmp sle i32 %30, 15
  br i1 %31, label %bb3, label %bb2

bb2:
  br label %bb3

bb3:
  %32 = phi ptr<i32> addrspace(local) [ null, %bb1 ], [ %0, %bb2 ]
  %33 = icmp eq ptr<i32> addrspace(local) %32, null
  %34 = icmp eq ptr<i32> addrspace(local) %32, null
  br i1 %33, label %bb5, label %bb4

bb4:
  %35 = load i32, ptr %32
  %36 = add i32 %35, 100
  store i32 %36, ptr %32
  br label %bb5

bb5:
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  call void @ilgpu.debug.assert(i1 %26, ptr %27)
  %37 = load i32, ptr %0
  br i1 %34, label %bb7, label %bb6

bb6:
  br label %bb8

bb7:
  br label %bb8

bb8:
  %38 = phi i32 [ 2, %bb6 ], [ 1, %bb7 ]
  %39 = add i32 %37, %38
  store i32 %39, ptr %28
  ret void

}


; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: HelperNullCheckKernel  [intptr: i64]

define void @HelperNullCheckKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
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
  %17 = icmp sge i64 %p3, -2147483648
  %18 = icmp sle i64 %p3, 2147483647
  %19 = and i1 %17, %18
  %20 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %19, ptr %20)
  %21 = icmp sge i32 %p0, 0
  %22 = trunc i64 %p3 to i32
  %23 = icmp slt i32 %p0, %22
  %24 = and i1 %21, %23
  %25 = icmp eq i32 %p0, 0
  %26 = icmp eq i32 %22, 0
  %27 = and i1 %25, %26
  %28 = or i1 %24, %27
  %29 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %28, ptr %29)
  %30 = icmp sgt i32 %16, 15
  %31 = bitcast ptr %0 to ptr ; i32 -> void
  %32 = select i1 %30, ptr<void> addrspace(local) %31, ptr<void> addrspace(local) null
  %33 = bitcast ptr %32 to ptr ; void -> i32
  %34 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) %33, i32 -1)
  %35 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) null, i32 1000)
  %36 = icmp eq ptr<i32> addrspace(local) %33, null
  %37 = getelementptr i32, ptr %p1, i32 %p0
  %38 = icmp eq ptr<i32> addrspace(global) %37, null
  %39 = icmp sge i64 %p3, -2147483648
  %40 = icmp sle i64 %p3, 2147483647
  %41 = and i1 %39, %40
  %42 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %43 = icmp sge i32 %p0, 0
  %44 = trunc i64 %p3 to i32
  %45 = icmp slt i32 %p0, %44
  %46 = and i1 %43, %45
  %47 = icmp eq i32 %p0, 0
  %48 = icmp eq i32 %44, 0
  %49 = and i1 %47, %48
  %50 = or i1 %46, %49
  %51 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %52 = getelementptr i32, ptr %p1, i32 %p0
  %53 = add i32 %34, %35
  br i1 %36, label %bb2, label %bb1

bb1:
  %54 = load i32, ptr %33
  br label %bb3

bb2:
  br label %bb3

bb3:
  %55 = phi i32 [ %54, %bb1 ], [ -2, %bb2 ]
  %56 = add i32 %53, %55
  br i1 %38, label %bb5, label %bb4

bb4:
  %57 = load i32, ptr %37
  br label %bb6

bb5:
  br label %bb6

bb6:
  %58 = phi i32 [ %57, %bb4 ], [ 0, %bb5 ]
  call void @ilgpu.debug.assert(i1 %41, ptr %42)
  call void @ilgpu.debug.assert(i1 %50, ptr %51)
  %59 = add i32 %56, %58
  store i32 %59, ptr %52
  ret void

}

define i32 @ReadOrDefault(ptr<i32> addrspace(local) %p0, i32 %p1) {
entry:
  %0 = icmp eq ptr<i32> addrspace(local) %p0, null
  br i1 %0, label %bb2, label %bb1

bb1:
  %1 = load i32, ptr %p0
  br label %bb3

bb2:
  br label %bb3

bb3:
  %2 = phi i32 [ %1, %bb1 ], [ %p1, %bb2 ]
  ret i32 %2

}


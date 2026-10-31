; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: HelperNullCheckKernel  [intptr: i64]

define void @HelperNullCheckKernel(i32 %p0, ptr<i32> %p1, i64 %p2, i64 %p3, i8 %p4) {
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
  %17 = icmp sgt i32 %16, 15
  %18 = bitcast ptr %0 to ptr ; i32 -> void
  %19 = icmp sge i64 %p3, -2147483648
  %20 = icmp sle i64 %p3, 2147483647
  %21 = and i1 %19, %20
  %22 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %23 = icmp sge i32 %p0, 0
  %24 = trunc i64 %p3 to i32
  %25 = icmp slt i32 %p0, %24
  %26 = and i1 %23, %25
  %27 = icmp eq i32 %p0, 0
  %28 = icmp eq i32 %24, 0
  %29 = and i1 %27, %28
  %30 = or i1 %26, %29
  %31 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %32 = getelementptr i32, ptr %p1, i32 %p0
  %33 = icmp eq ptr<i32> %32, null
  %34 = icmp sge i64 %p3, -2147483648
  %35 = icmp sle i64 %p3, 2147483647
  %36 = and i1 %34, %35
  %37 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %38 = icmp sge i32 %p0, 0
  %39 = trunc i64 %p3 to i32
  %40 = icmp slt i32 %p0, %39
  %41 = and i1 %38, %40
  %42 = icmp eq i32 %p0, 0
  %43 = icmp eq i32 %39, 0
  %44 = and i1 %42, %43
  %45 = or i1 %41, %44
  %46 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %47 = getelementptr i32, ptr %p1, i32 %p0
  br i1 %17, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %48 = phi ptr<void> addrspace(local) [ null, %bb1 ], [ %18, %bb2 ]
  call void @ilgpu.debug.assert(i1 %21, ptr %22)
  call void @ilgpu.debug.assert(i1 %30, ptr %31)
  %49 = bitcast ptr %48 to ptr ; void -> i32
  %50 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) %49, i32 -1)
  %51 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) null, i32 1000)
  %52 = icmp eq ptr<i32> addrspace(local) %49, null
  %53 = add i32 %50, %51
  br i1 %52, label %bb5, label %bb4

bb4:
  %54 = load i32, ptr %49
  br label %bb6

bb5:
  br label %bb6

bb6:
  %55 = phi i32 [ %54, %bb4 ], [ -2, %bb5 ]
  %56 = add i32 %53, %55
  br i1 %33, label %bb8, label %bb7

bb7:
  %57 = load i32, ptr %32
  br label %bb9

bb8:
  br label %bb9

bb9:
  %58 = phi i32 [ %57, %bb7 ], [ 0, %bb8 ]
  call void @ilgpu.debug.assert(i1 %36, ptr %37)
  call void @ilgpu.debug.assert(i1 %45, ptr %46)
  %59 = add i32 %56, %58
  store i32 %59, ptr %47
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


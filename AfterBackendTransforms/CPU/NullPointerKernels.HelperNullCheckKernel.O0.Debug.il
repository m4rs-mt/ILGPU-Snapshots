; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: HelperNullCheckKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @HelperNullCheckKernel(i32 %p0, %struct.0 %p1) {
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
  %17 = load i32, ptr %16
  store i32 %17, ptr %0
  %18 = load i32, ptr %0
  %19 = icmp sgt i32 %18, 15
  %20 = bitcast ptr %0 to ptr ; i32 -> void
  %21 = extractvalue %struct.0 %p1, 1
  %22 = icmp sge i64 %21, -2147483648
  %23 = icmp sle i64 %21, 2147483647
  %24 = and i1 %22, %23
  %25 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %26 = icmp sge i32 %p0, 0
  %27 = trunc i64 %21 to i32
  %28 = icmp slt i32 %p0, %27
  %29 = and i1 %26, %28
  %30 = icmp eq i32 %p0, 0
  %31 = icmp eq i32 %27, 0
  %32 = and i1 %30, %31
  %33 = or i1 %29, %32
  %34 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %35 = extractvalue %struct.0 %p1, 0
  %36 = getelementptr i32, ptr %35, i32 %p0
  %37 = icmp eq ptr<i32> %36, null
  %38 = extractvalue %struct.0 %p1, 1
  %39 = icmp sge i64 %38, -2147483648
  %40 = icmp sle i64 %38, 2147483647
  %41 = and i1 %39, %40
  %42 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %43 = icmp sge i32 %p0, 0
  %44 = trunc i64 %38 to i32
  %45 = icmp slt i32 %p0, %44
  %46 = and i1 %43, %45
  %47 = icmp eq i32 %p0, 0
  %48 = icmp eq i32 %44, 0
  %49 = and i1 %47, %48
  %50 = or i1 %46, %49
  %51 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %52 = extractvalue %struct.0 %p1, 0
  %53 = getelementptr i32, ptr %52, i32 %p0
  br i1 %19, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %54 = phi ptr<void> addrspace(local) [ null, %bb1 ], [ %20, %bb2 ]
  call void @ilgpu.debug.assert(i1 %24, ptr %25)
  call void @ilgpu.debug.assert(i1 %33, ptr %34)
  %55 = bitcast ptr %54 to ptr ; void -> i32
  %56 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) %55, i32 -1)
  %57 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) null, i32 1000)
  %58 = icmp eq ptr<i32> addrspace(local) %55, null
  %59 = add i32 %56, %57
  br i1 %58, label %bb5, label %bb4

bb4:
  %60 = load i32, ptr %55
  br label %bb6

bb5:
  br label %bb6

bb6:
  %61 = phi i32 [ %60, %bb4 ], [ -2, %bb5 ]
  %62 = add i32 %59, %61
  br i1 %37, label %bb8, label %bb7

bb7:
  %63 = load i32, ptr %36
  br label %bb9

bb8:
  br label %bb9

bb9:
  %64 = phi i32 [ %63, %bb7 ], [ 0, %bb8 ]
  call void @ilgpu.debug.assert(i1 %41, ptr %42)
  call void @ilgpu.debug.assert(i1 %50, ptr %51)
  %65 = add i32 %62, %64
  store i32 %65, ptr %53
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


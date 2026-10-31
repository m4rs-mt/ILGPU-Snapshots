; stage: AfterBackendTransforms  backend: ROCm  opt: O1
; module: HelperNullCheckKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @HelperNullCheckKernel(i32 %p0, %struct.0 %p1) {
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
  %19 = extractvalue %struct.0 %p1, 2
  %20 = icmp sge i64 %19, -2147483648
  %21 = icmp sle i64 %19, 2147483647
  %22 = and i1 %20, %21
  %23 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %22, ptr %23)
  %24 = icmp sge i32 %p0, 0
  %25 = trunc i64 %19 to i32
  %26 = icmp slt i32 %p0, %25
  %27 = and i1 %24, %26
  %28 = icmp eq i32 %p0, 0
  %29 = icmp eq i32 %25, 0
  %30 = and i1 %28, %29
  %31 = or i1 %27, %30
  %32 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %31, ptr %32)
  %33 = icmp sgt i32 %18, 15
  %34 = bitcast ptr %0 to ptr ; i32 -> void
  %35 = select i1 %33, ptr<void> addrspace(local) %34, ptr<void> addrspace(local) null
  %36 = bitcast ptr %35 to ptr ; void -> i32
  %37 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) %36, i32 -1)
  %38 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) null, i32 1000)
  %39 = icmp eq ptr<i32> addrspace(local) %36, null
  %40 = extractvalue %struct.0 %p1, 0
  %41 = getelementptr i32, ptr %40, i32 %p0
  %42 = icmp eq ptr<i32> addrspace(global) %41, null
  %43 = extractvalue %struct.0 %p1, 2
  %44 = icmp sge i64 %43, -2147483648
  %45 = icmp sle i64 %43, 2147483647
  %46 = and i1 %44, %45
  %47 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %48 = icmp sge i32 %p0, 0
  %49 = trunc i64 %43 to i32
  %50 = icmp slt i32 %p0, %49
  %51 = and i1 %48, %50
  %52 = icmp eq i32 %p0, 0
  %53 = icmp eq i32 %49, 0
  %54 = and i1 %52, %53
  %55 = or i1 %51, %54
  %56 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %57 = extractvalue %struct.0 %p1, 0
  %58 = getelementptr i32, ptr %57, i32 %p0
  %59 = add i32 %37, %38
  br i1 %39, label %bb2, label %bb1

bb1:
  %60 = load i32, ptr %36
  br label %bb3

bb2:
  br label %bb3

bb3:
  %61 = phi i32 [ %60, %bb1 ], [ -2, %bb2 ]
  %62 = add i32 %59, %61
  br i1 %42, label %bb5, label %bb4

bb4:
  %63 = load i32, ptr %41
  br label %bb6

bb5:
  br label %bb6

bb6:
  %64 = phi i32 [ %63, %bb4 ], [ 0, %bb5 ]
  call void @ilgpu.debug.assert(i1 %46, ptr %47)
  call void @ilgpu.debug.assert(i1 %55, ptr %56)
  %65 = add i32 %62, %64
  store i32 %65, ptr %58
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


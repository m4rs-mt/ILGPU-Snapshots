; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: HelperNullCheckKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }

define void @HelperNullCheckKernel(i32 %p0, %struct.1 %p1) {
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
  %18 = load i32, ptr %17
  store i32 %18, ptr %0
  %19 = load i32, ptr %0
  %20 = icmp sgt i32 %19, 15
  %21 = bitcast ptr %0 to ptr ; i32 -> void
  %22 = extractvalue %struct.1 %p1, 2
  %23 = icmp sge i64 %22, -2147483648
  %24 = icmp sle i64 %22, 2147483647
  %25 = and i1 %23, %24
  %26 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %27 = icmp sge i32 %p0, 0
  %28 = trunc i64 %22 to i32
  %29 = icmp slt i32 %p0, %28
  %30 = and i1 %27, %29
  %31 = icmp eq i32 %p0, 0
  %32 = icmp eq i32 %28, 0
  %33 = and i1 %31, %32
  %34 = or i1 %30, %33
  %35 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %36 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %37 = extractvalue %struct.0 %36, 0
  %38 = getelementptr i32, ptr %37, i32 %p0
  %39 = icmp eq ptr<i32> %38, null
  %40 = extractvalue %struct.1 %p1, 2
  %41 = icmp sge i64 %40, -2147483648
  %42 = icmp sle i64 %40, 2147483647
  %43 = and i1 %41, %42
  %44 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %45 = icmp sge i32 %p0, 0
  %46 = trunc i64 %40 to i32
  %47 = icmp slt i32 %p0, %46
  %48 = and i1 %45, %47
  %49 = icmp eq i32 %p0, 0
  %50 = icmp eq i32 %46, 0
  %51 = and i1 %49, %50
  %52 = or i1 %48, %51
  %53 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %54 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %55 = extractvalue %struct.0 %54, 0
  %56 = getelementptr i32, ptr %55, i32 %p0
  br i1 %20, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %57 = phi ptr<void> addrspace(local) [ null, %bb1 ], [ %21, %bb2 ]
  call void @ilgpu.debug.assert(i1 %25, ptr %26)
  call void @ilgpu.debug.assert(i1 %34, ptr %35)
  %58 = bitcast ptr %57 to ptr ; void -> i32
  %59 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) %58, i32 -1)
  %60 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) null, i32 1000)
  %61 = icmp eq ptr<i32> addrspace(local) %58, null
  %62 = add i32 %59, %60
  br i1 %61, label %bb5, label %bb4

bb4:
  %63 = load i32, ptr %58
  br label %bb6

bb5:
  br label %bb6

bb6:
  %64 = phi i32 [ %63, %bb4 ], [ -2, %bb5 ]
  %65 = add i32 %62, %64
  br i1 %39, label %bb8, label %bb7

bb7:
  %66 = load i32, ptr %38
  br label %bb9

bb8:
  br label %bb9

bb9:
  %67 = phi i32 [ %66, %bb7 ], [ 0, %bb8 ]
  call void @ilgpu.debug.assert(i1 %43, ptr %44)
  call void @ilgpu.debug.assert(i1 %52, ptr %53)
  %68 = add i32 %65, %67
  store i32 %68, ptr %56
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


; stage: AfterGlobalOpt  opt: O2
; module: IfChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @IfChainKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = icmp ne i32 %p2, 0
  %1 = extractvalue %struct.0 %p1, 1
  %2 = icmp sge i64 %1, -2147483648
  %3 = icmp sle i64 %1, 2147483647
  %4 = and i1 %2, %3
  %5 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %6 = icmp sge i32 %p0, 0
  %7 = trunc i64 %1 to i32
  %8 = icmp slt i32 %p0, %7
  %9 = and i1 %6, %8
  %10 = icmp eq i32 %p0, 0
  %11 = icmp eq i32 %7, 0
  %12 = and i1 %10, %11
  %13 = or i1 %9, %12
  %14 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %15 = extractvalue %struct.0 %p1, 0
  %16 = getelementptr i32, ptr %15, i32 %p0
  %17 = icmp ne i32 %p2, 1
  %18 = extractvalue %struct.0 %p1, 1
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
  %32 = extractvalue %struct.0 %p1, 0
  %33 = getelementptr i32, ptr %32, i32 %p0
  %34 = icmp ne i32 %p2, 2
  %35 = extractvalue %struct.0 %p1, 1
  %36 = icmp sge i64 %35, -2147483648
  %37 = icmp sle i64 %35, 2147483647
  %38 = and i1 %36, %37
  %39 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %40 = icmp sge i32 %p0, 0
  %41 = trunc i64 %35 to i32
  %42 = icmp slt i32 %p0, %41
  %43 = and i1 %40, %42
  %44 = icmp eq i32 %p0, 0
  %45 = icmp eq i32 %41, 0
  %46 = and i1 %44, %45
  %47 = or i1 %43, %46
  %48 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %49 = extractvalue %struct.0 %p1, 0
  %50 = getelementptr i32, ptr %49, i32 %p0
  %51 = extractvalue %struct.0 %p1, 1
  %52 = icmp sge i64 %51, -2147483648
  %53 = icmp sle i64 %51, 2147483647
  %54 = and i1 %52, %53
  %55 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %56 = icmp sge i32 %p0, 0
  %57 = trunc i64 %51 to i32
  %58 = icmp slt i32 %p0, %57
  %59 = and i1 %56, %58
  %60 = icmp eq i32 %p0, 0
  %61 = icmp eq i32 %57, 0
  %62 = and i1 %60, %61
  %63 = or i1 %59, %62
  %64 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %65 = extractvalue %struct.0 %p1, 0
  %66 = getelementptr i32, ptr %65, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  call void @ilgpu.debug.assert(i1 %13, ptr %14)
  store i32 10, ptr %16
  br label %bb7

bb2:
  br i1 %17, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %21, ptr %22)
  call void @ilgpu.debug.assert(i1 %30, ptr %31)
  store i32 20, ptr %33
  br label %bb7

bb4:
  br i1 %34, label %bb6, label %bb5

bb5:
  call void @ilgpu.debug.assert(i1 %38, ptr %39)
  call void @ilgpu.debug.assert(i1 %47, ptr %48)
  store i32 30, ptr %50
  br label %bb7

bb6:
  call void @ilgpu.debug.assert(i1 %54, ptr %55)
  call void @ilgpu.debug.assert(i1 %63, ptr %64)
  store i32 40, ptr %66
  br label %bb7

bb7:
  ret void

}


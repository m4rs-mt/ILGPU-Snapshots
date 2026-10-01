; stage: AfterGlobalOpt  opt: O1
; module: BytesKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i32, i32 }

define void @BytesKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %1
  %2 = extractvalue %struct.0 %p1, 1
  %3 = icmp sge i64 %2, -2147483648
  %4 = icmp sle i64 %2, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %2 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  %16 = extractvalue %struct.0 %p1, 0
  %17 = getelementptr i32, ptr %16, i32 %p0
  %18 = load i32, ptr %17
  %19 = add i32 %18, 16909056
  store i32 %19, ptr %0
  %20 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 0
  store i32 256, ptr %20
  %21 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 1
  store i32 2, ptr %21
  %22 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 2
  store i32 3, ptr %22
  %23 = extractvalue %struct.0 %p1, 1
  %24 = icmp sge i64 %23, -2147483648
  %25 = icmp sle i64 %23, 2147483647
  %26 = and i1 %24, %25
  %27 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %26, ptr %27)
  %28 = icmp sge i32 %p0, 0
  %29 = trunc i64 %23 to i32
  %30 = icmp slt i32 %p0, %29
  %31 = and i1 %28, %30
  %32 = icmp eq i32 %p0, 0
  %33 = icmp eq i32 %29, 0
  %34 = and i1 %32, %33
  %35 = or i1 %31, %34
  %36 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %35, ptr %36)
  %37 = bitcast ptr %0 to ptr ; i32 -> i8
  %38 = load i8, ptr %37
  %39 = getelementptr i8, ptr %37, i32 1
  %40 = load i8, ptr %39
  %41 = getelementptr i8, ptr %37, i32 2
  %42 = load i8, ptr %41
  %43 = and i32 %p0, 3
  %44 = getelementptr i8, ptr %37, i32 %43
  %45 = load i8, ptr %44
  %46 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 0
  %47 = bitcast ptr %46 to ptr ; i32 -> i8
  %48 = getelementptr i8, ptr %47, i32 1
  %49 = load i8, ptr %48
  %50 = getelementptr i32, ptr %46, i32 1
  %51 = load i32, ptr %50
  %52 = extractvalue %struct.0 %p1, 0
  %53 = getelementptr i32, ptr %52, i32 %p0
  %54 = zext i8 %38 to i32
  %55 = zext i8 %40 to i32
  %56 = mul i32 %55, 10
  %57 = add i32 %54, %56
  %58 = zext i8 %42 to i32
  %59 = mul i32 %58, 100
  %60 = add i32 %57, %59
  %61 = zext i8 %45 to i32
  %62 = mul i32 %61, 1000
  %63 = add i32 %60, %62
  %64 = zext i8 %49 to i32
  %65 = add i32 %64, %51
  %66 = mul i32 %65, 10000
  %67 = add i32 %63, %66
  store i32 %67, ptr %53
  ret void

}


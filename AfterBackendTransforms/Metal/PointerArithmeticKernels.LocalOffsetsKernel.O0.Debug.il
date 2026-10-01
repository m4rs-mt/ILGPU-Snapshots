; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: LocalOffsetsKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32 }

define void @LocalOffsetsKernel(i32 %p0, ptr<i32> %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %0
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
  %16 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  store i32 %15, ptr %16
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
  %30 = getelementptr i32, ptr %p1, i32 %p0
  %31 = load i32, ptr %30
  %32 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 1
  %33 = shl i32 %31, 1
  store i32 %33, ptr %32
  %34 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 2
  store i32 3, ptr %34
  %35 = icmp sge i64 %p3, -2147483648
  %36 = icmp sle i64 %p3, 2147483647
  %37 = and i1 %35, %36
  %38 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %37, ptr %38)
  %39 = icmp sge i32 %p0, 0
  %40 = trunc i64 %p3 to i32
  %41 = icmp slt i32 %p0, %40
  %42 = and i1 %39, %41
  %43 = icmp eq i32 %p0, 0
  %44 = icmp eq i32 %40, 0
  %45 = and i1 %43, %44
  %46 = or i1 %42, %45
  %47 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %46, ptr %47)
  %48 = bitcast ptr %0 to ptr ; %struct.0 -> i8
  %49 = getelementptr i8, ptr %48, i32 4
  %50 = bitcast ptr %49 to ptr ; i8 -> i32
  %51 = load i32, ptr %50
  %52 = bitcast ptr %0 to ptr ; %struct.0 -> i32
  %53 = getelementptr i32, ptr %52, i32 2
  %54 = load i32, ptr %53
  %55 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %56 = getelementptr i32, ptr %55, i32 1
  %57 = load i32, ptr %56
  %58 = getelementptr i32, ptr %55, i32 2
  %59 = load i32, ptr %58
  %60 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %61 = getelementptr i32, ptr %60, i32 2
  %62 = load i32, ptr %61
  %63 = getelementptr i32, ptr %p1, i32 %p0
  %64 = add i32 %51, %54
  %65 = add i32 %64, %57
  %66 = add i32 %65, %59
  %67 = add i32 %66, %62
  store i32 %67, ptr %63
  ret void

}


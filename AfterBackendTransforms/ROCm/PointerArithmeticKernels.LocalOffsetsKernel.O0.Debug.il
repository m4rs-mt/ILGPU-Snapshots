; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: LocalOffsetsKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }
%struct.2 = type { i32, i32, i32 }

define void @LocalOffsetsKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = alloca %struct.2, i32 1
  store %struct.2 null, ptr %0
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
  %19 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 0
  store i32 %18, ptr %19
  %20 = extractvalue %struct.1 %p1, 2
  %21 = icmp sge i64 %20, -2147483648
  %22 = icmp sle i64 %20, 2147483647
  %23 = and i1 %21, %22
  %24 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %23, ptr %24)
  %25 = icmp sge i32 %p0, 0
  %26 = trunc i64 %20 to i32
  %27 = icmp slt i32 %p0, %26
  %28 = and i1 %25, %27
  %29 = icmp eq i32 %p0, 0
  %30 = icmp eq i32 %26, 0
  %31 = and i1 %29, %30
  %32 = or i1 %28, %31
  %33 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %32, ptr %33)
  %34 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %35 = extractvalue %struct.0 %34, 0
  %36 = getelementptr i32, ptr %35, i32 %p0
  %37 = load i32, ptr %36
  %38 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 1
  %39 = shl i32 %37, 1
  store i32 %39, ptr %38
  %40 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 2
  store i32 3, ptr %40
  %41 = extractvalue %struct.1 %p1, 2
  %42 = icmp sge i64 %41, -2147483648
  %43 = icmp sle i64 %41, 2147483647
  %44 = and i1 %42, %43
  %45 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %44, ptr %45)
  %46 = icmp sge i32 %p0, 0
  %47 = trunc i64 %41 to i32
  %48 = icmp slt i32 %p0, %47
  %49 = and i1 %46, %48
  %50 = icmp eq i32 %p0, 0
  %51 = icmp eq i32 %47, 0
  %52 = and i1 %50, %51
  %53 = or i1 %49, %52
  %54 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %53, ptr %54)
  %55 = bitcast ptr %0 to ptr ; %struct.2 -> i8
  %56 = getelementptr i8, ptr %55, i32 4
  %57 = bitcast ptr %56 to ptr ; i8 -> i32
  %58 = load i32, ptr %57
  %59 = bitcast ptr %0 to ptr ; %struct.2 -> i32
  %60 = getelementptr i32, ptr %59, i32 2
  %61 = load i32, ptr %60
  %62 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 0
  %63 = getelementptr i32, ptr %62, i32 1
  %64 = load i32, ptr %63
  %65 = getelementptr i32, ptr %62, i32 2
  %66 = load i32, ptr %65
  %67 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 0
  %68 = getelementptr i32, ptr %67, i32 2
  %69 = load i32, ptr %68
  %70 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %71 = extractvalue %struct.0 %70, 0
  %72 = getelementptr i32, ptr %71, i32 %p0
  %73 = add i32 %58, %61
  %74 = add i32 %73, %64
  %75 = add i32 %74, %66
  %76 = add i32 %75, %69
  store i32 %76, ptr %72
  ret void

}


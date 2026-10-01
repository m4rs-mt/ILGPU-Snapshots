; stage: AfterBackendTransforms  backend: ROCm  opt: O2
; module: LocalOffsetsKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.1 = type { i32, i32, i32 }

define void @LocalOffsetsKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
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
  %18 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  store i32 %17, ptr %18
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
  %33 = extractvalue %struct.0 %p1, 0
  %34 = getelementptr i32, ptr %33, i32 %p0
  %35 = load i32, ptr %34
  %36 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %37 = shl i32 %35, 1
  store i32 %37, ptr %36
  %38 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 2
  store i32 3, ptr %38
  %39 = extractvalue %struct.0 %p1, 2
  %40 = icmp sge i64 %39, -2147483648
  %41 = icmp sle i64 %39, 2147483647
  %42 = and i1 %40, %41
  %43 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %42, ptr %43)
  %44 = icmp sge i32 %p0, 0
  %45 = trunc i64 %39 to i32
  %46 = icmp slt i32 %p0, %45
  %47 = and i1 %44, %46
  %48 = icmp eq i32 %p0, 0
  %49 = icmp eq i32 %45, 0
  %50 = and i1 %48, %49
  %51 = or i1 %47, %50
  %52 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %51, ptr %52)
  %53 = bitcast ptr %0 to ptr ; %struct.1 -> i8
  %54 = getelementptr i8, ptr %53, i32 4
  %55 = bitcast ptr %54 to ptr ; i8 -> i32
  %56 = load i32, ptr %55
  %57 = bitcast ptr %0 to ptr ; %struct.1 -> i32
  %58 = getelementptr i32, ptr %57, i32 2
  %59 = load i32, ptr %58
  %60 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %61 = getelementptr i32, ptr %60, i32 1
  %62 = load i32, ptr %61
  %63 = getelementptr i32, ptr %60, i32 2
  %64 = load i32, ptr %63
  %65 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %66 = getelementptr i32, ptr %65, i32 2
  %67 = load i32, ptr %66
  %68 = extractvalue %struct.0 %p1, 0
  %69 = getelementptr i32, ptr %68, i32 %p0
  %70 = add i32 %56, %59
  %71 = add i32 %70, %62
  %72 = add i32 %71, %64
  %73 = add i32 %72, %67
  store i32 %73, ptr %69
  ret void

}


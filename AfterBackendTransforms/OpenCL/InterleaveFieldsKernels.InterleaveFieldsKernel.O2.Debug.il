; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: InterleaveFieldsKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32, i32 }
%struct.1 = type { i32, i32, i32, i32, i32, i32, i32, i32 }

define void @InterleaveFieldsKernel(i32 %p0, ptr<%struct.1> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = icmp sge i64 %p3, -2147483648
  %1 = icmp sle i64 %p3, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  %4 = icmp sge i32 %p0, 0
  %5 = trunc i64 %p3 to i32
  %6 = icmp slt i32 %p0, %5
  %7 = and i1 %4, %6
  %8 = icmp eq i32 %p0, 0
  %9 = icmp eq i32 %5, 0
  %10 = and i1 %8, %9
  %11 = or i1 %7, %10
  %12 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  %13 = getelementptr %struct.1, ptr %p1, i32 %p0
  %14 = getelementptr inbounds %struct.1, ptr %13, i32 0, i32 0
  %15 = bitcast ptr %14 to ptr ; %struct.0 -> i32
  store i32 %p0, ptr %15
  %16 = icmp sge i64 %p3, -2147483648
  %17 = icmp sle i64 %p3, 2147483647
  %18 = and i1 %16, %17
  %19 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %18, ptr %19)
  %20 = icmp sge i32 %p0, 0
  %21 = trunc i64 %p3 to i32
  %22 = icmp slt i32 %p0, %21
  %23 = and i1 %20, %22
  %24 = icmp eq i32 %p0, 0
  %25 = icmp eq i32 %21, 0
  %26 = and i1 %24, %25
  %27 = or i1 %23, %26
  %28 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %27, ptr %28)
  %29 = getelementptr %struct.1, ptr %p1, i32 %p0
  %30 = getelementptr inbounds %struct.1, ptr %29, i32 0, i32 0
  %31 = bitcast ptr %30 to ptr ; %struct.0 -> i32
  %32 = getelementptr i32, ptr %31, i32 1
  %33 = add i32 %p0, 1
  store i32 %33, ptr %32
  %34 = icmp sge i64 %p3, -2147483648
  %35 = icmp sle i64 %p3, 2147483647
  %36 = and i1 %34, %35
  %37 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %36, ptr %37)
  %38 = icmp sge i32 %p0, 0
  %39 = trunc i64 %p3 to i32
  %40 = icmp slt i32 %p0, %39
  %41 = and i1 %38, %40
  %42 = icmp eq i32 %p0, 0
  %43 = icmp eq i32 %39, 0
  %44 = and i1 %42, %43
  %45 = or i1 %41, %44
  %46 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %45, ptr %46)
  %47 = getelementptr %struct.1, ptr %p1, i32 %p0
  %48 = getelementptr inbounds %struct.1, ptr %47, i32 0, i32 0
  %49 = bitcast ptr %48 to ptr ; %struct.0 -> i32
  %50 = getelementptr i32, ptr %49, i32 2
  %51 = add i32 %p0, 2
  store i32 %51, ptr %50
  %52 = icmp sge i64 %p3, -2147483648
  %53 = icmp sle i64 %p3, 2147483647
  %54 = and i1 %52, %53
  %55 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %54, ptr %55)
  %56 = icmp sge i32 %p0, 0
  %57 = trunc i64 %p3 to i32
  %58 = icmp slt i32 %p0, %57
  %59 = and i1 %56, %58
  %60 = icmp eq i32 %p0, 0
  %61 = icmp eq i32 %57, 0
  %62 = and i1 %60, %61
  %63 = or i1 %59, %62
  %64 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %63, ptr %64)
  %65 = getelementptr %struct.1, ptr %p1, i32 %p0
  %66 = getelementptr inbounds %struct.1, ptr %65, i32 0, i32 0
  %67 = bitcast ptr %66 to ptr ; %struct.0 -> i32
  %68 = getelementptr i32, ptr %67, i32 3
  %69 = add i32 %p0, 3
  store i32 %69, ptr %68
  %70 = icmp sge i64 %p3, -2147483648
  %71 = icmp sle i64 %p3, 2147483647
  %72 = and i1 %70, %71
  %73 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %72, ptr %73)
  %74 = icmp sge i32 %p0, 0
  %75 = trunc i64 %p3 to i32
  %76 = icmp slt i32 %p0, %75
  %77 = and i1 %74, %76
  %78 = icmp eq i32 %p0, 0
  %79 = icmp eq i32 %75, 0
  %80 = and i1 %78, %79
  %81 = or i1 %77, %80
  %82 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %81, ptr %82)
  %83 = getelementptr %struct.1, ptr %p1, i32 %p0
  %84 = getelementptr inbounds %struct.1, ptr %83, i32 0, i32 4
  %85 = bitcast ptr %84 to ptr ; %struct.0 -> i32
  %86 = add i32 %p0, 4
  store i32 %86, ptr %85
  %87 = icmp sge i64 %p3, -2147483648
  %88 = icmp sle i64 %p3, 2147483647
  %89 = and i1 %87, %88
  %90 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %89, ptr %90)
  %91 = icmp sge i32 %p0, 0
  %92 = trunc i64 %p3 to i32
  %93 = icmp slt i32 %p0, %92
  %94 = and i1 %91, %93
  %95 = icmp eq i32 %p0, 0
  %96 = icmp eq i32 %92, 0
  %97 = and i1 %95, %96
  %98 = or i1 %94, %97
  %99 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %98, ptr %99)
  %100 = getelementptr %struct.1, ptr %p1, i32 %p0
  %101 = getelementptr inbounds %struct.1, ptr %100, i32 0, i32 4
  %102 = bitcast ptr %101 to ptr ; %struct.0 -> i32
  %103 = getelementptr i32, ptr %102, i32 1
  %104 = add i32 %p0, 5
  store i32 %104, ptr %103
  %105 = icmp sge i64 %p3, -2147483648
  %106 = icmp sle i64 %p3, 2147483647
  %107 = and i1 %105, %106
  %108 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %107, ptr %108)
  %109 = icmp sge i32 %p0, 0
  %110 = trunc i64 %p3 to i32
  %111 = icmp slt i32 %p0, %110
  %112 = and i1 %109, %111
  %113 = icmp eq i32 %p0, 0
  %114 = icmp eq i32 %110, 0
  %115 = and i1 %113, %114
  %116 = or i1 %112, %115
  %117 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %116, ptr %117)
  %118 = getelementptr %struct.1, ptr %p1, i32 %p0
  %119 = getelementptr inbounds %struct.1, ptr %118, i32 0, i32 4
  %120 = bitcast ptr %119 to ptr ; %struct.0 -> i32
  %121 = getelementptr i32, ptr %120, i32 2
  %122 = add i32 %p0, 6
  store i32 %122, ptr %121
  %123 = icmp sge i64 %p3, -2147483648
  %124 = icmp sle i64 %p3, 2147483647
  %125 = and i1 %123, %124
  %126 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %125, ptr %126)
  %127 = icmp sge i32 %p0, 0
  %128 = trunc i64 %p3 to i32
  %129 = icmp slt i32 %p0, %128
  %130 = and i1 %127, %129
  %131 = icmp eq i32 %p0, 0
  %132 = icmp eq i32 %128, 0
  %133 = and i1 %131, %132
  %134 = or i1 %130, %133
  %135 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %134, ptr %135)
  %136 = getelementptr %struct.1, ptr %p1, i32 %p0
  %137 = getelementptr inbounds %struct.1, ptr %136, i32 0, i32 4
  %138 = bitcast ptr %137 to ptr ; %struct.0 -> i32
  %139 = getelementptr i32, ptr %138, i32 3
  %140 = add i32 %p0, 7
  store i32 %140, ptr %139
  ret void

}


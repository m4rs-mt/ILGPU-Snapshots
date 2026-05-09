; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: InterleaveFieldsKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32, i32 }
%struct.1 = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.2 = type { ptr<%struct.1> addrspace(global), i64 }
%struct.3 = type { ptr<%struct.1> addrspace(global), i64, i64, i8 }

define void @InterleaveFieldsKernel(i32 %p0, %struct.3 %p1) {
entry:
  %0 = extractvalue %struct.3 %p1, 2
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = icmp sge i32 %p0, 0
  %6 = trunc i64 %0 to i32
  %7 = icmp slt i32 %p0, %6
  %8 = and i1 %5, %7
  %9 = icmp eq i32 %p0, 0
  %10 = icmp eq i32 %6, 0
  %11 = and i1 %9, %10
  %12 = or i1 %8, %11
  %13 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  %14 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %15 = extractvalue %struct.2 %14, 0
  %16 = getelementptr %struct.1, ptr %15, i32 %p0
  %17 = getelementptr inbounds %struct.1, ptr %16, i32 0, i32 0
  %18 = bitcast ptr %17 to ptr ; %struct.0 -> i32
  store i32 %p0, ptr %18
  %19 = extractvalue %struct.3 %p1, 2
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
  %33 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %34 = extractvalue %struct.2 %33, 0
  %35 = getelementptr %struct.1, ptr %34, i32 %p0
  %36 = getelementptr inbounds %struct.1, ptr %35, i32 0, i32 0
  %37 = bitcast ptr %36 to ptr ; %struct.0 -> i32
  %38 = getelementptr i32, ptr %37, i32 1
  %39 = add i32 %p0, 1
  store i32 %39, ptr %38
  %40 = extractvalue %struct.3 %p1, 2
  %41 = icmp sge i64 %40, -2147483648
  %42 = icmp sle i64 %40, 2147483647
  %43 = and i1 %41, %42
  %44 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %43, ptr %44)
  %45 = icmp sge i32 %p0, 0
  %46 = trunc i64 %40 to i32
  %47 = icmp slt i32 %p0, %46
  %48 = and i1 %45, %47
  %49 = icmp eq i32 %p0, 0
  %50 = icmp eq i32 %46, 0
  %51 = and i1 %49, %50
  %52 = or i1 %48, %51
  %53 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %52, ptr %53)
  %54 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %55 = extractvalue %struct.2 %54, 0
  %56 = getelementptr %struct.1, ptr %55, i32 %p0
  %57 = getelementptr inbounds %struct.1, ptr %56, i32 0, i32 0
  %58 = bitcast ptr %57 to ptr ; %struct.0 -> i32
  %59 = getelementptr i32, ptr %58, i32 2
  %60 = add i32 %p0, 2
  store i32 %60, ptr %59
  %61 = extractvalue %struct.3 %p1, 2
  %62 = icmp sge i64 %61, -2147483648
  %63 = icmp sle i64 %61, 2147483647
  %64 = and i1 %62, %63
  %65 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %64, ptr %65)
  %66 = icmp sge i32 %p0, 0
  %67 = trunc i64 %61 to i32
  %68 = icmp slt i32 %p0, %67
  %69 = and i1 %66, %68
  %70 = icmp eq i32 %p0, 0
  %71 = icmp eq i32 %67, 0
  %72 = and i1 %70, %71
  %73 = or i1 %69, %72
  %74 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %73, ptr %74)
  %75 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %76 = extractvalue %struct.2 %75, 0
  %77 = getelementptr %struct.1, ptr %76, i32 %p0
  %78 = getelementptr inbounds %struct.1, ptr %77, i32 0, i32 0
  %79 = bitcast ptr %78 to ptr ; %struct.0 -> i32
  %80 = getelementptr i32, ptr %79, i32 3
  %81 = add i32 %p0, 3
  store i32 %81, ptr %80
  %82 = extractvalue %struct.3 %p1, 2
  %83 = icmp sge i64 %82, -2147483648
  %84 = icmp sle i64 %82, 2147483647
  %85 = and i1 %83, %84
  %86 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %85, ptr %86)
  %87 = icmp sge i32 %p0, 0
  %88 = trunc i64 %82 to i32
  %89 = icmp slt i32 %p0, %88
  %90 = and i1 %87, %89
  %91 = icmp eq i32 %p0, 0
  %92 = icmp eq i32 %88, 0
  %93 = and i1 %91, %92
  %94 = or i1 %90, %93
  %95 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %94, ptr %95)
  %96 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %97 = extractvalue %struct.2 %96, 0
  %98 = getelementptr %struct.1, ptr %97, i32 %p0
  %99 = getelementptr inbounds %struct.1, ptr %98, i32 0, i32 4
  %100 = bitcast ptr %99 to ptr ; %struct.0 -> i32
  %101 = add i32 %p0, 4
  store i32 %101, ptr %100
  %102 = extractvalue %struct.3 %p1, 2
  %103 = icmp sge i64 %102, -2147483648
  %104 = icmp sle i64 %102, 2147483647
  %105 = and i1 %103, %104
  %106 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %105, ptr %106)
  %107 = icmp sge i32 %p0, 0
  %108 = trunc i64 %102 to i32
  %109 = icmp slt i32 %p0, %108
  %110 = and i1 %107, %109
  %111 = icmp eq i32 %p0, 0
  %112 = icmp eq i32 %108, 0
  %113 = and i1 %111, %112
  %114 = or i1 %110, %113
  %115 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %114, ptr %115)
  %116 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %117 = extractvalue %struct.2 %116, 0
  %118 = getelementptr %struct.1, ptr %117, i32 %p0
  %119 = getelementptr inbounds %struct.1, ptr %118, i32 0, i32 4
  %120 = bitcast ptr %119 to ptr ; %struct.0 -> i32
  %121 = getelementptr i32, ptr %120, i32 1
  %122 = add i32 %p0, 5
  store i32 %122, ptr %121
  %123 = extractvalue %struct.3 %p1, 2
  %124 = icmp sge i64 %123, -2147483648
  %125 = icmp sle i64 %123, 2147483647
  %126 = and i1 %124, %125
  %127 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %126, ptr %127)
  %128 = icmp sge i32 %p0, 0
  %129 = trunc i64 %123 to i32
  %130 = icmp slt i32 %p0, %129
  %131 = and i1 %128, %130
  %132 = icmp eq i32 %p0, 0
  %133 = icmp eq i32 %129, 0
  %134 = and i1 %132, %133
  %135 = or i1 %131, %134
  %136 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %135, ptr %136)
  %137 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %138 = extractvalue %struct.2 %137, 0
  %139 = getelementptr %struct.1, ptr %138, i32 %p0
  %140 = getelementptr inbounds %struct.1, ptr %139, i32 0, i32 4
  %141 = bitcast ptr %140 to ptr ; %struct.0 -> i32
  %142 = getelementptr i32, ptr %141, i32 2
  %143 = add i32 %p0, 6
  store i32 %143, ptr %142
  %144 = extractvalue %struct.3 %p1, 2
  %145 = icmp sge i64 %144, -2147483648
  %146 = icmp sle i64 %144, 2147483647
  %147 = and i1 %145, %146
  %148 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %147, ptr %148)
  %149 = icmp sge i32 %p0, 0
  %150 = trunc i64 %144 to i32
  %151 = icmp slt i32 %p0, %150
  %152 = and i1 %149, %151
  %153 = icmp eq i32 %p0, 0
  %154 = icmp eq i32 %150, 0
  %155 = and i1 %153, %154
  %156 = or i1 %152, %155
  %157 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %156, ptr %157)
  %158 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %159 = extractvalue %struct.2 %158, 0
  %160 = getelementptr %struct.1, ptr %159, i32 %p0
  %161 = getelementptr inbounds %struct.1, ptr %160, i32 0, i32 4
  %162 = bitcast ptr %161 to ptr ; %struct.0 -> i32
  %163 = getelementptr i32, ptr %162, i32 3
  %164 = add i32 %p0, 7
  store i32 %164, ptr %163
  ret void

}


; stage: AfterBackendTransforms  backend: Cuda  opt: O1
; module: InterleaveFieldsKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32, i32 }
%struct.1 = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.2 = type { ptr<%struct.1> addrspace(global), i64, i64, i8 }

define void @InterleaveFieldsKernel(i32 %p0, %struct.2 %p1) {
entry:
  %0 = extractvalue %struct.2 %p1, 2
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
  %14 = extractvalue %struct.2 %p1, 0
  %15 = getelementptr %struct.1, ptr %14, i32 %p0
  %16 = getelementptr inbounds %struct.1, ptr %15, i32 0, i32 0
  %17 = bitcast ptr %16 to ptr ; %struct.0 -> i32
  store i32 %p0, ptr %17
  %18 = extractvalue %struct.2 %p1, 2
  %19 = icmp sge i64 %18, -2147483648
  %20 = icmp sle i64 %18, 2147483647
  %21 = and i1 %19, %20
  %22 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %21, ptr %22)
  %23 = icmp sge i32 %p0, 0
  %24 = trunc i64 %18 to i32
  %25 = icmp slt i32 %p0, %24
  %26 = and i1 %23, %25
  %27 = icmp eq i32 %p0, 0
  %28 = icmp eq i32 %24, 0
  %29 = and i1 %27, %28
  %30 = or i1 %26, %29
  %31 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %30, ptr %31)
  %32 = extractvalue %struct.2 %p1, 0
  %33 = getelementptr %struct.1, ptr %32, i32 %p0
  %34 = getelementptr inbounds %struct.1, ptr %33, i32 0, i32 0
  %35 = bitcast ptr %34 to ptr ; %struct.0 -> i32
  %36 = getelementptr i32, ptr %35, i32 1
  %37 = add i32 %p0, 1
  store i32 %37, ptr %36
  %38 = extractvalue %struct.2 %p1, 2
  %39 = icmp sge i64 %38, -2147483648
  %40 = icmp sle i64 %38, 2147483647
  %41 = and i1 %39, %40
  %42 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %41, ptr %42)
  %43 = icmp sge i32 %p0, 0
  %44 = trunc i64 %38 to i32
  %45 = icmp slt i32 %p0, %44
  %46 = and i1 %43, %45
  %47 = icmp eq i32 %p0, 0
  %48 = icmp eq i32 %44, 0
  %49 = and i1 %47, %48
  %50 = or i1 %46, %49
  %51 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %50, ptr %51)
  %52 = extractvalue %struct.2 %p1, 0
  %53 = getelementptr %struct.1, ptr %52, i32 %p0
  %54 = getelementptr inbounds %struct.1, ptr %53, i32 0, i32 0
  %55 = bitcast ptr %54 to ptr ; %struct.0 -> i32
  %56 = getelementptr i32, ptr %55, i32 2
  %57 = add i32 %p0, 2
  store i32 %57, ptr %56
  %58 = extractvalue %struct.2 %p1, 2
  %59 = icmp sge i64 %58, -2147483648
  %60 = icmp sle i64 %58, 2147483647
  %61 = and i1 %59, %60
  %62 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %61, ptr %62)
  %63 = icmp sge i32 %p0, 0
  %64 = trunc i64 %58 to i32
  %65 = icmp slt i32 %p0, %64
  %66 = and i1 %63, %65
  %67 = icmp eq i32 %p0, 0
  %68 = icmp eq i32 %64, 0
  %69 = and i1 %67, %68
  %70 = or i1 %66, %69
  %71 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %70, ptr %71)
  %72 = extractvalue %struct.2 %p1, 0
  %73 = getelementptr %struct.1, ptr %72, i32 %p0
  %74 = getelementptr inbounds %struct.1, ptr %73, i32 0, i32 0
  %75 = bitcast ptr %74 to ptr ; %struct.0 -> i32
  %76 = getelementptr i32, ptr %75, i32 3
  %77 = add i32 %p0, 3
  store i32 %77, ptr %76
  %78 = extractvalue %struct.2 %p1, 2
  %79 = icmp sge i64 %78, -2147483648
  %80 = icmp sle i64 %78, 2147483647
  %81 = and i1 %79, %80
  %82 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %81, ptr %82)
  %83 = icmp sge i32 %p0, 0
  %84 = trunc i64 %78 to i32
  %85 = icmp slt i32 %p0, %84
  %86 = and i1 %83, %85
  %87 = icmp eq i32 %p0, 0
  %88 = icmp eq i32 %84, 0
  %89 = and i1 %87, %88
  %90 = or i1 %86, %89
  %91 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %90, ptr %91)
  %92 = extractvalue %struct.2 %p1, 0
  %93 = getelementptr %struct.1, ptr %92, i32 %p0
  %94 = getelementptr inbounds %struct.1, ptr %93, i32 0, i32 4
  %95 = bitcast ptr %94 to ptr ; %struct.0 -> i32
  %96 = add i32 %p0, 4
  store i32 %96, ptr %95
  %97 = extractvalue %struct.2 %p1, 2
  %98 = icmp sge i64 %97, -2147483648
  %99 = icmp sle i64 %97, 2147483647
  %100 = and i1 %98, %99
  %101 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %100, ptr %101)
  %102 = icmp sge i32 %p0, 0
  %103 = trunc i64 %97 to i32
  %104 = icmp slt i32 %p0, %103
  %105 = and i1 %102, %104
  %106 = icmp eq i32 %p0, 0
  %107 = icmp eq i32 %103, 0
  %108 = and i1 %106, %107
  %109 = or i1 %105, %108
  %110 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %109, ptr %110)
  %111 = extractvalue %struct.2 %p1, 0
  %112 = getelementptr %struct.1, ptr %111, i32 %p0
  %113 = getelementptr inbounds %struct.1, ptr %112, i32 0, i32 4
  %114 = bitcast ptr %113 to ptr ; %struct.0 -> i32
  %115 = getelementptr i32, ptr %114, i32 1
  %116 = add i32 %p0, 5
  store i32 %116, ptr %115
  %117 = extractvalue %struct.2 %p1, 2
  %118 = icmp sge i64 %117, -2147483648
  %119 = icmp sle i64 %117, 2147483647
  %120 = and i1 %118, %119
  %121 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %120, ptr %121)
  %122 = icmp sge i32 %p0, 0
  %123 = trunc i64 %117 to i32
  %124 = icmp slt i32 %p0, %123
  %125 = and i1 %122, %124
  %126 = icmp eq i32 %p0, 0
  %127 = icmp eq i32 %123, 0
  %128 = and i1 %126, %127
  %129 = or i1 %125, %128
  %130 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %129, ptr %130)
  %131 = extractvalue %struct.2 %p1, 0
  %132 = getelementptr %struct.1, ptr %131, i32 %p0
  %133 = getelementptr inbounds %struct.1, ptr %132, i32 0, i32 4
  %134 = bitcast ptr %133 to ptr ; %struct.0 -> i32
  %135 = getelementptr i32, ptr %134, i32 2
  %136 = add i32 %p0, 6
  store i32 %136, ptr %135
  %137 = extractvalue %struct.2 %p1, 2
  %138 = icmp sge i64 %137, -2147483648
  %139 = icmp sle i64 %137, 2147483647
  %140 = and i1 %138, %139
  %141 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %140, ptr %141)
  %142 = icmp sge i32 %p0, 0
  %143 = trunc i64 %137 to i32
  %144 = icmp slt i32 %p0, %143
  %145 = and i1 %142, %144
  %146 = icmp eq i32 %p0, 0
  %147 = icmp eq i32 %143, 0
  %148 = and i1 %146, %147
  %149 = or i1 %145, %148
  %150 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %149, ptr %150)
  %151 = extractvalue %struct.2 %p1, 0
  %152 = getelementptr %struct.1, ptr %151, i32 %p0
  %153 = getelementptr inbounds %struct.1, ptr %152, i32 0, i32 4
  %154 = bitcast ptr %153 to ptr ; %struct.0 -> i32
  %155 = getelementptr i32, ptr %154, i32 3
  %156 = add i32 %p0, 7
  store i32 %156, ptr %155
  ret void

}


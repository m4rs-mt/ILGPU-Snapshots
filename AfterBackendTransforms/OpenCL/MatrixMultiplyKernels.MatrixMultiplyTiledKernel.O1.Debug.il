; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: MatrixMultiplyTiledKernel  [intptr: i64]

%struct.0 = type { i64, i32 }

@g0 = internal global float zeroinitializer ; shared
@g1 = internal global float zeroinitializer ; shared

define void @MatrixMultiplyTiledKernel(%struct.0 %p0, i32 %p1, ptr<float> addrspace(global) %p2, i64 %p3, i64 %p4, i64 %p5, i32 %p6, ptr<float> addrspace(global) %p7, i64 %p8, i64 %p9, i64 %p10, i32 %p11, ptr<float> addrspace(global) %p12, i64 %p13, i64 %p14, i64 %p15, i32 %p16) {
entry:
  %0 = icmp sge i64 %p4, -2147483648
  %1 = icmp sle i64 %p4, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %4 = icmp sge i64 %p5, -2147483648
  %5 = icmp sle i64 %p5, 2147483647
  %6 = and i1 %4, %5
  %7 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %8 = trunc i64 %p5 to i32
  %9 = icmp sge i64 %p14, -2147483648
  %10 = icmp sle i64 %p14, 2147483647
  %11 = and i1 %9, %10
  %12 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %13 = icmp sge i64 %p15, -2147483648
  %14 = icmp sle i64 %p15, 2147483647
  %15 = and i1 %13, %14
  %16 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %17 = extractvalue %struct.0 %p0, 0
  %18 = sext i32 %p1 to i64
  %19 = sdiv i64 %17, %18
  %20 = trunc i64 %19 to i32
  %21 = shl i32 %20, 1
  %22 = extractvalue %struct.0 %p0, 1
  %23 = ashr i32 %22, 1
  %24 = add i32 %21, %23
  %25 = trunc i64 %p14 to i32
  %26 = icmp sge i32 %24, %25
  %27 = icmp sge i64 %p14, -2147483648
  %28 = icmp sle i64 %p14, 2147483647
  %29 = and i1 %27, %28
  %30 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %31 = icmp sge i64 %p15, -2147483648
  %32 = icmp sle i64 %p15, 2147483647
  %33 = and i1 %31, %32
  %34 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %35 = extractvalue %struct.0 %p0, 0
  %36 = sext i32 %p1 to i64
  %37 = srem i64 %35, %36
  %38 = trunc i64 %37 to i32
  %39 = shl i32 %38, 1
  %40 = extractvalue %struct.0 %p0, 1
  %41 = srem i32 %40, 2
  %42 = add i32 %39, %41
  %43 = trunc i64 %p15 to i32
  %44 = icmp slt i32 %42, %43
  %45 = icmp sge i64 %p14, -2147483648
  %46 = icmp sle i64 %p14, 2147483647
  %47 = and i1 %45, %46
  %48 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %49 = icmp sge i64 %p15, -2147483648
  %50 = icmp sle i64 %p15, 2147483647
  %51 = and i1 %49, %50
  %52 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %53 = icmp sge i32 %24, 0
  %54 = trunc i64 %p14 to i32
  %55 = icmp slt i32 %24, %54
  %56 = and i1 %53, %55
  %57 = icmp eq i32 %24, 0
  %58 = icmp eq i32 %54, 0
  %59 = and i1 %57, %58
  %60 = or i1 %56, %59
  %61 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %62 = icmp sge i32 %42, 0
  %63 = trunc i64 %p15 to i32
  %64 = icmp slt i32 %42, %63
  %65 = and i1 %62, %64
  %66 = icmp eq i32 %42, 0
  %67 = icmp eq i32 %63, 0
  %68 = and i1 %66, %67
  %69 = or i1 %65, %68
  %70 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %71 = mul i32 %42, %p16
  %72 = add i32 %24, %71
  %73 = getelementptr float, ptr %p12, i32 %72
  %74 = icmp sge i32 %23, 0
  %75 = icmp slt i32 %23, 2
  %76 = and i1 %74, %75
  %77 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %78 = icmp sge i32 %41, 0
  %79 = icmp slt i32 %41, 2
  %80 = and i1 %78, %79
  %81 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %82 = icmp sge i64 %p4, -2147483648
  %83 = icmp sle i64 %p4, 2147483647
  %84 = and i1 %82, %83
  %85 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %86 = icmp sge i64 %p5, -2147483648
  %87 = icmp sle i64 %p5, 2147483647
  %88 = and i1 %86, %87
  %89 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %90 = icmp sge i32 %24, 0
  %91 = trunc i64 %p4 to i32
  %92 = icmp slt i32 %24, %91
  %93 = and i1 %90, %92
  %94 = icmp eq i32 %24, 0
  %95 = icmp eq i32 %91, 0
  %96 = and i1 %94, %95
  %97 = or i1 %93, %96
  %98 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %99 = trunc i64 %p5 to i32
  %100 = icmp eq i32 %99, 0
  %101 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %102 = shl i32 %41, 1
  %103 = add i32 %23, %102
  %104 = getelementptr float, ptr @g0, i32 %103
  %105 = icmp sge i32 %23, 0
  %106 = icmp slt i32 %23, 2
  %107 = and i1 %105, %106
  %108 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %109 = icmp sge i32 %41, 0
  %110 = icmp slt i32 %41, 2
  %111 = and i1 %109, %110
  %112 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %113 = icmp sge i64 %p9, -2147483648
  %114 = icmp sle i64 %p9, 2147483647
  %115 = and i1 %113, %114
  %116 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %117 = icmp sge i64 %p10, -2147483648
  %118 = icmp sle i64 %p10, 2147483647
  %119 = and i1 %117, %118
  %120 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %121 = trunc i64 %p9 to i32
  %122 = icmp eq i32 %121, 0
  %123 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %124 = icmp sge i32 %42, 0
  %125 = trunc i64 %p10 to i32
  %126 = icmp slt i32 %42, %125
  %127 = and i1 %124, %126
  %128 = icmp eq i32 %42, 0
  %129 = icmp eq i32 %125, 0
  %130 = and i1 %128, %129
  %131 = or i1 %127, %130
  %132 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %133 = mul i32 %42, %p11
  %134 = shl i32 %41, 1
  %135 = add i32 %23, %134
  %136 = getelementptr float, ptr @g1, i32 %135
  %137 = icmp sge i32 %23, 0
  %138 = icmp slt i32 %23, 2
  %139 = and i1 %137, %138
  %140 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %141 = getelementptr float, ptr @g0, i32 %23
  %142 = icmp sge i32 %41, 0
  %143 = icmp slt i32 %41, 2
  %144 = and i1 %142, %143
  %145 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %146 = shl i32 %41, 1
  %147 = getelementptr float, ptr @g1, i32 %146
  %148 = icmp sge i32 %23, 0
  %149 = icmp slt i32 %23, 2
  %150 = and i1 %148, %149
  %151 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %152 = add i32 %23, 2
  %153 = getelementptr float, ptr @g0, i32 %152
  %154 = icmp sge i32 %41, 0
  %155 = icmp slt i32 %41, 2
  %156 = and i1 %154, %155
  %157 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %158 = shl i32 %41, 1
  %159 = add i32 %158, 1
  %160 = getelementptr float, ptr @g1, i32 %159
  br label %bb1

bb1:
  br label %bb2

bb2:
  %161 = phi i32 [ 0, %bb1 ], [ %163, %bb11 ]
  %162 = phi float [ 0.0, %bb1 ], [ %195, %bb11 ]
  %163 = add i32 %161, 2
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  %164 = icmp slt i32 %161, %8
  %165 = add i32 %41, %161
  %166 = icmp sge i32 %165, 0
  %167 = icmp slt i32 %165, %99
  %168 = and i1 %166, %167
  %169 = icmp eq i32 %165, 0
  %170 = and i1 %169, %100
  %171 = or i1 %168, %170
  %172 = mul i32 %165, %p6
  %173 = add i32 %24, %172
  %174 = getelementptr float, ptr %p2, i32 %173
  %175 = add i32 %23, %161
  %176 = icmp sge i32 %175, 0
  %177 = icmp slt i32 %175, %121
  %178 = and i1 %176, %177
  %179 = icmp eq i32 %175, 0
  %180 = and i1 %179, %122
  %181 = or i1 %178, %180
  %182 = add i32 %175, %133
  %183 = getelementptr float, ptr %p7, i32 %182
  br i1 %164, label %bb10, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  br i1 %26, label %bb6, label %bb4

bb4:
  call void @ilgpu.debug.assert(i1 %29, ptr %30)
  call void @ilgpu.debug.assert(i1 %33, ptr %34)
  br label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %184 = phi i1 [ %44, %bb5 ], [ false, %bb6 ]
  %185 = xor i1 %184, -1
  br i1 %185, label %bb9, label %bb8

bb8:
  call void @ilgpu.debug.assert(i1 %47, ptr %48)
  call void @ilgpu.debug.assert(i1 %51, ptr %52)
  call void @ilgpu.debug.assert(i1 %60, ptr %61)
  call void @ilgpu.debug.assert(i1 %69, ptr %70)
  store float %162, ptr %73
  br label %bb9

bb9:
  ret void

bb10:
  call void @ilgpu.debug.assert(i1 %76, ptr %77)
  call void @ilgpu.debug.assert(i1 %80, ptr %81)
  call void @ilgpu.debug.assert(i1 %84, ptr %85)
  call void @ilgpu.debug.assert(i1 %88, ptr %89)
  call void @ilgpu.debug.assert(i1 %97, ptr %98)
  call void @ilgpu.debug.assert(i1 %171, ptr %101)
  %186 = load float, ptr %174
  store float %186, ptr %104
  call void @ilgpu.debug.assert(i1 %107, ptr %108)
  call void @ilgpu.debug.assert(i1 %111, ptr %112)
  call void @ilgpu.debug.assert(i1 %115, ptr %116)
  call void @ilgpu.debug.assert(i1 %119, ptr %120)
  call void @ilgpu.debug.assert(i1 %181, ptr %123)
  call void @ilgpu.debug.assert(i1 %131, ptr %132)
  %187 = load float, ptr %183
  store float %187, ptr %136
  call void @ilgpu.barrier.group()
  call void @ilgpu.debug.assert(i1 %139, ptr %140)
  %188 = load float, ptr %141
  call void @ilgpu.debug.assert(i1 %144, ptr %145)
  %189 = load float, ptr %147
  call void @ilgpu.debug.assert(i1 %150, ptr %151)
  %190 = load float, ptr %153
  call void @ilgpu.debug.assert(i1 %156, ptr %157)
  %191 = fmul float %188, %189
  %192 = fadd float %162, %191
  br label %bb11

bb11:
  %193 = load float, ptr %160
  call void @ilgpu.barrier.group()
  %194 = fmul float %190, %193
  %195 = fadd float %192, %194
  br label %bb2

}


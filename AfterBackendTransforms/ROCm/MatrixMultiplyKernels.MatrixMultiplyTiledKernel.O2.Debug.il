; stage: AfterBackendTransforms  backend: ROCm  opt: O2
; module: MatrixMultiplyTiledKernel  [intptr: i64]

%struct.0 = type { i64, i32 }
%struct.1 = type { ptr<float> addrspace(global), i64, i64, i64, i32 }
%struct.2 = type { i64, i64 }

@g0 = internal global float zeroinitializer ; shared
@g1 = internal global float zeroinitializer ; shared

define void @MatrixMultiplyTiledKernel(%struct.0 %p0, %struct.1 %p1, %struct.1 %p2, %struct.1 %p3, i32 %p4) {
entry:
  %0 = extractvalue %struct.1 %p1, 2 [Span: 2]
  %1 = extractvalue %struct.2 %0, 0
  %2 = icmp sge i64 %1, -2147483648
  %3 = icmp sle i64 %1, 2147483647
  %4 = and i1 %2, %3
  %5 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %6 = extractvalue %struct.2 %0, 1
  %7 = icmp sge i64 %6, -2147483648
  %8 = icmp sle i64 %6, 2147483647
  %9 = and i1 %7, %8
  %10 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %11 = extractvalue %struct.2 %0, 1
  %12 = trunc i64 %11 to i32
  %13 = extractvalue %struct.1 %p3, 2 [Span: 2]
  %14 = extractvalue %struct.2 %13, 0
  %15 = icmp sge i64 %14, -2147483648
  %16 = icmp sle i64 %14, 2147483647
  %17 = and i1 %15, %16
  %18 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %19 = extractvalue %struct.2 %13, 1
  %20 = icmp sge i64 %19, -2147483648
  %21 = icmp sle i64 %19, 2147483647
  %22 = and i1 %20, %21
  %23 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %24 = extractvalue %struct.0 %p0, 0
  %25 = sext i32 %p4 to i64
  %26 = sdiv i64 %24, %25
  %27 = trunc i64 %26 to i32
  %28 = shl i32 %27, 1
  %29 = extractvalue %struct.0 %p0, 1
  %30 = ashr i32 %29, 1
  %31 = add i32 %28, %30
  %32 = extractvalue %struct.2 %13, 0
  %33 = trunc i64 %32 to i32
  %34 = icmp sge i32 %31, %33
  %35 = extractvalue %struct.1 %p3, 2 [Span: 2]
  %36 = extractvalue %struct.2 %35, 0
  %37 = icmp sge i64 %36, -2147483648
  %38 = icmp sle i64 %36, 2147483647
  %39 = and i1 %37, %38
  %40 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %41 = extractvalue %struct.2 %35, 1
  %42 = icmp sge i64 %41, -2147483648
  %43 = icmp sle i64 %41, 2147483647
  %44 = and i1 %42, %43
  %45 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %46 = extractvalue %struct.0 %p0, 0
  %47 = sext i32 %p4 to i64
  %48 = srem i64 %46, %47
  %49 = trunc i64 %48 to i32
  %50 = shl i32 %49, 1
  %51 = extractvalue %struct.0 %p0, 1
  %52 = srem i32 %51, 2
  %53 = add i32 %50, %52
  %54 = extractvalue %struct.2 %35, 1
  %55 = trunc i64 %54 to i32
  %56 = icmp slt i32 %53, %55
  %57 = extractvalue %struct.1 %p3, 2 [Span: 2]
  %58 = extractvalue %struct.2 %57, 0
  %59 = icmp sge i64 %58, -2147483648
  %60 = icmp sle i64 %58, 2147483647
  %61 = and i1 %59, %60
  %62 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %63 = extractvalue %struct.2 %57, 1
  %64 = icmp sge i64 %63, -2147483648
  %65 = icmp sle i64 %63, 2147483647
  %66 = and i1 %64, %65
  %67 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %68 = icmp sge i32 %31, 0
  %69 = extractvalue %struct.2 %57, 0
  %70 = trunc i64 %69 to i32
  %71 = icmp slt i32 %31, %70
  %72 = and i1 %68, %71
  %73 = icmp eq i32 %31, 0
  %74 = icmp eq i32 %70, 0
  %75 = and i1 %73, %74
  %76 = or i1 %72, %75
  %77 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %78 = icmp sge i32 %53, 0
  %79 = extractvalue %struct.2 %57, 1
  %80 = trunc i64 %79 to i32
  %81 = icmp slt i32 %53, %80
  %82 = and i1 %78, %81
  %83 = icmp eq i32 %53, 0
  %84 = icmp eq i32 %80, 0
  %85 = and i1 %83, %84
  %86 = or i1 %82, %85
  %87 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %88 = extractvalue %struct.1 %p3, 0
  %89 = extractvalue %struct.1 %p3, 4
  %90 = mul i32 %53, %89
  %91 = add i32 %31, %90
  %92 = getelementptr float, ptr %88, i32 %91
  %93 = icmp sge i32 %30, 0
  %94 = icmp slt i32 %30, 2
  %95 = and i1 %93, %94
  %96 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %97 = icmp sge i32 %52, 0
  %98 = icmp slt i32 %52, 2
  %99 = and i1 %97, %98
  %100 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %101 = extractvalue %struct.1 %p1, 2 [Span: 2]
  %102 = extractvalue %struct.2 %101, 0
  %103 = icmp sge i64 %102, -2147483648
  %104 = icmp sle i64 %102, 2147483647
  %105 = and i1 %103, %104
  %106 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %107 = extractvalue %struct.2 %101, 1
  %108 = icmp sge i64 %107, -2147483648
  %109 = icmp sle i64 %107, 2147483647
  %110 = and i1 %108, %109
  %111 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %112 = icmp sge i32 %31, 0
  %113 = extractvalue %struct.2 %101, 0
  %114 = trunc i64 %113 to i32
  %115 = icmp slt i32 %31, %114
  %116 = and i1 %112, %115
  %117 = icmp eq i32 %31, 0
  %118 = icmp eq i32 %114, 0
  %119 = and i1 %117, %118
  %120 = or i1 %116, %119
  %121 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %122 = extractvalue %struct.2 %101, 1
  %123 = trunc i64 %122 to i32
  %124 = icmp eq i32 %123, 0
  %125 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %126 = extractvalue %struct.1 %p1, 0
  %127 = extractvalue %struct.1 %p1, 4
  %128 = shl i32 %52, 1
  %129 = add i32 %30, %128
  %130 = getelementptr float, ptr @g0, i32 %129
  %131 = icmp sge i32 %30, 0
  %132 = icmp slt i32 %30, 2
  %133 = and i1 %131, %132
  %134 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %135 = icmp sge i32 %52, 0
  %136 = icmp slt i32 %52, 2
  %137 = and i1 %135, %136
  %138 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %139 = extractvalue %struct.1 %p2, 2 [Span: 2]
  %140 = extractvalue %struct.2 %139, 0
  %141 = icmp sge i64 %140, -2147483648
  %142 = icmp sle i64 %140, 2147483647
  %143 = and i1 %141, %142
  %144 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %145 = extractvalue %struct.2 %139, 1
  %146 = icmp sge i64 %145, -2147483648
  %147 = icmp sle i64 %145, 2147483647
  %148 = and i1 %146, %147
  %149 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %150 = extractvalue %struct.2 %139, 0
  %151 = trunc i64 %150 to i32
  %152 = icmp eq i32 %151, 0
  %153 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %154 = icmp sge i32 %53, 0
  %155 = extractvalue %struct.2 %139, 1
  %156 = trunc i64 %155 to i32
  %157 = icmp slt i32 %53, %156
  %158 = and i1 %154, %157
  %159 = icmp eq i32 %53, 0
  %160 = icmp eq i32 %156, 0
  %161 = and i1 %159, %160
  %162 = or i1 %158, %161
  %163 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %164 = extractvalue %struct.1 %p2, 0
  %165 = extractvalue %struct.1 %p2, 4
  %166 = mul i32 %53, %165
  %167 = shl i32 %52, 1
  %168 = add i32 %30, %167
  %169 = getelementptr float, ptr @g1, i32 %168
  %170 = icmp sge i32 %30, 0
  %171 = icmp slt i32 %30, 2
  %172 = and i1 %170, %171
  %173 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %174 = getelementptr float, ptr @g0, i32 %30
  %175 = icmp sge i32 %52, 0
  %176 = icmp slt i32 %52, 2
  %177 = and i1 %175, %176
  %178 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %179 = shl i32 %52, 1
  %180 = getelementptr float, ptr @g1, i32 %179
  %181 = icmp sge i32 %30, 0
  %182 = icmp slt i32 %30, 2
  %183 = and i1 %181, %182
  %184 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %185 = add i32 %30, 2
  %186 = getelementptr float, ptr @g0, i32 %185
  %187 = icmp sge i32 %52, 0
  %188 = icmp slt i32 %52, 2
  %189 = and i1 %187, %188
  %190 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %191 = shl i32 %52, 1
  %192 = add i32 %191, 1
  %193 = getelementptr float, ptr @g1, i32 %192
  br label %bb1

bb1:
  br label %bb2

bb2:
  %194 = phi i32 [ 0, %bb1 ], [ %196, %bb11 ]
  %195 = phi float [ 0.0, %bb1 ], [ %228, %bb11 ]
  %196 = add i32 %194, 2
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  call void @ilgpu.debug.assert(i1 %9, ptr %10)
  %197 = icmp slt i32 %194, %12
  %198 = add i32 %52, %194
  %199 = icmp sge i32 %198, 0
  %200 = icmp slt i32 %198, %123
  %201 = and i1 %199, %200
  %202 = icmp eq i32 %198, 0
  %203 = and i1 %202, %124
  %204 = or i1 %201, %203
  %205 = mul i32 %198, %127
  %206 = add i32 %31, %205
  %207 = getelementptr float, ptr %126, i32 %206
  %208 = add i32 %30, %194
  %209 = icmp sge i32 %208, 0
  %210 = icmp slt i32 %208, %151
  %211 = and i1 %209, %210
  %212 = icmp eq i32 %208, 0
  %213 = and i1 %212, %152
  %214 = or i1 %211, %213
  %215 = add i32 %208, %166
  %216 = getelementptr float, ptr %164, i32 %215
  br i1 %197, label %bb10, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  call void @ilgpu.debug.assert(i1 %22, ptr %23)
  br i1 %34, label %bb6, label %bb4

bb4:
  call void @ilgpu.debug.assert(i1 %39, ptr %40)
  call void @ilgpu.debug.assert(i1 %44, ptr %45)
  br label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %217 = phi i1 [ %56, %bb5 ], [ false, %bb6 ]
  %218 = xor i1 %217, -1
  br i1 %218, label %bb9, label %bb8

bb8:
  call void @ilgpu.debug.assert(i1 %61, ptr %62)
  call void @ilgpu.debug.assert(i1 %66, ptr %67)
  call void @ilgpu.debug.assert(i1 %76, ptr %77)
  call void @ilgpu.debug.assert(i1 %86, ptr %87)
  store float %195, ptr %92
  br label %bb9

bb9:
  ret void

bb10:
  call void @ilgpu.debug.assert(i1 %95, ptr %96)
  call void @ilgpu.debug.assert(i1 %99, ptr %100)
  call void @ilgpu.debug.assert(i1 %105, ptr %106)
  call void @ilgpu.debug.assert(i1 %110, ptr %111)
  call void @ilgpu.debug.assert(i1 %120, ptr %121)
  call void @ilgpu.debug.assert(i1 %204, ptr %125)
  %219 = load float, ptr %207
  store float %219, ptr %130
  call void @ilgpu.debug.assert(i1 %133, ptr %134)
  call void @ilgpu.debug.assert(i1 %137, ptr %138)
  call void @ilgpu.debug.assert(i1 %143, ptr %144)
  call void @ilgpu.debug.assert(i1 %148, ptr %149)
  call void @ilgpu.debug.assert(i1 %214, ptr %153)
  call void @ilgpu.debug.assert(i1 %162, ptr %163)
  %220 = load float, ptr %216
  store float %220, ptr %169
  call void @ilgpu.barrier.group()
  call void @ilgpu.debug.assert(i1 %172, ptr %173)
  %221 = load float, ptr %174
  call void @ilgpu.debug.assert(i1 %177, ptr %178)
  %222 = load float, ptr %180
  call void @ilgpu.debug.assert(i1 %183, ptr %184)
  %223 = load float, ptr %186
  call void @ilgpu.debug.assert(i1 %189, ptr %190)
  %224 = fmul float %221, %222
  %225 = fadd float %195, %224
  br label %bb11

bb11:
  %226 = load float, ptr %193
  call void @ilgpu.barrier.group()
  %227 = fmul float %223, %226
  %228 = fadd float %225, %227
  br label %bb2

}


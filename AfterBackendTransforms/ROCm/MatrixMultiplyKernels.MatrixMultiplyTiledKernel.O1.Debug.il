; stage: AfterBackendTransforms  backend: ROCm  opt: O1
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
  %26 = extractvalue %struct.0 %p0, 1
  %27 = sdiv i32 %26, 2
  %28 = extractvalue %struct.2 %13, 0
  %29 = trunc i64 %28 to i32
  %30 = extractvalue %struct.1 %p3, 2 [Span: 2]
  %31 = extractvalue %struct.2 %30, 0
  %32 = icmp sge i64 %31, -2147483648
  %33 = icmp sle i64 %31, 2147483647
  %34 = and i1 %32, %33
  %35 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %36 = extractvalue %struct.2 %30, 1
  %37 = icmp sge i64 %36, -2147483648
  %38 = icmp sle i64 %36, 2147483647
  %39 = and i1 %37, %38
  %40 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %41 = extractvalue %struct.0 %p0, 0
  %42 = sext i32 %p4 to i64
  %43 = extractvalue %struct.0 %p0, 1
  %44 = srem i32 %43, 2
  %45 = extractvalue %struct.2 %30, 1
  %46 = trunc i64 %45 to i32
  %47 = extractvalue %struct.1 %p3, 2 [Span: 2]
  %48 = extractvalue %struct.2 %47, 0
  %49 = icmp sge i64 %48, -2147483648
  %50 = icmp sle i64 %48, 2147483647
  %51 = and i1 %49, %50
  %52 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %53 = extractvalue %struct.2 %47, 1
  %54 = icmp sge i64 %53, -2147483648
  %55 = icmp sle i64 %53, 2147483647
  %56 = and i1 %54, %55
  %57 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %58 = extractvalue %struct.2 %47, 0
  %59 = trunc i64 %58 to i32
  %60 = icmp eq i32 %59, 0
  %61 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %62 = extractvalue %struct.2 %47, 1
  %63 = trunc i64 %62 to i32
  %64 = icmp eq i32 %63, 0
  %65 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %66 = extractvalue %struct.1 %p3, 0
  %67 = extractvalue %struct.1 %p3, 4
  %68 = icmp sge i32 %27, 0
  %69 = icmp slt i32 %27, 2
  %70 = and i1 %68, %69
  %71 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %72 = icmp sge i32 %44, 0
  %73 = icmp slt i32 %44, 2
  %74 = and i1 %72, %73
  %75 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %76 = extractvalue %struct.1 %p1, 2 [Span: 2]
  %77 = extractvalue %struct.2 %76, 0
  %78 = icmp sge i64 %77, -2147483648
  %79 = icmp sle i64 %77, 2147483647
  %80 = and i1 %78, %79
  %81 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %82 = extractvalue %struct.2 %76, 1
  %83 = icmp sge i64 %82, -2147483648
  %84 = icmp sle i64 %82, 2147483647
  %85 = and i1 %83, %84
  %86 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %87 = extractvalue %struct.2 %76, 0
  %88 = trunc i64 %87 to i32
  %89 = icmp eq i32 %88, 0
  %90 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %91 = extractvalue %struct.2 %76, 1
  %92 = trunc i64 %91 to i32
  %93 = icmp eq i32 %92, 0
  %94 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %95 = extractvalue %struct.1 %p1, 0
  %96 = extractvalue %struct.1 %p1, 4
  %97 = shl i32 %44, 1
  %98 = add i32 %27, %97
  %99 = getelementptr float, ptr @g0, i32 %98
  %100 = icmp sge i32 %27, 0
  %101 = icmp slt i32 %27, 2
  %102 = and i1 %100, %101
  %103 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %104 = icmp sge i32 %44, 0
  %105 = icmp slt i32 %44, 2
  %106 = and i1 %104, %105
  %107 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %108 = extractvalue %struct.1 %p2, 2 [Span: 2]
  %109 = extractvalue %struct.2 %108, 0
  %110 = icmp sge i64 %109, -2147483648
  %111 = icmp sle i64 %109, 2147483647
  %112 = and i1 %110, %111
  %113 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %114 = extractvalue %struct.2 %108, 1
  %115 = icmp sge i64 %114, -2147483648
  %116 = icmp sle i64 %114, 2147483647
  %117 = and i1 %115, %116
  %118 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %119 = extractvalue %struct.2 %108, 0
  %120 = trunc i64 %119 to i32
  %121 = icmp eq i32 %120, 0
  %122 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %123 = extractvalue %struct.2 %108, 1
  %124 = trunc i64 %123 to i32
  %125 = icmp eq i32 %124, 0
  %126 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %127 = extractvalue %struct.1 %p2, 0
  %128 = extractvalue %struct.1 %p2, 4
  %129 = shl i32 %44, 1
  %130 = add i32 %27, %129
  %131 = getelementptr float, ptr @g1, i32 %130
  %132 = icmp sge i32 %27, 0
  %133 = icmp slt i32 %27, 2
  %134 = and i1 %132, %133
  %135 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %136 = getelementptr float, ptr @g0, i32 %27
  %137 = icmp sge i32 %44, 0
  %138 = icmp slt i32 %44, 2
  %139 = and i1 %137, %138
  %140 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %141 = shl i32 %44, 1
  %142 = getelementptr float, ptr @g1, i32 %141
  %143 = icmp sge i32 %27, 0
  %144 = icmp slt i32 %27, 2
  %145 = and i1 %143, %144
  %146 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %147 = add i32 %27, 2
  %148 = getelementptr float, ptr @g0, i32 %147
  %149 = icmp sge i32 %44, 0
  %150 = icmp slt i32 %44, 2
  %151 = and i1 %149, %150
  %152 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %153 = shl i32 %44, 1
  %154 = add i32 %153, 1
  %155 = getelementptr float, ptr @g1, i32 %154
  br label %bb1

bb1:
  br label %bb2

bb2:
  %156 = phi i32 [ 0, %bb1 ], [ %158, %bb11 ]
  %157 = phi float [ 0.0, %bb1 ], [ %228, %bb11 ]
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  call void @ilgpu.debug.assert(i1 %9, ptr %10)
  %158 = add i32 %156, 2
  %159 = icmp slt i32 %156, %12
  %160 = sdiv i64 %24, %25
  %161 = trunc i64 %160 to i32
  %162 = shl i32 %161, 1
  %163 = add i32 %162, %27
  %164 = icmp sge i32 %163, %29
  %165 = srem i64 %41, %42
  %166 = trunc i64 %165 to i32
  %167 = shl i32 %166, 1
  %168 = add i32 %167, %44
  %169 = icmp slt i32 %168, %46
  %170 = icmp sge i32 %163, 0
  %171 = icmp slt i32 %163, %59
  %172 = and i1 %170, %171
  %173 = icmp eq i32 %163, 0
  %174 = and i1 %173, %60
  %175 = or i1 %172, %174
  %176 = icmp sge i32 %168, 0
  %177 = icmp slt i32 %168, %63
  %178 = and i1 %176, %177
  %179 = icmp eq i32 %168, 0
  %180 = and i1 %179, %64
  %181 = or i1 %178, %180
  %182 = mul i32 %168, %67
  %183 = add i32 %163, %182
  %184 = getelementptr float, ptr %66, i32 %183
  %185 = icmp sge i32 %163, 0
  %186 = icmp slt i32 %163, %88
  %187 = and i1 %185, %186
  %188 = icmp eq i32 %163, 0
  %189 = and i1 %188, %89
  %190 = or i1 %187, %189
  %191 = add i32 %44, %156
  %192 = icmp sge i32 %191, 0
  %193 = icmp slt i32 %191, %92
  %194 = and i1 %192, %193
  %195 = icmp eq i32 %191, 0
  %196 = and i1 %195, %93
  %197 = or i1 %194, %196
  %198 = mul i32 %191, %96
  %199 = add i32 %163, %198
  %200 = getelementptr float, ptr %95, i32 %199
  %201 = add i32 %27, %156
  %202 = icmp sge i32 %201, 0
  %203 = icmp slt i32 %201, %120
  %204 = and i1 %202, %203
  %205 = icmp eq i32 %201, 0
  %206 = and i1 %205, %121
  %207 = or i1 %204, %206
  %208 = icmp sge i32 %168, 0
  %209 = icmp slt i32 %168, %124
  %210 = and i1 %208, %209
  %211 = icmp eq i32 %168, 0
  %212 = and i1 %211, %125
  %213 = or i1 %210, %212
  %214 = mul i32 %168, %128
  %215 = add i32 %201, %214
  %216 = getelementptr float, ptr %127, i32 %215
  br i1 %159, label %bb10, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  call void @ilgpu.debug.assert(i1 %22, ptr %23)
  br i1 %164, label %bb6, label %bb4

bb4:
  call void @ilgpu.debug.assert(i1 %34, ptr %35)
  call void @ilgpu.debug.assert(i1 %39, ptr %40)
  br label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %217 = phi i1 [ %169, %bb5 ], [ false, %bb6 ]
  %218 = xor i1 %217, -1
  br i1 %218, label %bb9, label %bb8

bb8:
  call void @ilgpu.debug.assert(i1 %51, ptr %52)
  call void @ilgpu.debug.assert(i1 %56, ptr %57)
  call void @ilgpu.debug.assert(i1 %175, ptr %61)
  call void @ilgpu.debug.assert(i1 %181, ptr %65)
  store float %157, ptr %184
  br label %bb9

bb9:
  ret void

bb10:
  call void @ilgpu.debug.assert(i1 %70, ptr %71)
  call void @ilgpu.debug.assert(i1 %74, ptr %75)
  call void @ilgpu.debug.assert(i1 %80, ptr %81)
  call void @ilgpu.debug.assert(i1 %85, ptr %86)
  call void @ilgpu.debug.assert(i1 %190, ptr %90)
  call void @ilgpu.debug.assert(i1 %197, ptr %94)
  %219 = load float, ptr %200
  store float %219, ptr %99
  call void @ilgpu.debug.assert(i1 %102, ptr %103)
  call void @ilgpu.debug.assert(i1 %106, ptr %107)
  call void @ilgpu.debug.assert(i1 %112, ptr %113)
  call void @ilgpu.debug.assert(i1 %117, ptr %118)
  call void @ilgpu.debug.assert(i1 %207, ptr %122)
  call void @ilgpu.debug.assert(i1 %213, ptr %126)
  %220 = load float, ptr %216
  store float %220, ptr %131
  call void @ilgpu.barrier.group()
  call void @ilgpu.debug.assert(i1 %134, ptr %135)
  %221 = load float, ptr %136
  call void @ilgpu.debug.assert(i1 %139, ptr %140)
  %222 = load float, ptr %142
  call void @ilgpu.debug.assert(i1 %145, ptr %146)
  %223 = load float, ptr %148
  call void @ilgpu.debug.assert(i1 %151, ptr %152)
  %224 = fmul float %221, %222
  %225 = fadd float %157, %224
  br label %bb11

bb11:
  %226 = load float, ptr %155
  call void @ilgpu.barrier.group()
  %227 = fmul float %223, %226
  %228 = fadd float %225, %227
  br label %bb2

}


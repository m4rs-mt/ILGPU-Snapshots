; stage: AfterBackendTransforms  backend: CPU  opt: O2
; module: MatrixMultiplyTiledKernel  [intptr: i64]

%struct.0 = type { i64, i32 }
%view.float = view float
%struct.1 = type { %view.float, i64, i64, i32 }
%struct.2 = type { i64, i64 }

@g0 = internal global float zeroinitializer ; shared
@g1 = internal global float zeroinitializer ; shared

define void @MatrixMultiplyTiledKernel(%struct.0 %p0, %struct.1 %p1, %struct.1 %p2, %struct.1 %p3, i32 %p4) {
entry:
  %0 = extractvalue %struct.1 %p1, 1 [Span: 2]
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
  %13 = extractvalue %struct.1 %p3, 1 [Span: 2]
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
  %27 = ashr i32 %26, 1
  %28 = extractvalue %struct.2 %13, 0
  %29 = trunc i64 %28 to i32
  %30 = extractvalue %struct.1 %p3, 1 [Span: 2]
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
  %47 = extractvalue %struct.1 %p3, 1 [Span: 2]
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
  %67 = extractvalue %struct.1 %p3, 3
  %68 = icmp sge i32 %27, 0
  %69 = icmp slt i32 %27, 2
  %70 = and i1 %68, %69
  %71 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %72 = icmp sge i32 %44, 0
  %73 = icmp slt i32 %44, 2
  %74 = and i1 %72, %73
  %75 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %76 = extractvalue %struct.1 %p1, 1 [Span: 2]
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
  %96 = extractvalue %struct.1 %p1, 3
  %97 = call %view.float @ilgpu.view.new(ptr @g0, i64 4)
  %98 = shl i32 %44, 1
  %99 = add i32 %27, %98
  %100 = getelementptr float, ptr %97, i32 %99
  %101 = icmp sge i32 %27, 0
  %102 = icmp slt i32 %27, 2
  %103 = and i1 %101, %102
  %104 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %105 = icmp sge i32 %44, 0
  %106 = icmp slt i32 %44, 2
  %107 = and i1 %105, %106
  %108 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %109 = extractvalue %struct.1 %p2, 1 [Span: 2]
  %110 = extractvalue %struct.2 %109, 0
  %111 = icmp sge i64 %110, -2147483648
  %112 = icmp sle i64 %110, 2147483647
  %113 = and i1 %111, %112
  %114 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %115 = extractvalue %struct.2 %109, 1
  %116 = icmp sge i64 %115, -2147483648
  %117 = icmp sle i64 %115, 2147483647
  %118 = and i1 %116, %117
  %119 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %120 = extractvalue %struct.2 %109, 0
  %121 = trunc i64 %120 to i32
  %122 = icmp eq i32 %121, 0
  %123 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %124 = extractvalue %struct.2 %109, 1
  %125 = trunc i64 %124 to i32
  %126 = icmp eq i32 %125, 0
  %127 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %128 = extractvalue %struct.1 %p2, 0
  %129 = extractvalue %struct.1 %p2, 3
  %130 = call %view.float @ilgpu.view.new(ptr @g1, i64 4)
  %131 = shl i32 %44, 1
  %132 = add i32 %27, %131
  %133 = getelementptr float, ptr %130, i32 %132
  %134 = icmp sge i32 %27, 0
  %135 = icmp slt i32 %27, 2
  %136 = and i1 %134, %135
  %137 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %138 = getelementptr float, ptr %97, i32 %27
  %139 = icmp sge i32 %44, 0
  %140 = icmp slt i32 %44, 2
  %141 = and i1 %139, %140
  %142 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %143 = shl i32 %44, 1
  %144 = getelementptr float, ptr %130, i32 %143
  %145 = icmp sge i32 %27, 0
  %146 = icmp slt i32 %27, 2
  %147 = and i1 %145, %146
  %148 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %149 = add i32 %27, 2
  %150 = getelementptr float, ptr %97, i32 %149
  %151 = icmp sge i32 %44, 0
  %152 = icmp slt i32 %44, 2
  %153 = and i1 %151, %152
  %154 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %155 = shl i32 %44, 1
  %156 = add i32 %155, 1
  %157 = getelementptr float, ptr %130, i32 %156
  br label %bb1

bb1:
  br label %bb2

bb2:
  %158 = phi i32 [ 0, %bb1 ], [ %160, %bb11 ]
  %159 = phi float [ 0.0, %bb1 ], [ %230, %bb11 ]
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  call void @ilgpu.debug.assert(i1 %9, ptr %10)
  %160 = add i32 %158, 2
  %161 = icmp slt i32 %158, %12
  %162 = sdiv i64 %24, %25
  %163 = trunc i64 %162 to i32
  %164 = shl i32 %163, 1
  %165 = add i32 %164, %27
  %166 = icmp sge i32 %165, %29
  %167 = srem i64 %41, %42
  %168 = trunc i64 %167 to i32
  %169 = shl i32 %168, 1
  %170 = add i32 %169, %44
  %171 = icmp slt i32 %170, %46
  %172 = icmp sge i32 %165, 0
  %173 = icmp slt i32 %165, %59
  %174 = and i1 %172, %173
  %175 = icmp eq i32 %165, 0
  %176 = and i1 %175, %60
  %177 = or i1 %174, %176
  %178 = icmp sge i32 %170, 0
  %179 = icmp slt i32 %170, %63
  %180 = and i1 %178, %179
  %181 = icmp eq i32 %170, 0
  %182 = and i1 %181, %64
  %183 = or i1 %180, %182
  %184 = mul i32 %170, %67
  %185 = add i32 %165, %184
  %186 = getelementptr float, ptr %66, i32 %185
  %187 = icmp sge i32 %165, 0
  %188 = icmp slt i32 %165, %88
  %189 = and i1 %187, %188
  %190 = icmp eq i32 %165, 0
  %191 = and i1 %190, %89
  %192 = or i1 %189, %191
  %193 = add i32 %44, %158
  %194 = icmp sge i32 %193, 0
  %195 = icmp slt i32 %193, %92
  %196 = and i1 %194, %195
  %197 = icmp eq i32 %193, 0
  %198 = and i1 %197, %93
  %199 = or i1 %196, %198
  %200 = mul i32 %193, %96
  %201 = add i32 %165, %200
  %202 = getelementptr float, ptr %95, i32 %201
  %203 = add i32 %27, %158
  %204 = icmp sge i32 %203, 0
  %205 = icmp slt i32 %203, %121
  %206 = and i1 %204, %205
  %207 = icmp eq i32 %203, 0
  %208 = and i1 %207, %122
  %209 = or i1 %206, %208
  %210 = icmp sge i32 %170, 0
  %211 = icmp slt i32 %170, %125
  %212 = and i1 %210, %211
  %213 = icmp eq i32 %170, 0
  %214 = and i1 %213, %126
  %215 = or i1 %212, %214
  %216 = mul i32 %170, %129
  %217 = add i32 %203, %216
  %218 = getelementptr float, ptr %128, i32 %217
  br i1 %161, label %bb10, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  call void @ilgpu.debug.assert(i1 %22, ptr %23)
  br i1 %166, label %bb6, label %bb4

bb4:
  call void @ilgpu.debug.assert(i1 %34, ptr %35)
  call void @ilgpu.debug.assert(i1 %39, ptr %40)
  br label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %219 = phi i1 [ %171, %bb5 ], [ false, %bb6 ]
  %220 = xor i1 %219, -1
  br i1 %220, label %bb9, label %bb8

bb8:
  call void @ilgpu.debug.assert(i1 %51, ptr %52)
  call void @ilgpu.debug.assert(i1 %56, ptr %57)
  call void @ilgpu.debug.assert(i1 %177, ptr %61)
  call void @ilgpu.debug.assert(i1 %183, ptr %65)
  store float %159, ptr %186
  br label %bb9

bb9:
  ret void

bb10:
  call void @ilgpu.debug.assert(i1 %70, ptr %71)
  call void @ilgpu.debug.assert(i1 %74, ptr %75)
  call void @ilgpu.debug.assert(i1 %80, ptr %81)
  call void @ilgpu.debug.assert(i1 %85, ptr %86)
  call void @ilgpu.debug.assert(i1 %192, ptr %90)
  call void @ilgpu.debug.assert(i1 %199, ptr %94)
  %221 = load float, ptr %202
  store float %221, ptr %100
  call void @ilgpu.debug.assert(i1 %103, ptr %104)
  call void @ilgpu.debug.assert(i1 %107, ptr %108)
  call void @ilgpu.debug.assert(i1 %113, ptr %114)
  call void @ilgpu.debug.assert(i1 %118, ptr %119)
  call void @ilgpu.debug.assert(i1 %209, ptr %123)
  call void @ilgpu.debug.assert(i1 %215, ptr %127)
  %222 = load float, ptr %218
  store float %222, ptr %133
  call void @ilgpu.barrier.group()
  call void @ilgpu.debug.assert(i1 %136, ptr %137)
  %223 = load float, ptr %138
  call void @ilgpu.debug.assert(i1 %141, ptr %142)
  %224 = load float, ptr %144
  call void @ilgpu.debug.assert(i1 %147, ptr %148)
  %225 = load float, ptr %150
  call void @ilgpu.debug.assert(i1 %153, ptr %154)
  %226 = fmul float %223, %224
  %227 = fadd float %159, %226
  br label %bb11

bb11:
  %228 = load float, ptr %157
  call void @ilgpu.barrier.group()
  %229 = fmul float %225, %228
  %230 = fadd float %227, %229
  br label %bb2

}


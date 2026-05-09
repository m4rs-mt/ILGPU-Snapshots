; stage: AfterGlobalOpt  opt: O2
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
  %26 = sdiv i64 %24, %25
  %27 = trunc i64 %26 to i32
  %28 = shl i32 %27, 1
  %29 = extractvalue %struct.0 %p0, 1
  %30 = ashr i32 %29, 1
  %31 = add i32 %28, %30
  %32 = extractvalue %struct.2 %13, 0
  %33 = trunc i64 %32 to i32
  %34 = icmp sge i32 %31, %33
  %35 = extractvalue %struct.1 %p3, 1 [Span: 2]
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
  %57 = extractvalue %struct.1 %p3, 1 [Span: 2]
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
  %89 = extractvalue %struct.1 %p3, 3
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
  %101 = extractvalue %struct.1 %p1, 1 [Span: 2]
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
  %127 = extractvalue %struct.1 %p1, 3
  %128 = call %view.float @ilgpu.view.new(ptr @g0, i64 4)
  %129 = shl i32 %52, 1
  %130 = add i32 %30, %129
  %131 = getelementptr float, ptr %128, i32 %130
  %132 = icmp sge i32 %30, 0
  %133 = icmp slt i32 %30, 2
  %134 = and i1 %132, %133
  %135 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %136 = icmp sge i32 %52, 0
  %137 = icmp slt i32 %52, 2
  %138 = and i1 %136, %137
  %139 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %140 = extractvalue %struct.1 %p2, 1 [Span: 2]
  %141 = extractvalue %struct.2 %140, 0
  %142 = icmp sge i64 %141, -2147483648
  %143 = icmp sle i64 %141, 2147483647
  %144 = and i1 %142, %143
  %145 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %146 = extractvalue %struct.2 %140, 1
  %147 = icmp sge i64 %146, -2147483648
  %148 = icmp sle i64 %146, 2147483647
  %149 = and i1 %147, %148
  %150 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %151 = extractvalue %struct.2 %140, 0
  %152 = trunc i64 %151 to i32
  %153 = icmp eq i32 %152, 0
  %154 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %155 = icmp sge i32 %53, 0
  %156 = extractvalue %struct.2 %140, 1
  %157 = trunc i64 %156 to i32
  %158 = icmp slt i32 %53, %157
  %159 = and i1 %155, %158
  %160 = icmp eq i32 %53, 0
  %161 = icmp eq i32 %157, 0
  %162 = and i1 %160, %161
  %163 = or i1 %159, %162
  %164 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %165 = extractvalue %struct.1 %p2, 0
  %166 = extractvalue %struct.1 %p2, 3
  %167 = mul i32 %53, %166
  %168 = call %view.float @ilgpu.view.new(ptr @g1, i64 4)
  %169 = shl i32 %52, 1
  %170 = add i32 %30, %169
  %171 = getelementptr float, ptr %168, i32 %170
  %172 = icmp sge i32 %30, 0
  %173 = icmp slt i32 %30, 2
  %174 = and i1 %172, %173
  %175 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %176 = getelementptr float, ptr %128, i32 %30
  %177 = icmp sge i32 %52, 0
  %178 = icmp slt i32 %52, 2
  %179 = and i1 %177, %178
  %180 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %181 = shl i32 %52, 1
  %182 = getelementptr float, ptr %168, i32 %181
  %183 = icmp sge i32 %30, 0
  %184 = icmp slt i32 %30, 2
  %185 = and i1 %183, %184
  %186 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %187 = add i32 %30, 2
  %188 = getelementptr float, ptr %128, i32 %187
  %189 = icmp sge i32 %52, 0
  %190 = icmp slt i32 %52, 2
  %191 = and i1 %189, %190
  %192 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %193 = shl i32 %52, 1
  %194 = add i32 %193, 1
  %195 = getelementptr float, ptr %168, i32 %194
  br label %bb1

bb1:
  br label %bb2

bb2:
  %196 = phi i32 [ 0, %bb1 ], [ %198, %bb11 ]
  %197 = phi float [ 0.0, %bb1 ], [ %230, %bb11 ]
  %198 = add i32 %196, 2
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  call void @ilgpu.debug.assert(i1 %9, ptr %10)
  %199 = icmp slt i32 %196, %12
  %200 = add i32 %52, %196
  %201 = icmp sge i32 %200, 0
  %202 = icmp slt i32 %200, %123
  %203 = and i1 %201, %202
  %204 = icmp eq i32 %200, 0
  %205 = and i1 %204, %124
  %206 = or i1 %203, %205
  %207 = mul i32 %200, %127
  %208 = add i32 %31, %207
  %209 = getelementptr float, ptr %126, i32 %208
  %210 = add i32 %30, %196
  %211 = icmp sge i32 %210, 0
  %212 = icmp slt i32 %210, %152
  %213 = and i1 %211, %212
  %214 = icmp eq i32 %210, 0
  %215 = and i1 %214, %153
  %216 = or i1 %213, %215
  %217 = add i32 %210, %167
  %218 = getelementptr float, ptr %165, i32 %217
  br i1 %199, label %bb10, label %bb3

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
  %219 = phi i1 [ %56, %bb5 ], [ false, %bb6 ]
  %220 = xor i1 %219, -1
  br i1 %220, label %bb9, label %bb8

bb8:
  call void @ilgpu.debug.assert(i1 %61, ptr %62)
  call void @ilgpu.debug.assert(i1 %66, ptr %67)
  call void @ilgpu.debug.assert(i1 %76, ptr %77)
  call void @ilgpu.debug.assert(i1 %86, ptr %87)
  store float %197, ptr %92
  br label %bb9

bb9:
  ret void

bb10:
  call void @ilgpu.debug.assert(i1 %95, ptr %96)
  call void @ilgpu.debug.assert(i1 %99, ptr %100)
  call void @ilgpu.debug.assert(i1 %105, ptr %106)
  call void @ilgpu.debug.assert(i1 %110, ptr %111)
  call void @ilgpu.debug.assert(i1 %120, ptr %121)
  call void @ilgpu.debug.assert(i1 %206, ptr %125)
  %221 = load float, ptr %209
  store float %221, ptr %131
  call void @ilgpu.debug.assert(i1 %134, ptr %135)
  call void @ilgpu.debug.assert(i1 %138, ptr %139)
  call void @ilgpu.debug.assert(i1 %144, ptr %145)
  call void @ilgpu.debug.assert(i1 %149, ptr %150)
  call void @ilgpu.debug.assert(i1 %216, ptr %154)
  call void @ilgpu.debug.assert(i1 %163, ptr %164)
  %222 = load float, ptr %218
  store float %222, ptr %171
  call void @ilgpu.barrier.group()
  call void @ilgpu.debug.assert(i1 %174, ptr %175)
  %223 = load float, ptr %176
  call void @ilgpu.debug.assert(i1 %179, ptr %180)
  %224 = load float, ptr %182
  call void @ilgpu.debug.assert(i1 %185, ptr %186)
  %225 = load float, ptr %188
  call void @ilgpu.debug.assert(i1 %191, ptr %192)
  %226 = fmul float %223, %224
  %227 = fadd float %197, %226
  br label %bb11

bb11:
  %228 = load float, ptr %195
  call void @ilgpu.barrier.group()
  %229 = fmul float %225, %228
  %230 = fadd float %227, %229
  br label %bb2

}


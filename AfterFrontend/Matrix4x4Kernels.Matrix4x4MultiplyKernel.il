; module: Matrix4x4MultiplyKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }

define void @Matrix4x4MultiplyKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2, %struct.1 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %1
  %2 = addrspacecast ptr %0 to ptr<%struct.0>
  %3 = addrspacecast ptr %1 to ptr<%struct.1>
  br label %bb1

bb1:
  %4 = call %struct.1 @op_Multiply(%struct.1 %p2, %struct.1 %p3)
  store %struct.1 %4, ptr %1
  %5 = call ptr<float> @get_Item(ptr<%struct.0> %2, i32 %p0)
  %6 = call float @Sum(ptr<%struct.1> %3)
  store float %6, ptr %5
  ret void

}

define float @Sum(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 0
  %1 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 1
  %2 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 2
  %3 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 3
  %4 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 4
  %5 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 5
  %6 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 6
  %7 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 7
  %8 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 8
  %9 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 9
  %10 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 10
  %11 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 11
  %12 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 12
  %13 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 13
  %14 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 14
  %15 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 15
  br label %bb1

bb1:
  %16 = load float, ptr %0
  %17 = load float, ptr %1
  %18 = load float, ptr %2
  %19 = load float, ptr %3
  %20 = load float, ptr %4
  %21 = load float, ptr %5
  %22 = load float, ptr %6
  %23 = load float, ptr %7
  %24 = load float, ptr %8
  %25 = load float, ptr %9
  %26 = load float, ptr %10
  %27 = load float, ptr %11
  %28 = load float, ptr %12
  %29 = load float, ptr %13
  %30 = load float, ptr %14
  %31 = load float, ptr %15
  %32 = fadd float %16, %17
  %33 = fadd float %32, %18
  %34 = fadd float %33, %19
  %35 = fadd float %34, %20
  %36 = fadd float %35, %21
  %37 = fadd float %36, %22
  %38 = fadd float %37, %23
  %39 = fadd float %38, %24
  %40 = fadd float %39, %25
  %41 = fadd float %40, %26
  %42 = fadd float %41, %27
  %43 = fadd float %42, %28
  %44 = fadd float %43, %29
  %45 = fadd float %44, %30
  %46 = fadd float %45, %31
  ret float %46

}

define ptr<float> @get_Item(ptr<%struct.0> %p0, i32 %p1) {
entry:
  %0 = alloca %view.float, i32 1
  store %view.float null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%view.float>
  br label %bb1

bb1:
  %2 = call %view.float @get_BaseView(ptr<%struct.0> %p0)
  store %view.float %2, ptr %0
  %3 = call i32 @ComputeLinearIndex(ptr<%struct.0> %p0, i32 %p1)
  %4 = load %view.float, ptr %1
  %5 = getelementptr float, ptr %4, i32 %3
  ret ptr<float> %5

}

define i32 @ComputeLinearIndex(ptr<%struct.0> %p0, i32 %p1) {
entry:
  %0 = alloca i8, i32 1
  store i8 0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i8>
  br label %bb1

bb1:
  %2 = call i8 @get_Stride(ptr<%struct.0> %p0)
  store i8 %2, ptr %0
  %3 = call i32 @get_IntExtent(ptr<%struct.0> %p0)
  %4 = call i32 @ComputeElementIndexChecked(ptr<i8> %1, i32 %p1, i32 %3)
  ret i32 %4

}

define i32 @ComputeElementIndexChecked(ptr<i8> %p0, i32 %p1, i32 %p2) {
entry:
  br label %bb1

bb1:
  %0 = load i8, ptr %p0
  %1 = call i32 @ComputeElementIndexChecked(i8 %0, i32 %p1, i32 %p2)
  ret i32 %1

}

define i32 @ComputeElementIndexChecked(i8 %p0, i32 %p1, i32 %p2) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p1, ptr %0
  %1 = alloca i32, i32 1
  store i32 %p2, ptr %1
  %2 = addrspacecast ptr %0 to ptr<i32>
  %3 = addrspacecast ptr %1 to ptr<i32>
  %4 = call ptr @ilgpu.string("X_index_out_of_bounds")
  br label %bb1

bb1:
  %5 = call i32 @get_X(ptr<i32> %2)
  %6 = call i32 @get_X(ptr<i32> %2)
  %7 = call i32 @get_X(ptr<i32> %3)
  %8 = call i32 @get_X(ptr<i32> %2)
  %9 = call i32 @get_X(ptr<i32> %3)
  %10 = icmp sge i32 %5, 0
  %11 = icmp slt i32 %6, %7
  %12 = and i1 %10, %11
  %13 = icmp eq i32 %8, 0
  %14 = icmp eq i32 %9, 0
  %15 = and i1 %13, %14
  %16 = or i1 %12, %15
  call void @ilgpu.debug.assert(i1 %16, ptr %4)
  %17 = load i32, ptr %2
  %18 = call i32 @ComputeElementIndex(i8 %p0, i32 %17)
  br label %bb2

bb2:
  ret i32 %18

}

define i32 @ComputeElementIndex(i8 %p0, i32 %p1) {
entry:
  %0 = alloca i8, i32 1
  store i8 %p0, ptr %0
  %1 = alloca i32, i32 1
  store i32 %p1, ptr %1
  %2 = addrspacecast ptr %1 to ptr<i32>
  %3 = addrspacecast ptr %0 to ptr<i8>
  br label %bb1

bb1:
  %4 = call i32 @get_X(ptr<i32> %2)
  %5 = call i32 @get_XStride(ptr<i8> %3)
  %6 = mul i32 %4, %5
  ret i32 %6

}

define i32 @get_XStride(ptr<i8> %p0) {
entry:
  br label %bb1

bb1:
  ret i32 1

}

define i32 @get_X(ptr<i32> %p0) {
entry:
  br label %bb1

bb1:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define i32 @get_IntExtent(ptr<%struct.0> %p0) {
entry:
  %0 = alloca i64, i32 1
  store i64 0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i64>
  br label %bb1

bb1:
  %2 = call i64 @get_Extent(ptr<%struct.0> %p0)
  store i64 %2, ptr %0
  %3 = call i32 @ToIntIndex(ptr<i64> %1)
  ret i32 %3

}

define i32 @ToIntIndex(ptr<i64> %p0) {
entry:
  %0 = alloca i32, i32 1
  %1 = addrspacecast ptr %0 to ptr<i32>
  br label %bb1

bb1:
  %2 = call i64 @get_X(ptr<i64> %p0)
  call void @AssertIntIndexRange(i64 %2)
  %3 = call i64 @get_X(ptr<i64> %p0)
  store i32 0, ptr %1
  %4 = trunc i64 %3 to i32
  call void @.ctor(ptr<i32> %1, i32 %4)
  %5 = load i32, ptr %1
  br label %bb2

bb2:
  ret i32 %5

}

define void @.ctor(ptr<i32> %p0, i32 %p1) {
entry:
  br label %bb1

bb1:
  store i32 %p1, ptr %p0
  ret void

}

define void @AssertIntIndexRange(i64 %p0) {
entry:
  %0 = icmp sge i64 %p0, -2147483648
  %1 = icmp sle i64 %p0, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  br label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  ret void

}

define i64 @get_X(ptr<i64> %p0) {
entry:
  br label %bb1

bb1:
  %0 = load i64, ptr %p0
  ret i64 %0

}

define i64 @get_Extent(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  br label %bb1

bb1:
  %1 = load i64, ptr %0
  ret i64 %1

}

define i8 @get_Stride(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  br label %bb1

bb1:
  %1 = load i8, ptr %0
  ret i8 %1

}

define %view.float @get_BaseView(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  br label %bb1

bb1:
  %1 = load %view.float, ptr %0
  ret %view.float %1

}

define %struct.1 @op_Multiply(%struct.1 %p0, %struct.1 %p1) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.1>
  %2 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %3 = addrspacecast ptr %2 to ptr<float>
  %4 = extractvalue %struct.1 %p0, 0
  %5 = extractvalue %struct.1 %p1, 0
  %6 = fmul float %4, %5
  %7 = extractvalue %struct.1 %p0, 1
  %8 = extractvalue %struct.1 %p1, 4
  %9 = fmul float %7, %8
  %10 = fadd float %6, %9
  %11 = extractvalue %struct.1 %p0, 2
  %12 = extractvalue %struct.1 %p1, 8
  %13 = fmul float %11, %12
  %14 = fadd float %10, %13
  %15 = extractvalue %struct.1 %p0, 3
  %16 = extractvalue %struct.1 %p1, 12
  %17 = fmul float %15, %16
  %18 = fadd float %14, %17
  %19 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %20 = addrspacecast ptr %19 to ptr<float>
  %21 = extractvalue %struct.1 %p0, 0
  %22 = extractvalue %struct.1 %p1, 1
  %23 = fmul float %21, %22
  %24 = extractvalue %struct.1 %p0, 1
  %25 = extractvalue %struct.1 %p1, 5
  %26 = fmul float %24, %25
  %27 = fadd float %23, %26
  %28 = extractvalue %struct.1 %p0, 2
  %29 = extractvalue %struct.1 %p1, 9
  %30 = fmul float %28, %29
  %31 = fadd float %27, %30
  %32 = extractvalue %struct.1 %p0, 3
  %33 = extractvalue %struct.1 %p1, 13
  %34 = fmul float %32, %33
  %35 = fadd float %31, %34
  %36 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 2
  %37 = addrspacecast ptr %36 to ptr<float>
  %38 = extractvalue %struct.1 %p0, 0
  %39 = extractvalue %struct.1 %p1, 2
  %40 = fmul float %38, %39
  %41 = extractvalue %struct.1 %p0, 1
  %42 = extractvalue %struct.1 %p1, 6
  %43 = fmul float %41, %42
  %44 = fadd float %40, %43
  %45 = extractvalue %struct.1 %p0, 2
  %46 = extractvalue %struct.1 %p1, 10
  %47 = fmul float %45, %46
  %48 = fadd float %44, %47
  %49 = extractvalue %struct.1 %p0, 3
  %50 = extractvalue %struct.1 %p1, 14
  %51 = fmul float %49, %50
  %52 = fadd float %48, %51
  %53 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 3
  %54 = addrspacecast ptr %53 to ptr<float>
  %55 = extractvalue %struct.1 %p0, 0
  %56 = extractvalue %struct.1 %p1, 3
  %57 = fmul float %55, %56
  %58 = extractvalue %struct.1 %p0, 1
  %59 = extractvalue %struct.1 %p1, 7
  %60 = fmul float %58, %59
  %61 = fadd float %57, %60
  %62 = extractvalue %struct.1 %p0, 2
  %63 = extractvalue %struct.1 %p1, 11
  %64 = fmul float %62, %63
  %65 = fadd float %61, %64
  %66 = extractvalue %struct.1 %p0, 3
  %67 = extractvalue %struct.1 %p1, 15
  %68 = fmul float %66, %67
  %69 = fadd float %65, %68
  %70 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 4
  %71 = addrspacecast ptr %70 to ptr<float>
  %72 = extractvalue %struct.1 %p0, 4
  %73 = extractvalue %struct.1 %p1, 0
  %74 = fmul float %72, %73
  %75 = extractvalue %struct.1 %p0, 5
  %76 = extractvalue %struct.1 %p1, 4
  %77 = fmul float %75, %76
  %78 = fadd float %74, %77
  %79 = extractvalue %struct.1 %p0, 6
  %80 = extractvalue %struct.1 %p1, 8
  %81 = fmul float %79, %80
  %82 = fadd float %78, %81
  %83 = extractvalue %struct.1 %p0, 7
  %84 = extractvalue %struct.1 %p1, 12
  %85 = fmul float %83, %84
  %86 = fadd float %82, %85
  %87 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 5
  %88 = addrspacecast ptr %87 to ptr<float>
  %89 = extractvalue %struct.1 %p0, 4
  %90 = extractvalue %struct.1 %p1, 1
  %91 = fmul float %89, %90
  %92 = extractvalue %struct.1 %p0, 5
  %93 = extractvalue %struct.1 %p1, 5
  %94 = fmul float %92, %93
  %95 = fadd float %91, %94
  %96 = extractvalue %struct.1 %p0, 6
  %97 = extractvalue %struct.1 %p1, 9
  %98 = fmul float %96, %97
  %99 = fadd float %95, %98
  %100 = extractvalue %struct.1 %p0, 7
  %101 = extractvalue %struct.1 %p1, 13
  %102 = fmul float %100, %101
  %103 = fadd float %99, %102
  %104 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 6
  %105 = addrspacecast ptr %104 to ptr<float>
  %106 = extractvalue %struct.1 %p0, 4
  %107 = extractvalue %struct.1 %p1, 2
  %108 = fmul float %106, %107
  %109 = extractvalue %struct.1 %p0, 5
  %110 = extractvalue %struct.1 %p1, 6
  %111 = fmul float %109, %110
  %112 = fadd float %108, %111
  %113 = extractvalue %struct.1 %p0, 6
  %114 = extractvalue %struct.1 %p1, 10
  %115 = fmul float %113, %114
  %116 = fadd float %112, %115
  %117 = extractvalue %struct.1 %p0, 7
  %118 = extractvalue %struct.1 %p1, 14
  %119 = fmul float %117, %118
  %120 = fadd float %116, %119
  %121 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 7
  %122 = addrspacecast ptr %121 to ptr<float>
  %123 = extractvalue %struct.1 %p0, 4
  %124 = extractvalue %struct.1 %p1, 3
  %125 = fmul float %123, %124
  %126 = extractvalue %struct.1 %p0, 5
  %127 = extractvalue %struct.1 %p1, 7
  %128 = fmul float %126, %127
  %129 = fadd float %125, %128
  %130 = extractvalue %struct.1 %p0, 6
  %131 = extractvalue %struct.1 %p1, 11
  %132 = fmul float %130, %131
  %133 = fadd float %129, %132
  %134 = extractvalue %struct.1 %p0, 7
  %135 = extractvalue %struct.1 %p1, 15
  %136 = fmul float %134, %135
  %137 = fadd float %133, %136
  %138 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 8
  %139 = addrspacecast ptr %138 to ptr<float>
  %140 = extractvalue %struct.1 %p0, 8
  %141 = extractvalue %struct.1 %p1, 0
  %142 = fmul float %140, %141
  %143 = extractvalue %struct.1 %p0, 9
  %144 = extractvalue %struct.1 %p1, 4
  %145 = fmul float %143, %144
  %146 = fadd float %142, %145
  %147 = extractvalue %struct.1 %p0, 10
  %148 = extractvalue %struct.1 %p1, 8
  %149 = fmul float %147, %148
  %150 = fadd float %146, %149
  %151 = extractvalue %struct.1 %p0, 11
  %152 = extractvalue %struct.1 %p1, 12
  %153 = fmul float %151, %152
  %154 = fadd float %150, %153
  %155 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 9
  %156 = addrspacecast ptr %155 to ptr<float>
  %157 = extractvalue %struct.1 %p0, 8
  %158 = extractvalue %struct.1 %p1, 1
  %159 = fmul float %157, %158
  %160 = extractvalue %struct.1 %p0, 9
  %161 = extractvalue %struct.1 %p1, 5
  %162 = fmul float %160, %161
  %163 = fadd float %159, %162
  %164 = extractvalue %struct.1 %p0, 10
  %165 = extractvalue %struct.1 %p1, 9
  %166 = fmul float %164, %165
  %167 = fadd float %163, %166
  %168 = extractvalue %struct.1 %p0, 11
  %169 = extractvalue %struct.1 %p1, 13
  %170 = fmul float %168, %169
  %171 = fadd float %167, %170
  %172 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 10
  %173 = addrspacecast ptr %172 to ptr<float>
  %174 = extractvalue %struct.1 %p0, 8
  %175 = extractvalue %struct.1 %p1, 2
  %176 = fmul float %174, %175
  %177 = extractvalue %struct.1 %p0, 9
  %178 = extractvalue %struct.1 %p1, 6
  %179 = fmul float %177, %178
  %180 = fadd float %176, %179
  %181 = extractvalue %struct.1 %p0, 10
  %182 = extractvalue %struct.1 %p1, 10
  %183 = fmul float %181, %182
  %184 = fadd float %180, %183
  %185 = extractvalue %struct.1 %p0, 11
  %186 = extractvalue %struct.1 %p1, 14
  %187 = fmul float %185, %186
  %188 = fadd float %184, %187
  %189 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 11
  %190 = addrspacecast ptr %189 to ptr<float>
  %191 = extractvalue %struct.1 %p0, 8
  %192 = extractvalue %struct.1 %p1, 3
  %193 = fmul float %191, %192
  %194 = extractvalue %struct.1 %p0, 9
  %195 = extractvalue %struct.1 %p1, 7
  %196 = fmul float %194, %195
  %197 = fadd float %193, %196
  %198 = extractvalue %struct.1 %p0, 10
  %199 = extractvalue %struct.1 %p1, 11
  %200 = fmul float %198, %199
  %201 = fadd float %197, %200
  %202 = extractvalue %struct.1 %p0, 11
  %203 = extractvalue %struct.1 %p1, 15
  %204 = fmul float %202, %203
  %205 = fadd float %201, %204
  %206 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 12
  %207 = addrspacecast ptr %206 to ptr<float>
  %208 = extractvalue %struct.1 %p0, 12
  %209 = extractvalue %struct.1 %p1, 0
  %210 = fmul float %208, %209
  %211 = extractvalue %struct.1 %p0, 13
  %212 = extractvalue %struct.1 %p1, 4
  %213 = fmul float %211, %212
  %214 = fadd float %210, %213
  %215 = extractvalue %struct.1 %p0, 14
  %216 = extractvalue %struct.1 %p1, 8
  %217 = fmul float %215, %216
  %218 = fadd float %214, %217
  %219 = extractvalue %struct.1 %p0, 15
  %220 = extractvalue %struct.1 %p1, 12
  %221 = fmul float %219, %220
  %222 = fadd float %218, %221
  %223 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 13
  %224 = addrspacecast ptr %223 to ptr<float>
  %225 = extractvalue %struct.1 %p0, 12
  %226 = extractvalue %struct.1 %p1, 1
  %227 = fmul float %225, %226
  %228 = extractvalue %struct.1 %p0, 13
  %229 = extractvalue %struct.1 %p1, 5
  %230 = fmul float %228, %229
  %231 = fadd float %227, %230
  %232 = extractvalue %struct.1 %p0, 14
  %233 = extractvalue %struct.1 %p1, 9
  %234 = fmul float %232, %233
  %235 = fadd float %231, %234
  %236 = extractvalue %struct.1 %p0, 15
  %237 = extractvalue %struct.1 %p1, 13
  %238 = fmul float %236, %237
  %239 = fadd float %235, %238
  %240 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 14
  %241 = addrspacecast ptr %240 to ptr<float>
  %242 = extractvalue %struct.1 %p0, 12
  %243 = extractvalue %struct.1 %p1, 2
  %244 = fmul float %242, %243
  %245 = extractvalue %struct.1 %p0, 13
  %246 = extractvalue %struct.1 %p1, 6
  %247 = fmul float %245, %246
  %248 = fadd float %244, %247
  %249 = extractvalue %struct.1 %p0, 14
  %250 = extractvalue %struct.1 %p1, 10
  %251 = fmul float %249, %250
  %252 = fadd float %248, %251
  %253 = extractvalue %struct.1 %p0, 15
  %254 = extractvalue %struct.1 %p1, 14
  %255 = fmul float %253, %254
  %256 = fadd float %252, %255
  %257 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 15
  %258 = addrspacecast ptr %257 to ptr<float>
  %259 = extractvalue %struct.1 %p0, 12
  %260 = extractvalue %struct.1 %p1, 3
  %261 = fmul float %259, %260
  %262 = extractvalue %struct.1 %p0, 13
  %263 = extractvalue %struct.1 %p1, 7
  %264 = fmul float %262, %263
  %265 = fadd float %261, %264
  %266 = extractvalue %struct.1 %p0, 14
  %267 = extractvalue %struct.1 %p1, 11
  %268 = fmul float %266, %267
  %269 = fadd float %265, %268
  %270 = extractvalue %struct.1 %p0, 15
  %271 = extractvalue %struct.1 %p1, 15
  %272 = fmul float %270, %271
  %273 = fadd float %269, %272
  br label %bb1

bb1:
  store %struct.1 null, ptr %1
  store float %18, ptr %3
  store float %35, ptr %20
  store float %52, ptr %37
  store float %69, ptr %54
  store float %86, ptr %71
  store float %103, ptr %88
  store float %120, ptr %105
  store float %137, ptr %122
  store float %154, ptr %139
  store float %171, ptr %156
  store float %188, ptr %173
  store float %205, ptr %190
  store float %222, ptr %207
  store float %239, ptr %224
  store float %256, ptr %241
  store float %273, ptr %258
  %274 = load %struct.1, ptr %1
  br label %bb2

bb2:
  ret %struct.1 %274

}


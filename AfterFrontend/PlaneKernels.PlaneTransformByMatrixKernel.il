; module: PlaneTransformByMatrixKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float }
%struct.2 = type { float, float, float, float }
%struct.3 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }

define void @PlaneTransformByMatrixKernel(i32 %p0, %struct.0 %p1, %struct.2 %p2, %struct.3 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.2, i32 1
  store %struct.2 null, ptr %1
  %2 = addrspacecast ptr %0 to ptr<%struct.0>
  %3 = addrspacecast ptr %1 to ptr<%struct.2>
  br label %bb1

bb1:
  %4 = call ptr<float> @get_Item(ptr<%struct.0> %2, i32 %p0)
  %5 = call %struct.2 @Transform(%struct.2 %p2, %struct.3 %p3)
  store %struct.2 %5, ptr %1
  %6 = call float @Sum(ptr<%struct.2> %3)
  store float %6, ptr %4
  ret void

}

define float @Sum(ptr<%struct.2> %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 0
  %1 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 1
  %2 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 2
  %3 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 3
  br label %bb1

bb1:
  %4 = load float, ptr %0
  %5 = load float, ptr %1
  %6 = load float, ptr %2
  %7 = load float, ptr %3
  %8 = fadd float %4, %5
  %9 = fadd float %8, %6
  %10 = fadd float %9, %7
  ret float %10

}

define %struct.2 @Transform(%struct.2 %p0, %struct.3 %p1) {
entry:
  %0 = alloca %struct.3, i32 1
  store %struct.3 null, ptr %0
  %1 = alloca %struct.2, i32 1
  store %struct.2 null, ptr %1
  %2 = alloca %struct.1, i32 1
  %3 = addrspacecast ptr %0 to ptr<%struct.3>
  %4 = addrspacecast ptr %1 to ptr<%struct.2>
  %5 = addrspacecast ptr %2 to ptr<%struct.1>
  %6 = extractvalue %struct.2 %p0, 0 [Span: 3]
  %7 = extractvalue %struct.1 %6, 0
  %8 = extractvalue %struct.2 %p0, 0 [Span: 3]
  %9 = extractvalue %struct.1 %8, 1
  %10 = extractvalue %struct.2 %p0, 0 [Span: 3]
  %11 = extractvalue %struct.1 %10, 2
  %12 = extractvalue %struct.2 %p0, 3
  %13 = getelementptr inbounds %struct.2, ptr %1, i32 0, i32 0
  %14 = addrspacecast ptr %13 to ptr<%struct.1>
  %15 = getelementptr inbounds %struct.2, ptr %1, i32 0, i32 3
  %16 = addrspacecast ptr %15 to ptr<float>
  br label %bb1

bb1:
  %17 = call i1 @Invert(%struct.3 %p1, ptr<%struct.3> %3)
  store %struct.2 null, ptr %4
  %18 = load %struct.3, ptr %3
  %19 = load %struct.3, ptr %3
  %20 = load %struct.3, ptr %3
  %21 = load %struct.3, ptr %3
  %22 = load %struct.3, ptr %3
  %23 = load %struct.3, ptr %3
  %24 = load %struct.3, ptr %3
  %25 = load %struct.3, ptr %3
  %26 = load %struct.3, ptr %3
  %27 = load %struct.3, ptr %3
  %28 = load %struct.3, ptr %3
  %29 = load %struct.3, ptr %3
  store %struct.1 null, ptr %5
  %30 = extractvalue %struct.3 %18, 0
  %31 = fmul float %7, %30
  %32 = extractvalue %struct.3 %19, 1
  %33 = fmul float %9, %32
  %34 = fadd float %31, %33
  %35 = extractvalue %struct.3 %20, 2
  %36 = fmul float %11, %35
  %37 = fadd float %34, %36
  %38 = extractvalue %struct.3 %21, 3
  %39 = fmul float %12, %38
  %40 = fadd float %37, %39
  %41 = extractvalue %struct.3 %22, 4
  %42 = fmul float %7, %41
  %43 = extractvalue %struct.3 %23, 5
  %44 = fmul float %9, %43
  %45 = fadd float %42, %44
  %46 = extractvalue %struct.3 %24, 6
  %47 = fmul float %11, %46
  %48 = fadd float %45, %47
  %49 = extractvalue %struct.3 %25, 7
  %50 = fmul float %12, %49
  %51 = fadd float %48, %50
  %52 = extractvalue %struct.3 %26, 8
  %53 = fmul float %7, %52
  %54 = extractvalue %struct.3 %27, 9
  %55 = fmul float %9, %54
  %56 = fadd float %53, %55
  %57 = extractvalue %struct.3 %28, 10
  %58 = fmul float %11, %57
  %59 = fadd float %56, %58
  %60 = extractvalue %struct.3 %29, 11
  %61 = fmul float %12, %60
  %62 = fadd float %59, %61
  call void @.ctor(ptr<%struct.1> %5, float %40, float %51, float %62)
  %63 = load %struct.1, ptr %5
  store %struct.1 %63, ptr %14
  %64 = load %struct.3, ptr %3
  %65 = load %struct.3, ptr %3
  %66 = load %struct.3, ptr %3
  %67 = load %struct.3, ptr %3
  %68 = extractvalue %struct.3 %64, 12
  %69 = fmul float %7, %68
  %70 = extractvalue %struct.3 %65, 13
  %71 = fmul float %9, %70
  %72 = fadd float %69, %71
  %73 = extractvalue %struct.3 %66, 14
  %74 = fmul float %11, %73
  %75 = fadd float %72, %74
  %76 = extractvalue %struct.3 %67, 15
  %77 = fmul float %12, %76
  %78 = fadd float %75, %77
  store float %78, ptr %16
  %79 = load %struct.2, ptr %4
  br label %bb2

bb2:
  ret %struct.2 %79

}

define void @.ctor(ptr<%struct.1> %p0, float %p1, float %p2, float %p3) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 0
  %1 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 1
  %2 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 2
  br label %bb1

bb1:
  store float %p1, ptr %0
  store float %p2, ptr %1
  store float %p3, ptr %2
  ret void

}

define i1 @Invert(%struct.3 %p0, ptr<%struct.3> %p1) {
entry:
  %0 = extractvalue %struct.3 %p0, 0
  %1 = extractvalue %struct.3 %p0, 5
  %2 = extractvalue %struct.3 %p0, 10
  %3 = extractvalue %struct.3 %p0, 15
  %4 = fmul float %2, %3
  %5 = extractvalue %struct.3 %p0, 11
  %6 = extractvalue %struct.3 %p0, 14
  %7 = fmul float %5, %6
  %8 = fsub float %4, %7
  %9 = fmul float %1, %8
  %10 = extractvalue %struct.3 %p0, 6
  %11 = extractvalue %struct.3 %p0, 9
  %12 = fmul float %11, %3
  %13 = extractvalue %struct.3 %p0, 13
  %14 = fmul float %5, %13
  %15 = fsub float %12, %14
  %16 = fmul float %10, %15
  %17 = fsub float %9, %16
  %18 = extractvalue %struct.3 %p0, 7
  %19 = fmul float %11, %6
  %20 = fmul float %2, %13
  %21 = fsub float %19, %20
  %22 = fmul float %18, %21
  %23 = fadd float %17, %22
  %24 = fmul float %0, %23
  %25 = extractvalue %struct.3 %p0, 1
  %26 = extractvalue %struct.3 %p0, 4
  %27 = fmul float %26, %8
  %28 = extractvalue %struct.3 %p0, 8
  %29 = fmul float %28, %3
  %30 = extractvalue %struct.3 %p0, 12
  %31 = fmul float %5, %30
  %32 = fsub float %29, %31
  %33 = fmul float %10, %32
  %34 = fsub float %27, %33
  %35 = fmul float %28, %6
  %36 = fmul float %2, %30
  %37 = fsub float %35, %36
  %38 = fmul float %18, %37
  %39 = fadd float %34, %38
  %40 = fneg float %39
  %41 = fmul float %25, %40
  %42 = fadd float %24, %41
  %43 = extractvalue %struct.3 %p0, 2
  %44 = fmul float %26, %15
  %45 = fmul float %1, %32
  %46 = fsub float %44, %45
  %47 = fmul float %28, %13
  %48 = fmul float %11, %30
  %49 = fsub float %47, %48
  %50 = fmul float %18, %49
  %51 = fadd float %46, %50
  %52 = fmul float %43, %51
  %53 = fadd float %42, %52
  %54 = extractvalue %struct.3 %p0, 3
  %55 = fmul float %26, %21
  %56 = fmul float %1, %37
  %57 = fsub float %55, %56
  %58 = fmul float %10, %49
  %59 = fadd float %57, %58
  %60 = fneg float %59
  %61 = fmul float %54, %60
  %62 = fadd float %53, %61
  %63 = call float @llvm.fabs.float(float %62)
  %64 = fcmp uge float %63, 1E-30
  %65 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 0
  %66 = fdiv float 1.0, %62
  %67 = fmul float %23, %66
  %68 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 4
  %69 = fmul float %40, %66
  %70 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 8
  %71 = fmul float %51, %66
  %72 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 12
  %73 = fmul float %60, %66
  %74 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 1
  %75 = fmul float %25, %8
  %76 = fmul float %43, %15
  %77 = fsub float %75, %76
  %78 = fmul float %54, %21
  %79 = fadd float %77, %78
  %80 = fneg float %79
  %81 = fmul float %80, %66
  %82 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 5
  %83 = fmul float %0, %8
  %84 = fmul float %43, %32
  %85 = fsub float %83, %84
  %86 = fmul float %54, %37
  %87 = fadd float %85, %86
  %88 = fmul float %87, %66
  %89 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 9
  %90 = fmul float %0, %15
  %91 = fmul float %25, %32
  %92 = fsub float %90, %91
  %93 = fmul float %54, %49
  %94 = fadd float %92, %93
  %95 = fneg float %94
  %96 = fmul float %95, %66
  %97 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 13
  %98 = fmul float %0, %21
  %99 = fmul float %25, %37
  %100 = fsub float %98, %99
  %101 = fmul float %43, %49
  %102 = fadd float %100, %101
  %103 = fmul float %102, %66
  %104 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 2
  %105 = fmul float %10, %3
  %106 = fmul float %18, %6
  %107 = fsub float %105, %106
  %108 = fmul float %25, %107
  %109 = fmul float %1, %3
  %110 = fmul float %18, %13
  %111 = fsub float %109, %110
  %112 = fmul float %43, %111
  %113 = fsub float %108, %112
  %114 = fmul float %1, %6
  %115 = fmul float %10, %13
  %116 = fsub float %114, %115
  %117 = fmul float %54, %116
  %118 = fadd float %113, %117
  %119 = fmul float %118, %66
  %120 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 6
  %121 = fmul float %0, %107
  %122 = fmul float %26, %3
  %123 = fmul float %18, %30
  %124 = fsub float %122, %123
  %125 = fmul float %43, %124
  %126 = fsub float %121, %125
  %127 = fmul float %26, %6
  %128 = fmul float %10, %30
  %129 = fsub float %127, %128
  %130 = fmul float %54, %129
  %131 = fadd float %126, %130
  %132 = fneg float %131
  %133 = fmul float %132, %66
  %134 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 10
  %135 = fmul float %0, %111
  %136 = fmul float %25, %124
  %137 = fsub float %135, %136
  %138 = fmul float %26, %13
  %139 = fmul float %1, %30
  %140 = fsub float %138, %139
  %141 = fmul float %54, %140
  %142 = fadd float %137, %141
  %143 = fmul float %142, %66
  %144 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 14
  %145 = fmul float %0, %116
  %146 = fmul float %25, %129
  %147 = fsub float %145, %146
  %148 = fmul float %43, %140
  %149 = fadd float %147, %148
  %150 = fneg float %149
  %151 = fmul float %150, %66
  %152 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 3
  %153 = fmul float %10, %5
  %154 = fmul float %18, %2
  %155 = fsub float %153, %154
  %156 = fmul float %25, %155
  %157 = fmul float %1, %5
  %158 = fmul float %18, %11
  %159 = fsub float %157, %158
  %160 = fmul float %43, %159
  %161 = fsub float %156, %160
  %162 = fmul float %1, %2
  %163 = fmul float %10, %11
  %164 = fsub float %162, %163
  %165 = fmul float %54, %164
  %166 = fadd float %161, %165
  %167 = fneg float %166
  %168 = fmul float %167, %66
  %169 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 7
  %170 = fmul float %0, %155
  %171 = fmul float %26, %5
  %172 = fmul float %18, %28
  %173 = fsub float %171, %172
  %174 = fmul float %43, %173
  %175 = fsub float %170, %174
  %176 = fmul float %26, %2
  %177 = fmul float %10, %28
  %178 = fsub float %176, %177
  %179 = fmul float %54, %178
  %180 = fadd float %175, %179
  %181 = fmul float %180, %66
  %182 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 11
  %183 = fmul float %0, %159
  %184 = fmul float %25, %173
  %185 = fsub float %183, %184
  %186 = fmul float %26, %11
  %187 = fmul float %1, %28
  %188 = fsub float %186, %187
  %189 = fmul float %54, %188
  %190 = fadd float %185, %189
  %191 = fneg float %190
  %192 = fmul float %191, %66
  %193 = getelementptr inbounds %struct.3, ptr %p1, i32 0, i32 15
  %194 = fmul float %0, %164
  %195 = fmul float %25, %178
  %196 = fsub float %194, %195
  %197 = fmul float %43, %188
  %198 = fadd float %196, %197
  %199 = fmul float %198, %66
  br label %bb1

bb1:
  br i1 %64, label %bb3, label %bb2

bb2:
  store %struct.3 null, ptr %p1
  br label %bb4

bb3:
  store %struct.3 null, ptr %p1
  store float %67, ptr %65
  store float %69, ptr %68
  store float %71, ptr %70
  store float %73, ptr %72
  store float %81, ptr %74
  store float %88, ptr %82
  store float %96, ptr %89
  store float %103, ptr %97
  store float %119, ptr %104
  store float %133, ptr %120
  store float %143, ptr %134
  store float %151, ptr %144
  store float %168, ptr %152
  store float %181, ptr %169
  store float %192, ptr %182
  store float %199, ptr %193
  br label %bb4

bb4:
  %200 = phi i1 [ false, %bb2 ], [ true, %bb3 ]
  ret i1 %200

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


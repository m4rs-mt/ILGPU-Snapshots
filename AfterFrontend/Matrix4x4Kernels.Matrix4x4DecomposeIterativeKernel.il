; module: Matrix4x4DecomposeIterativeKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }
%struct.2 = type { float, float, float }
%struct.3 = type { float, float, float, float }

define void @Matrix4x4DecomposeIterativeKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.2, i32 1
  store %struct.2 null, ptr %1
  %2 = alloca %struct.3, i32 1
  store %struct.3 null, ptr %2
  %3 = alloca %struct.2, i32 1
  store %struct.2 null, ptr %3
  %4 = addrspacecast ptr %1 to ptr<%struct.2>
  %5 = addrspacecast ptr %2 to ptr<%struct.3>
  %6 = addrspacecast ptr %3 to ptr<%struct.2>
  %7 = addrspacecast ptr %0 to ptr<%struct.0>
  %8 = addrspacecast ptr %1 to ptr<%struct.2>
  %9 = addrspacecast ptr %2 to ptr<%struct.3>
  %10 = addrspacecast ptr %3 to ptr<%struct.2>
  %11 = addrspacecast ptr %0 to ptr<%struct.0>
  br label %bb1

bb1:
  %12 = call i1 @TryDecomposeIterative(%struct.1 %p2, ptr<%struct.2> %4, ptr<%struct.3> %5, ptr<%struct.2> %6, float 9.99999997E-07, i32 16)
  %13 = xor i1 %12, -1
  br i1 %13, label %bb3, label %bb2

bb2:
  %14 = call ptr<float> @get_Item(ptr<%struct.0> %7, i32 %p0)
  %15 = load %struct.2, ptr %8
  %16 = load %struct.2, ptr %8
  %17 = load %struct.2, ptr %8
  %18 = load %struct.3, ptr %9
  %19 = load %struct.3, ptr %9
  %20 = load %struct.3, ptr %9
  %21 = load %struct.3, ptr %9
  %22 = load %struct.2, ptr %10
  %23 = load %struct.2, ptr %10
  %24 = load %struct.2, ptr %10
  %25 = extractvalue %struct.2 %15, 0
  %26 = extractvalue %struct.2 %16, 1
  %27 = fadd float %25, %26
  %28 = extractvalue %struct.2 %17, 2
  %29 = fadd float %27, %28
  %30 = extractvalue %struct.3 %18, 0
  %31 = fadd float %29, %30
  %32 = extractvalue %struct.3 %19, 1
  %33 = fadd float %31, %32
  %34 = extractvalue %struct.3 %20, 2
  %35 = fadd float %33, %34
  %36 = extractvalue %struct.3 %21, 3
  %37 = fadd float %35, %36
  %38 = extractvalue %struct.2 %22, 0
  %39 = fadd float %37, %38
  %40 = extractvalue %struct.2 %23, 1
  %41 = fadd float %39, %40
  %42 = extractvalue %struct.2 %24, 2
  %43 = fadd float %41, %42
  store float %43, ptr %14
  br label %bb4

bb3:
  %44 = call ptr<float> @get_Item(ptr<%struct.0> %11, i32 %p0)
  store float -1.0, ptr %44
  br label %bb4

bb4:
  ret void

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

define i1 @TryDecomposeIterative(%struct.1 %p0, ptr<%struct.2> %p1, ptr<%struct.3> %p2, ptr<%struct.2> %p3, float %p4, i32 %p5) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = getelementptr inbounds %struct.2, ptr %p3, i32 0, i32 0
  %2 = extractvalue %struct.1 %p0, 12
  %3 = getelementptr inbounds %struct.2, ptr %p3, i32 0, i32 1
  %4 = extractvalue %struct.1 %p0, 13
  %5 = getelementptr inbounds %struct.2, ptr %p3, i32 0, i32 2
  %6 = extractvalue %struct.1 %p0, 14
  %7 = extractvalue %struct.1 %p0, 0
  %8 = extractvalue %struct.1 %p0, 1
  %9 = extractvalue %struct.1 %p0, 2
  %10 = extractvalue %struct.1 %p0, 4
  %11 = extractvalue %struct.1 %p0, 5
  %12 = extractvalue %struct.1 %p0, 6
  %13 = extractvalue %struct.1 %p0, 8
  %14 = extractvalue %struct.1 %p0, 9
  %15 = extractvalue %struct.1 %p0, 10
  br label %bb1

bb1:
  store %struct.2 null, ptr %p1
  store %struct.3 null, ptr %p2
  store %struct.2 null, ptr %p3
  store float %2, ptr %1
  store float %4, ptr %3
  store float %6, ptr %5
  br label %bb2

bb2:
  %16 = phi i32 [ 0, %bb1 ], [ %507, %bb38 ]
  %17 = phi i32 [ %p5, %bb1 ], [ %501, %bb38 ]
  %18 = phi %struct.1 [ %p0, %bb1 ], [ %502, %bb38 ]
  %19 = phi float [ %7, %bb1 ], [ %510, %bb38 ]
  %20 = phi float [ %8, %bb1 ], [ %513, %bb38 ]
  %21 = phi float [ %9, %bb1 ], [ %516, %bb38 ]
  %22 = phi float [ %10, %bb1 ], [ %519, %bb38 ]
  %23 = phi float [ %11, %bb1 ], [ %522, %bb38 ]
  %24 = phi float [ %12, %bb1 ], [ %525, %bb38 ]
  %25 = phi float [ %13, %bb1 ], [ %528, %bb38 ]
  %26 = phi float [ %14, %bb1 ], [ %531, %bb38 ]
  %27 = phi float [ %15, %bb1 ], [ %534, %bb38 ]
  %28 = phi ptr<%struct.2> [ %p1, %bb1 ], [ %503, %bb38 ]
  %29 = phi ptr<%struct.1> addrspace(local) [ %0, %bb1 ], [ %504, %bb38 ]
  %30 = phi ptr<%struct.3> [ %p2, %bb1 ], [ %505, %bb38 ]
  %31 = phi i1 [ true, %bb1 ], [ %506, %bb38 ]
  %32 = phi i1 [ false, %bb1 ], [ %536, %bb38 ]
  %33 = phi float [ %p4, %bb1 ], [ %499, %bb38 ]
  %34 = icmp slt i32 %16, %17
  %35 = fmul float %23, %27
  %36 = fmul float %24, %26
  %37 = fsub float %35, %36
  %38 = fmul float %19, %37
  %39 = fmul float %22, %27
  %40 = fmul float %24, %25
  %41 = fsub float %39, %40
  %42 = fmul float %20, %41
  %43 = fsub float %38, %42
  %44 = fmul float %22, %26
  %45 = fmul float %23, %25
  %46 = fsub float %44, %45
  %47 = fmul float %21, %46
  %48 = fadd float %43, %47
  %49 = fcmp olt float %48, 0.0
  %50 = extractvalue %struct.1 %18, 0
  %51 = fmul float %50, %19
  %52 = extractvalue %struct.1 %18, 1
  %53 = fmul float %52, %20
  %54 = fadd float %51, %53
  %55 = extractvalue %struct.1 %18, 2
  %56 = fmul float %55, %21
  %57 = fadd float %54, %56
  %58 = extractvalue %struct.1 %18, 4
  %59 = fmul float %58, %22
  %60 = extractvalue %struct.1 %18, 5
  %61 = fmul float %60, %23
  %62 = fadd float %59, %61
  %63 = extractvalue %struct.1 %18, 6
  %64 = fmul float %63, %24
  %65 = fadd float %62, %64
  %66 = extractvalue %struct.1 %18, 8
  %67 = fmul float %66, %25
  %68 = extractvalue %struct.1 %18, 9
  %69 = fmul float %68, %26
  %70 = fadd float %67, %69
  %71 = extractvalue %struct.1 %18, 10
  %72 = fmul float %71, %27
  %73 = fadd float %70, %72
  %74 = fmul float %23, %27
  %75 = fmul float %24, %26
  %76 = fsub float %74, %75
  %77 = fmul float %19, %76
  %78 = fmul float %22, %27
  %79 = fmul float %24, %25
  %80 = fsub float %78, %79
  %81 = fneg float %80
  %82 = fmul float %20, %81
  %83 = fadd float %77, %82
  %84 = fmul float %22, %26
  %85 = fmul float %23, %25
  %86 = fsub float %84, %85
  %87 = fmul float %21, %86
  %88 = fadd float %83, %87
  %89 = call float @llvm.fabs.float(float %88)
  %90 = fcmp oge float %89, 1E-30
  %91 = xor i1 %32, -1
  %92 = and i1 %90, %91
  %93 = fmul float %20, %27
  %94 = fmul float %21, %26
  %95 = fsub float %93, %94
  %96 = fneg float %95
  %97 = fmul float %19, %27
  %98 = fmul float %21, %25
  %99 = fsub float %97, %98
  %100 = fmul float %19, %26
  %101 = fmul float %20, %25
  %102 = fsub float %100, %101
  %103 = fneg float %102
  %104 = fmul float %20, %24
  %105 = fmul float %21, %23
  %106 = fsub float %104, %105
  %107 = fmul float %19, %24
  %108 = fmul float %21, %22
  %109 = fsub float %107, %108
  %110 = fneg float %109
  %111 = fmul float %19, %23
  %112 = fmul float %20, %22
  %113 = fsub float %111, %112
  %114 = and i1 %31, %90
  br i1 %34, label %bb8, label %bb3

bb3:
  br i1 %49, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %115 = phi float [ 1.0, %bb4 ], [ -1.0, %bb5 ]
  %116 = phi float [ %57, %bb4 ], [ %57, %bb5 ]
  %117 = phi float [ %19, %bb4 ], [ %19, %bb5 ]
  %118 = phi float [ %20, %bb4 ], [ %20, %bb5 ]
  %119 = phi float [ %21, %bb4 ], [ %21, %bb5 ]
  %120 = phi ptr<%struct.2> [ %28, %bb4 ], [ %28, %bb5 ]
  %121 = phi float [ %65, %bb4 ], [ %65, %bb5 ]
  %122 = phi float [ %73, %bb4 ], [ %73, %bb5 ]
  %123 = phi ptr<%struct.1> addrspace(local) [ %29, %bb4 ], [ %29, %bb5 ]
  %124 = phi float [ %22, %bb4 ], [ %22, %bb5 ]
  %125 = phi float [ %23, %bb4 ], [ %23, %bb5 ]
  %126 = phi float [ %24, %bb4 ], [ %24, %bb5 ]
  %127 = phi float [ %25, %bb4 ], [ %25, %bb5 ]
  %128 = phi float [ %26, %bb4 ], [ %26, %bb5 ]
  %129 = phi float [ %27, %bb4 ], [ %27, %bb5 ]
  %130 = phi ptr<%struct.3> [ %30, %bb4 ], [ %30, %bb5 ]
  %131 = phi i1 [ %31, %bb4 ], [ %31, %bb5 ]
  %132 = getelementptr inbounds %struct.2, ptr %120, i32 0, i32 0
  %133 = fmul float %116, %115
  store float %133, ptr %132
  %134 = getelementptr inbounds %struct.2, ptr %120, i32 0, i32 1
  store float %121, ptr %134
  %135 = getelementptr inbounds %struct.2, ptr %120, i32 0, i32 2
  store float %122, ptr %135
  %136 = addrspacecast ptr %123 to ptr<%struct.1>
  store %struct.1 null, ptr %136
  %137 = getelementptr inbounds %struct.1, ptr %123, i32 0, i32 0
  %138 = addrspacecast ptr %137 to ptr<float>
  %139 = fmul float %117, %115
  store float %139, ptr %138
  %140 = getelementptr inbounds %struct.1, ptr %123, i32 0, i32 1
  %141 = addrspacecast ptr %140 to ptr<float>
  %142 = fmul float %118, %115
  store float %142, ptr %141
  %143 = getelementptr inbounds %struct.1, ptr %123, i32 0, i32 2
  %144 = addrspacecast ptr %143 to ptr<float>
  %145 = fmul float %119, %115
  store float %145, ptr %144
  %146 = getelementptr inbounds %struct.1, ptr %123, i32 0, i32 4
  %147 = addrspacecast ptr %146 to ptr<float>
  store float %124, ptr %147
  %148 = getelementptr inbounds %struct.1, ptr %123, i32 0, i32 5
  %149 = addrspacecast ptr %148 to ptr<float>
  store float %125, ptr %149
  %150 = getelementptr inbounds %struct.1, ptr %123, i32 0, i32 6
  %151 = addrspacecast ptr %150 to ptr<float>
  store float %126, ptr %151
  %152 = getelementptr inbounds %struct.1, ptr %123, i32 0, i32 8
  %153 = addrspacecast ptr %152 to ptr<float>
  store float %127, ptr %153
  %154 = getelementptr inbounds %struct.1, ptr %123, i32 0, i32 9
  %155 = addrspacecast ptr %154 to ptr<float>
  store float %128, ptr %155
  %156 = getelementptr inbounds %struct.1, ptr %123, i32 0, i32 10
  %157 = addrspacecast ptr %156 to ptr<float>
  store float %129, ptr %157
  %158 = getelementptr inbounds %struct.1, ptr %123, i32 0, i32 15
  %159 = addrspacecast ptr %158 to ptr<float>
  store float 1.0, ptr %159
  %160 = load %struct.1, ptr %136
  %161 = call %struct.3 @CreateFromRotationMatrix(%struct.1 %160)
  store %struct.3 %161, ptr %130
  br label %bb7

bb7:
  ret i1 %131

bb8:
  br i1 %92, label %bb10, label %bb9

bb9:
  br label %bb11

bb10:
  br label %bb11

bb11:
  %162 = phi float [ 0.0, %bb9 ], [ 1.0, %bb10 ]
  %163 = phi i1 [ %90, %bb9 ], [ %90, %bb10 ]
  %164 = phi float [ %88, %bb9 ], [ %88, %bb10 ]
  %165 = phi float [ %19, %bb9 ], [ %19, %bb10 ]
  %166 = phi float [ %76, %bb9 ], [ %76, %bb10 ]
  %167 = phi float [ %20, %bb9 ], [ %20, %bb10 ]
  %168 = phi float [ %81, %bb9 ], [ %81, %bb10 ]
  %169 = phi float [ %21, %bb9 ], [ %21, %bb10 ]
  %170 = phi float [ %86, %bb9 ], [ %86, %bb10 ]
  %171 = phi float [ %22, %bb9 ], [ %22, %bb10 ]
  %172 = phi float [ %96, %bb9 ], [ %96, %bb10 ]
  %173 = phi float [ %23, %bb9 ], [ %23, %bb10 ]
  %174 = phi float [ %99, %bb9 ], [ %99, %bb10 ]
  %175 = phi float [ %24, %bb9 ], [ %24, %bb10 ]
  %176 = phi float [ %103, %bb9 ], [ %103, %bb10 ]
  %177 = phi float [ %25, %bb9 ], [ %25, %bb10 ]
  %178 = phi float [ %106, %bb9 ], [ %106, %bb10 ]
  %179 = phi float [ %26, %bb9 ], [ %26, %bb10 ]
  %180 = phi float [ %110, %bb9 ], [ %110, %bb10 ]
  %181 = phi float [ %27, %bb9 ], [ %27, %bb10 ]
  %182 = phi float [ %113, %bb9 ], [ %113, %bb10 ]
  %183 = phi i1 [ %32, %bb9 ], [ %32, %bb10 ]
  %184 = phi float [ %33, %bb9 ], [ %33, %bb10 ]
  %185 = phi i32 [ %16, %bb9 ], [ %16, %bb10 ]
  %186 = phi i32 [ %17, %bb9 ], [ %17, %bb10 ]
  %187 = phi %struct.1 [ %18, %bb9 ], [ %18, %bb10 ]
  %188 = phi ptr<%struct.2> [ %28, %bb9 ], [ %28, %bb10 ]
  %189 = phi ptr<%struct.1> addrspace(local) [ %29, %bb9 ], [ %29, %bb10 ]
  %190 = phi ptr<%struct.3> [ %30, %bb9 ], [ %30, %bb10 ]
  %191 = phi i1 [ %114, %bb9 ], [ %114, %bb10 ]
  %192 = fdiv float 1.0, %164
  br i1 %163, label %bb13, label %bb12

bb12:
  br label %bb14

bb13:
  br label %bb14

bb14:
  %193 = phi float [ 0.0, %bb12 ], [ %192, %bb13 ]
  %194 = phi float [ %165, %bb12 ], [ %165, %bb13 ]
  %195 = phi float [ %166, %bb12 ], [ %166, %bb13 ]
  %196 = phi float [ %167, %bb12 ], [ %167, %bb13 ]
  %197 = phi float [ %168, %bb12 ], [ %168, %bb13 ]
  %198 = phi float [ %169, %bb12 ], [ %169, %bb13 ]
  %199 = phi float [ %170, %bb12 ], [ %170, %bb13 ]
  %200 = phi float [ %171, %bb12 ], [ %171, %bb13 ]
  %201 = phi float [ %172, %bb12 ], [ %172, %bb13 ]
  %202 = phi float [ %173, %bb12 ], [ %173, %bb13 ]
  %203 = phi float [ %174, %bb12 ], [ %174, %bb13 ]
  %204 = phi float [ %175, %bb12 ], [ %175, %bb13 ]
  %205 = phi float [ %176, %bb12 ], [ %176, %bb13 ]
  %206 = phi float [ %177, %bb12 ], [ %177, %bb13 ]
  %207 = phi float [ %178, %bb12 ], [ %178, %bb13 ]
  %208 = phi float [ %179, %bb12 ], [ %179, %bb13 ]
  %209 = phi float [ %180, %bb12 ], [ %180, %bb13 ]
  %210 = phi float [ %181, %bb12 ], [ %181, %bb13 ]
  %211 = phi float [ %182, %bb12 ], [ %182, %bb13 ]
  %212 = phi float [ %162, %bb12 ], [ %162, %bb13 ]
  %213 = phi i1 [ %183, %bb12 ], [ %183, %bb13 ]
  %214 = phi float [ %184, %bb12 ], [ %184, %bb13 ]
  %215 = phi i32 [ %185, %bb12 ], [ %185, %bb13 ]
  %216 = phi i32 [ %186, %bb12 ], [ %186, %bb13 ]
  %217 = phi %struct.1 [ %187, %bb12 ], [ %187, %bb13 ]
  %218 = phi ptr<%struct.2> [ %188, %bb12 ], [ %188, %bb13 ]
  %219 = phi ptr<%struct.1> addrspace(local) [ %189, %bb12 ], [ %189, %bb13 ]
  %220 = phi ptr<%struct.3> [ %190, %bb12 ], [ %190, %bb13 ]
  %221 = phi i1 [ %191, %bb12 ], [ %191, %bb13 ]
  %222 = fmul float %197, %193
  %223 = fadd float %196, %222
  %224 = fmul float %223, 0.5
  %225 = fsub float %224, %196
  %226 = call float @llvm.fabs.float(float %225)
  %227 = fmul float %195, %193
  %228 = fadd float %194, %227
  %229 = fmul float %228, 0.5
  %230 = fsub float %229, %194
  %231 = call float @llvm.fabs.float(float %230)
  %232 = fcmp ogt float %226, %231
  %233 = fmul float %199, %193
  %234 = fadd float %198, %233
  %235 = fmul float %234, 0.5
  %236 = fmul float %201, %193
  %237 = fadd float %200, %236
  %238 = fmul float %237, 0.5
  %239 = fmul float %203, %193
  %240 = fadd float %202, %239
  %241 = fmul float %240, 0.5
  %242 = fmul float %205, %193
  %243 = fadd float %204, %242
  %244 = fmul float %243, 0.5
  %245 = fmul float %207, %193
  %246 = fadd float %206, %245
  %247 = fmul float %246, 0.5
  %248 = fmul float %209, %193
  %249 = fadd float %208, %248
  %250 = fmul float %249, 0.5
  %251 = fmul float %211, %193
  %252 = fadd float %210, %251
  %253 = fmul float %252, 0.5
  br i1 %232, label %bb16, label %bb15

bb15:
  br label %bb17

bb16:
  br label %bb17

bb17:
  %254 = phi float [ %231, %bb15 ], [ %226, %bb16 ]
  %255 = phi float [ %235, %bb15 ], [ %235, %bb16 ]
  %256 = phi float [ %198, %bb15 ], [ %198, %bb16 ]
  %257 = phi float [ %238, %bb15 ], [ %238, %bb16 ]
  %258 = phi float [ %200, %bb15 ], [ %200, %bb16 ]
  %259 = phi float [ %241, %bb15 ], [ %241, %bb16 ]
  %260 = phi float [ %202, %bb15 ], [ %202, %bb16 ]
  %261 = phi float [ %244, %bb15 ], [ %244, %bb16 ]
  %262 = phi float [ %204, %bb15 ], [ %204, %bb16 ]
  %263 = phi float [ %247, %bb15 ], [ %247, %bb16 ]
  %264 = phi float [ %206, %bb15 ], [ %206, %bb16 ]
  %265 = phi float [ %250, %bb15 ], [ %250, %bb16 ]
  %266 = phi float [ %208, %bb15 ], [ %208, %bb16 ]
  %267 = phi float [ %253, %bb15 ], [ %253, %bb16 ]
  %268 = phi float [ %210, %bb15 ], [ %210, %bb16 ]
  %269 = phi float [ %194, %bb15 ], [ %194, %bb16 ]
  %270 = phi float [ %229, %bb15 ], [ %229, %bb16 ]
  %271 = phi float [ %212, %bb15 ], [ %212, %bb16 ]
  %272 = phi float [ %196, %bb15 ], [ %196, %bb16 ]
  %273 = phi float [ %224, %bb15 ], [ %224, %bb16 ]
  %274 = phi i1 [ %213, %bb15 ], [ %213, %bb16 ]
  %275 = phi float [ %214, %bb15 ], [ %214, %bb16 ]
  %276 = phi i32 [ %215, %bb15 ], [ %215, %bb16 ]
  %277 = phi i32 [ %216, %bb15 ], [ %216, %bb16 ]
  %278 = phi %struct.1 [ %217, %bb15 ], [ %217, %bb16 ]
  %279 = phi ptr<%struct.2> [ %218, %bb15 ], [ %218, %bb16 ]
  %280 = phi ptr<%struct.1> addrspace(local) [ %219, %bb15 ], [ %219, %bb16 ]
  %281 = phi ptr<%struct.3> [ %220, %bb15 ], [ %220, %bb16 ]
  %282 = phi i1 [ %221, %bb15 ], [ %221, %bb16 ]
  %283 = fsub float %255, %256
  %284 = call float @llvm.fabs.float(float %283)
  %285 = fcmp ogt float %284, %254
  br i1 %285, label %bb19, label %bb18

bb18:
  br label %bb20

bb19:
  br label %bb20

bb20:
  %286 = phi float [ %254, %bb18 ], [ %284, %bb19 ]
  %287 = phi float [ %257, %bb18 ], [ %257, %bb19 ]
  %288 = phi float [ %258, %bb18 ], [ %258, %bb19 ]
  %289 = phi float [ %259, %bb18 ], [ %259, %bb19 ]
  %290 = phi float [ %260, %bb18 ], [ %260, %bb19 ]
  %291 = phi float [ %261, %bb18 ], [ %261, %bb19 ]
  %292 = phi float [ %262, %bb18 ], [ %262, %bb19 ]
  %293 = phi float [ %263, %bb18 ], [ %263, %bb19 ]
  %294 = phi float [ %264, %bb18 ], [ %264, %bb19 ]
  %295 = phi float [ %265, %bb18 ], [ %265, %bb19 ]
  %296 = phi float [ %266, %bb18 ], [ %266, %bb19 ]
  %297 = phi float [ %267, %bb18 ], [ %267, %bb19 ]
  %298 = phi float [ %268, %bb18 ], [ %268, %bb19 ]
  %299 = phi float [ %269, %bb18 ], [ %269, %bb19 ]
  %300 = phi float [ %270, %bb18 ], [ %270, %bb19 ]
  %301 = phi float [ %271, %bb18 ], [ %271, %bb19 ]
  %302 = phi float [ %272, %bb18 ], [ %272, %bb19 ]
  %303 = phi float [ %273, %bb18 ], [ %273, %bb19 ]
  %304 = phi float [ %256, %bb18 ], [ %256, %bb19 ]
  %305 = phi float [ %255, %bb18 ], [ %255, %bb19 ]
  %306 = phi i1 [ %274, %bb18 ], [ %274, %bb19 ]
  %307 = phi float [ %275, %bb18 ], [ %275, %bb19 ]
  %308 = phi i32 [ %276, %bb18 ], [ %276, %bb19 ]
  %309 = phi i32 [ %277, %bb18 ], [ %277, %bb19 ]
  %310 = phi %struct.1 [ %278, %bb18 ], [ %278, %bb19 ]
  %311 = phi ptr<%struct.2> [ %279, %bb18 ], [ %279, %bb19 ]
  %312 = phi ptr<%struct.1> addrspace(local) [ %280, %bb18 ], [ %280, %bb19 ]
  %313 = phi ptr<%struct.3> [ %281, %bb18 ], [ %281, %bb19 ]
  %314 = phi i1 [ %282, %bb18 ], [ %282, %bb19 ]
  %315 = fsub float %287, %288
  %316 = call float @llvm.fabs.float(float %315)
  %317 = fcmp ogt float %316, %286
  br i1 %317, label %bb22, label %bb21

bb21:
  br label %bb23

bb22:
  br label %bb23

bb23:
  %318 = phi float [ %286, %bb21 ], [ %316, %bb22 ]
  %319 = phi float [ %289, %bb21 ], [ %289, %bb22 ]
  %320 = phi float [ %290, %bb21 ], [ %290, %bb22 ]
  %321 = phi float [ %291, %bb21 ], [ %291, %bb22 ]
  %322 = phi float [ %292, %bb21 ], [ %292, %bb22 ]
  %323 = phi float [ %293, %bb21 ], [ %293, %bb22 ]
  %324 = phi float [ %294, %bb21 ], [ %294, %bb22 ]
  %325 = phi float [ %295, %bb21 ], [ %295, %bb22 ]
  %326 = phi float [ %296, %bb21 ], [ %296, %bb22 ]
  %327 = phi float [ %297, %bb21 ], [ %297, %bb22 ]
  %328 = phi float [ %298, %bb21 ], [ %298, %bb22 ]
  %329 = phi float [ %299, %bb21 ], [ %299, %bb22 ]
  %330 = phi float [ %300, %bb21 ], [ %300, %bb22 ]
  %331 = phi float [ %301, %bb21 ], [ %301, %bb22 ]
  %332 = phi float [ %302, %bb21 ], [ %302, %bb22 ]
  %333 = phi float [ %303, %bb21 ], [ %303, %bb22 ]
  %334 = phi float [ %304, %bb21 ], [ %304, %bb22 ]
  %335 = phi float [ %305, %bb21 ], [ %305, %bb22 ]
  %336 = phi float [ %288, %bb21 ], [ %288, %bb22 ]
  %337 = phi float [ %287, %bb21 ], [ %287, %bb22 ]
  %338 = phi i1 [ %306, %bb21 ], [ %306, %bb22 ]
  %339 = phi float [ %307, %bb21 ], [ %307, %bb22 ]
  %340 = phi i32 [ %308, %bb21 ], [ %308, %bb22 ]
  %341 = phi i32 [ %309, %bb21 ], [ %309, %bb22 ]
  %342 = phi %struct.1 [ %310, %bb21 ], [ %310, %bb22 ]
  %343 = phi ptr<%struct.2> [ %311, %bb21 ], [ %311, %bb22 ]
  %344 = phi ptr<%struct.1> addrspace(local) [ %312, %bb21 ], [ %312, %bb22 ]
  %345 = phi ptr<%struct.3> [ %313, %bb21 ], [ %313, %bb22 ]
  %346 = phi i1 [ %314, %bb21 ], [ %314, %bb22 ]
  %347 = fsub float %319, %320
  %348 = call float @llvm.fabs.float(float %347)
  %349 = fcmp ogt float %348, %318
  br i1 %349, label %bb25, label %bb24

bb24:
  br label %bb26

bb25:
  br label %bb26

bb26:
  %350 = phi float [ %318, %bb24 ], [ %348, %bb25 ]
  %351 = phi float [ %321, %bb24 ], [ %321, %bb25 ]
  %352 = phi float [ %322, %bb24 ], [ %322, %bb25 ]
  %353 = phi float [ %323, %bb24 ], [ %323, %bb25 ]
  %354 = phi float [ %324, %bb24 ], [ %324, %bb25 ]
  %355 = phi float [ %325, %bb24 ], [ %325, %bb25 ]
  %356 = phi float [ %326, %bb24 ], [ %326, %bb25 ]
  %357 = phi float [ %327, %bb24 ], [ %327, %bb25 ]
  %358 = phi float [ %328, %bb24 ], [ %328, %bb25 ]
  %359 = phi float [ %329, %bb24 ], [ %329, %bb25 ]
  %360 = phi float [ %330, %bb24 ], [ %330, %bb25 ]
  %361 = phi float [ %331, %bb24 ], [ %331, %bb25 ]
  %362 = phi float [ %332, %bb24 ], [ %332, %bb25 ]
  %363 = phi float [ %333, %bb24 ], [ %333, %bb25 ]
  %364 = phi float [ %334, %bb24 ], [ %334, %bb25 ]
  %365 = phi float [ %335, %bb24 ], [ %335, %bb25 ]
  %366 = phi float [ %336, %bb24 ], [ %336, %bb25 ]
  %367 = phi float [ %337, %bb24 ], [ %337, %bb25 ]
  %368 = phi float [ %320, %bb24 ], [ %320, %bb25 ]
  %369 = phi float [ %319, %bb24 ], [ %319, %bb25 ]
  %370 = phi i1 [ %338, %bb24 ], [ %338, %bb25 ]
  %371 = phi float [ %339, %bb24 ], [ %339, %bb25 ]
  %372 = phi i32 [ %340, %bb24 ], [ %340, %bb25 ]
  %373 = phi i32 [ %341, %bb24 ], [ %341, %bb25 ]
  %374 = phi %struct.1 [ %342, %bb24 ], [ %342, %bb25 ]
  %375 = phi ptr<%struct.2> [ %343, %bb24 ], [ %343, %bb25 ]
  %376 = phi ptr<%struct.1> addrspace(local) [ %344, %bb24 ], [ %344, %bb25 ]
  %377 = phi ptr<%struct.3> [ %345, %bb24 ], [ %345, %bb25 ]
  %378 = phi i1 [ %346, %bb24 ], [ %346, %bb25 ]
  %379 = fsub float %351, %352
  %380 = call float @llvm.fabs.float(float %379)
  %381 = fcmp ogt float %380, %350
  br i1 %381, label %bb28, label %bb27

bb27:
  br label %bb29

bb28:
  br label %bb29

bb29:
  %382 = phi float [ %350, %bb27 ], [ %380, %bb28 ]
  %383 = phi float [ %353, %bb27 ], [ %353, %bb28 ]
  %384 = phi float [ %354, %bb27 ], [ %354, %bb28 ]
  %385 = phi float [ %355, %bb27 ], [ %355, %bb28 ]
  %386 = phi float [ %356, %bb27 ], [ %356, %bb28 ]
  %387 = phi float [ %357, %bb27 ], [ %357, %bb28 ]
  %388 = phi float [ %358, %bb27 ], [ %358, %bb28 ]
  %389 = phi float [ %359, %bb27 ], [ %359, %bb28 ]
  %390 = phi float [ %360, %bb27 ], [ %360, %bb28 ]
  %391 = phi float [ %361, %bb27 ], [ %361, %bb28 ]
  %392 = phi float [ %362, %bb27 ], [ %362, %bb28 ]
  %393 = phi float [ %363, %bb27 ], [ %363, %bb28 ]
  %394 = phi float [ %364, %bb27 ], [ %364, %bb28 ]
  %395 = phi float [ %365, %bb27 ], [ %365, %bb28 ]
  %396 = phi float [ %366, %bb27 ], [ %366, %bb28 ]
  %397 = phi float [ %367, %bb27 ], [ %367, %bb28 ]
  %398 = phi float [ %368, %bb27 ], [ %368, %bb28 ]
  %399 = phi float [ %369, %bb27 ], [ %369, %bb28 ]
  %400 = phi float [ %352, %bb27 ], [ %352, %bb28 ]
  %401 = phi float [ %351, %bb27 ], [ %351, %bb28 ]
  %402 = phi i1 [ %370, %bb27 ], [ %370, %bb28 ]
  %403 = phi float [ %371, %bb27 ], [ %371, %bb28 ]
  %404 = phi i32 [ %372, %bb27 ], [ %372, %bb28 ]
  %405 = phi i32 [ %373, %bb27 ], [ %373, %bb28 ]
  %406 = phi %struct.1 [ %374, %bb27 ], [ %374, %bb28 ]
  %407 = phi ptr<%struct.2> [ %375, %bb27 ], [ %375, %bb28 ]
  %408 = phi ptr<%struct.1> addrspace(local) [ %376, %bb27 ], [ %376, %bb28 ]
  %409 = phi ptr<%struct.3> [ %377, %bb27 ], [ %377, %bb28 ]
  %410 = phi i1 [ %378, %bb27 ], [ %378, %bb28 ]
  %411 = fsub float %383, %384
  %412 = call float @llvm.fabs.float(float %411)
  %413 = fcmp ogt float %412, %382
  br i1 %413, label %bb31, label %bb30

bb30:
  br label %bb32

bb31:
  br label %bb32

bb32:
  %414 = phi float [ %382, %bb30 ], [ %412, %bb31 ]
  %415 = phi float [ %385, %bb30 ], [ %385, %bb31 ]
  %416 = phi float [ %386, %bb30 ], [ %386, %bb31 ]
  %417 = phi float [ %387, %bb30 ], [ %387, %bb31 ]
  %418 = phi float [ %388, %bb30 ], [ %388, %bb31 ]
  %419 = phi float [ %389, %bb30 ], [ %389, %bb31 ]
  %420 = phi float [ %390, %bb30 ], [ %390, %bb31 ]
  %421 = phi float [ %391, %bb30 ], [ %391, %bb31 ]
  %422 = phi float [ %392, %bb30 ], [ %392, %bb31 ]
  %423 = phi float [ %393, %bb30 ], [ %393, %bb31 ]
  %424 = phi float [ %394, %bb30 ], [ %394, %bb31 ]
  %425 = phi float [ %395, %bb30 ], [ %395, %bb31 ]
  %426 = phi float [ %396, %bb30 ], [ %396, %bb31 ]
  %427 = phi float [ %397, %bb30 ], [ %397, %bb31 ]
  %428 = phi float [ %398, %bb30 ], [ %398, %bb31 ]
  %429 = phi float [ %399, %bb30 ], [ %399, %bb31 ]
  %430 = phi float [ %400, %bb30 ], [ %400, %bb31 ]
  %431 = phi float [ %401, %bb30 ], [ %401, %bb31 ]
  %432 = phi float [ %384, %bb30 ], [ %384, %bb31 ]
  %433 = phi float [ %383, %bb30 ], [ %383, %bb31 ]
  %434 = phi i1 [ %402, %bb30 ], [ %402, %bb31 ]
  %435 = phi float [ %403, %bb30 ], [ %403, %bb31 ]
  %436 = phi i32 [ %404, %bb30 ], [ %404, %bb31 ]
  %437 = phi i32 [ %405, %bb30 ], [ %405, %bb31 ]
  %438 = phi %struct.1 [ %406, %bb30 ], [ %406, %bb31 ]
  %439 = phi ptr<%struct.2> [ %407, %bb30 ], [ %407, %bb31 ]
  %440 = phi ptr<%struct.1> addrspace(local) [ %408, %bb30 ], [ %408, %bb31 ]
  %441 = phi ptr<%struct.3> [ %409, %bb30 ], [ %409, %bb31 ]
  %442 = phi i1 [ %410, %bb30 ], [ %410, %bb31 ]
  %443 = fsub float %415, %416
  %444 = call float @llvm.fabs.float(float %443)
  %445 = fcmp ogt float %444, %414
  br i1 %445, label %bb34, label %bb33

bb33:
  br label %bb35

bb34:
  br label %bb35

bb35:
  %446 = phi float [ %414, %bb33 ], [ %444, %bb34 ]
  %447 = phi float [ %417, %bb33 ], [ %417, %bb34 ]
  %448 = phi float [ %418, %bb33 ], [ %418, %bb34 ]
  %449 = phi float [ %419, %bb33 ], [ %419, %bb34 ]
  %450 = phi float [ %420, %bb33 ], [ %420, %bb34 ]
  %451 = phi float [ %421, %bb33 ], [ %421, %bb34 ]
  %452 = phi float [ %422, %bb33 ], [ %422, %bb34 ]
  %453 = phi float [ %423, %bb33 ], [ %423, %bb34 ]
  %454 = phi float [ %424, %bb33 ], [ %424, %bb34 ]
  %455 = phi float [ %425, %bb33 ], [ %425, %bb34 ]
  %456 = phi float [ %426, %bb33 ], [ %426, %bb34 ]
  %457 = phi float [ %427, %bb33 ], [ %427, %bb34 ]
  %458 = phi float [ %428, %bb33 ], [ %428, %bb34 ]
  %459 = phi float [ %429, %bb33 ], [ %429, %bb34 ]
  %460 = phi float [ %430, %bb33 ], [ %430, %bb34 ]
  %461 = phi float [ %431, %bb33 ], [ %431, %bb34 ]
  %462 = phi float [ %432, %bb33 ], [ %432, %bb34 ]
  %463 = phi float [ %433, %bb33 ], [ %433, %bb34 ]
  %464 = phi float [ %416, %bb33 ], [ %416, %bb34 ]
  %465 = phi float [ %415, %bb33 ], [ %415, %bb34 ]
  %466 = phi i1 [ %434, %bb33 ], [ %434, %bb34 ]
  %467 = phi float [ %435, %bb33 ], [ %435, %bb34 ]
  %468 = phi i32 [ %436, %bb33 ], [ %436, %bb34 ]
  %469 = phi i32 [ %437, %bb33 ], [ %437, %bb34 ]
  %470 = phi %struct.1 [ %438, %bb33 ], [ %438, %bb34 ]
  %471 = phi ptr<%struct.2> [ %439, %bb33 ], [ %439, %bb34 ]
  %472 = phi ptr<%struct.1> addrspace(local) [ %440, %bb33 ], [ %440, %bb34 ]
  %473 = phi ptr<%struct.3> [ %441, %bb33 ], [ %441, %bb34 ]
  %474 = phi i1 [ %442, %bb33 ], [ %442, %bb34 ]
  %475 = fsub float %447, %448
  %476 = call float @llvm.fabs.float(float %475)
  %477 = fcmp ogt float %476, %446
  br i1 %477, label %bb37, label %bb36

bb36:
  br label %bb38

bb37:
  br label %bb38

bb38:
  %478 = phi float [ %446, %bb36 ], [ %476, %bb37 ]
  %479 = phi float [ %449, %bb36 ], [ %449, %bb37 ]
  %480 = phi float [ %450, %bb36 ], [ %450, %bb37 ]
  %481 = phi float [ %451, %bb36 ], [ %451, %bb37 ]
  %482 = phi float [ %452, %bb36 ], [ %452, %bb37 ]
  %483 = phi float [ %453, %bb36 ], [ %453, %bb37 ]
  %484 = phi float [ %454, %bb36 ], [ %454, %bb37 ]
  %485 = phi float [ %455, %bb36 ], [ %455, %bb37 ]
  %486 = phi float [ %456, %bb36 ], [ %456, %bb37 ]
  %487 = phi float [ %457, %bb36 ], [ %457, %bb37 ]
  %488 = phi float [ %458, %bb36 ], [ %458, %bb37 ]
  %489 = phi float [ %459, %bb36 ], [ %459, %bb37 ]
  %490 = phi float [ %460, %bb36 ], [ %460, %bb37 ]
  %491 = phi float [ %461, %bb36 ], [ %461, %bb37 ]
  %492 = phi float [ %462, %bb36 ], [ %462, %bb37 ]
  %493 = phi float [ %463, %bb36 ], [ %463, %bb37 ]
  %494 = phi float [ %464, %bb36 ], [ %464, %bb37 ]
  %495 = phi float [ %465, %bb36 ], [ %465, %bb37 ]
  %496 = phi float [ %448, %bb36 ], [ %448, %bb37 ]
  %497 = phi float [ %447, %bb36 ], [ %447, %bb37 ]
  %498 = phi i1 [ %466, %bb36 ], [ %466, %bb37 ]
  %499 = phi float [ %467, %bb36 ], [ %467, %bb37 ]
  %500 = phi i32 [ %468, %bb36 ], [ %468, %bb37 ]
  %501 = phi i32 [ %469, %bb36 ], [ %469, %bb37 ]
  %502 = phi %struct.1 [ %470, %bb36 ], [ %470, %bb37 ]
  %503 = phi ptr<%struct.2> [ %471, %bb36 ], [ %471, %bb37 ]
  %504 = phi ptr<%struct.1> addrspace(local) [ %472, %bb36 ], [ %472, %bb37 ]
  %505 = phi ptr<%struct.3> [ %473, %bb36 ], [ %473, %bb37 ]
  %506 = phi i1 [ %474, %bb36 ], [ %474, %bb37 ]
  %507 = add i32 %500, 1
  %508 = fsub float %480, %479
  %509 = fmul float %508, %481
  %510 = fadd float %479, %509
  %511 = fsub float %483, %482
  %512 = fmul float %511, %481
  %513 = fadd float %482, %512
  %514 = fsub float %485, %484
  %515 = fmul float %514, %481
  %516 = fadd float %484, %515
  %517 = fsub float %487, %486
  %518 = fmul float %517, %481
  %519 = fadd float %486, %518
  %520 = fsub float %489, %488
  %521 = fmul float %520, %481
  %522 = fadd float %488, %521
  %523 = fsub float %491, %490
  %524 = fmul float %523, %481
  %525 = fadd float %490, %524
  %526 = fsub float %493, %492
  %527 = fmul float %526, %481
  %528 = fadd float %492, %527
  %529 = fsub float %495, %494
  %530 = fmul float %529, %481
  %531 = fadd float %494, %530
  %532 = fsub float %497, %496
  %533 = fmul float %532, %481
  %534 = fadd float %496, %533
  %535 = fcmp olt float %478, %499
  %536 = or i1 %498, %535
  br label %bb2

}

define %struct.3 @CreateFromRotationMatrix(%struct.1 %p0) {
entry:
  %0 = alloca %struct.3, i32 1
  store %struct.3 null, ptr %0
  %1 = extractvalue %struct.1 %p0, 0
  %2 = extractvalue %struct.1 %p0, 5
  %3 = fadd float %1, %2
  %4 = extractvalue %struct.1 %p0, 10
  %5 = fadd float %3, %4
  %6 = fcmp ule float %5, 0.0
  %7 = extractvalue %struct.1 %p0, 0
  %8 = extractvalue %struct.1 %p0, 5
  %9 = fcmp ult float %7, %8
  %10 = extractvalue %struct.1 %p0, 0
  %11 = extractvalue %struct.1 %p0, 10
  %12 = fcmp oge float %10, %11
  %13 = extractvalue %struct.1 %p0, 6
  %14 = extractvalue %struct.1 %p0, 9
  %15 = fsub float %13, %14
  %16 = fadd float %5, 1.0
  %17 = call float @llvm.sqrt.float(float %16)
  %18 = fdiv float 0.5, %17
  %19 = fmul float %15, %18
  %20 = extractvalue %struct.1 %p0, 8
  %21 = extractvalue %struct.1 %p0, 2
  %22 = fsub float %20, %21
  %23 = fmul float %22, %18
  %24 = extractvalue %struct.1 %p0, 1
  %25 = extractvalue %struct.1 %p0, 4
  %26 = fsub float %24, %25
  %27 = fmul float %26, %18
  %28 = fmul float %17, 0.5
  br label %bb1

bb1:
  br i1 %6, label %bb3, label %bb2

bb2:
  br label %bb11

bb3:
  br i1 %9, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %29 = phi i1 [ %12, %bb4 ], [ false, %bb5 ]
  %30 = phi %struct.1 [ %p0, %bb4 ], [ %p0, %bb5 ]
  %31 = phi ptr<%struct.3> addrspace(local) [ %0, %bb4 ], [ %0, %bb5 ]
  %32 = xor i1 %29, -1
  %33 = extractvalue %struct.1 %30, 5
  %34 = extractvalue %struct.1 %30, 10
  %35 = fcmp ule float %33, %34
  %36 = extractvalue %struct.1 %30, 0
  %37 = fadd float %36, 1.0
  %38 = extractvalue %struct.1 %30, 5
  %39 = fsub float %37, %38
  %40 = extractvalue %struct.1 %30, 10
  %41 = fsub float %39, %40
  %42 = call float @llvm.sqrt.float(float %41)
  %43 = fmul float %42, 0.5
  %44 = extractvalue %struct.1 %30, 4
  %45 = extractvalue %struct.1 %30, 1
  %46 = fadd float %44, %45
  %47 = extractvalue %struct.1 %30, 5
  %48 = fadd float %47, 1.0
  %49 = extractvalue %struct.1 %30, 0
  %50 = fsub float %48, %49
  %51 = extractvalue %struct.1 %30, 10
  %52 = fsub float %50, %51
  %53 = call float @llvm.sqrt.float(float %52)
  %54 = fdiv float 0.5, %53
  %55 = fmul float %46, %54
  %56 = extractvalue %struct.1 %30, 8
  %57 = extractvalue %struct.1 %30, 2
  %58 = fadd float %56, %57
  %59 = extractvalue %struct.1 %30, 10
  %60 = fadd float %59, 1.0
  %61 = extractvalue %struct.1 %30, 0
  %62 = fsub float %60, %61
  %63 = extractvalue %struct.1 %30, 5
  %64 = fsub float %62, %63
  %65 = call float @llvm.sqrt.float(float %64)
  %66 = fdiv float 0.5, %65
  %67 = fmul float %58, %66
  %68 = extractvalue %struct.1 %30, 1
  %69 = extractvalue %struct.1 %30, 4
  %70 = fadd float %68, %69
  %71 = fdiv float 0.5, %42
  %72 = fmul float %70, %71
  %73 = fmul float %53, 0.5
  %74 = extractvalue %struct.1 %30, 9
  %75 = extractvalue %struct.1 %30, 6
  %76 = fadd float %74, %75
  %77 = fmul float %76, %66
  %78 = extractvalue %struct.1 %30, 2
  %79 = extractvalue %struct.1 %30, 8
  %80 = fadd float %78, %79
  %81 = fmul float %80, %71
  %82 = extractvalue %struct.1 %30, 9
  %83 = extractvalue %struct.1 %30, 6
  %84 = fadd float %82, %83
  %85 = fmul float %84, %54
  %86 = fmul float %65, 0.5
  %87 = extractvalue %struct.1 %30, 6
  %88 = extractvalue %struct.1 %30, 9
  %89 = fsub float %87, %88
  %90 = fmul float %89, %71
  %91 = extractvalue %struct.1 %30, 8
  %92 = extractvalue %struct.1 %30, 2
  %93 = fsub float %91, %92
  %94 = fmul float %93, %54
  %95 = extractvalue %struct.1 %30, 1
  %96 = extractvalue %struct.1 %30, 4
  %97 = fsub float %95, %96
  %98 = fmul float %97, %66
  br i1 %32, label %bb8, label %bb7

bb7:
  br label %bb11

bb8:
  br i1 %35, label %bb10, label %bb9

bb9:
  br label %bb11

bb10:
  br label %bb11

bb11:
  %99 = phi ptr<%struct.3> addrspace(local) [ %0, %bb2 ], [ %31, %bb7 ], [ %31, %bb9 ], [ %31, %bb10 ]
  %100 = phi float [ %19, %bb2 ], [ %43, %bb7 ], [ %55, %bb9 ], [ %67, %bb10 ]
  %101 = phi float [ %23, %bb2 ], [ %72, %bb7 ], [ %73, %bb9 ], [ %77, %bb10 ]
  %102 = phi float [ %27, %bb2 ], [ %81, %bb7 ], [ %85, %bb9 ], [ %86, %bb10 ]
  %103 = phi float [ %28, %bb2 ], [ %90, %bb7 ], [ %94, %bb9 ], [ %98, %bb10 ]
  %104 = addrspacecast ptr %99 to ptr<%struct.3>
  store %struct.3 null, ptr %104
  %105 = getelementptr inbounds %struct.3, ptr %99, i32 0, i32 0
  %106 = addrspacecast ptr %105 to ptr<float>
  store float %100, ptr %106
  %107 = getelementptr inbounds %struct.3, ptr %99, i32 0, i32 1
  %108 = addrspacecast ptr %107 to ptr<float>
  store float %101, ptr %108
  %109 = getelementptr inbounds %struct.3, ptr %99, i32 0, i32 2
  %110 = addrspacecast ptr %109 to ptr<float>
  store float %102, ptr %110
  %111 = getelementptr inbounds %struct.3, ptr %99, i32 0, i32 3
  %112 = addrspacecast ptr %111 to ptr<float>
  store float %103, ptr %112
  %113 = load %struct.3, ptr %104
  br label %bb12

bb12:
  ret %struct.3 %113

}


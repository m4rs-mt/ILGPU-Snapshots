; module: Matrix4x4TransformByQuaternionKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }
%struct.2 = type { float, float, float, float }

define void @Matrix4x4TransformByQuaternionKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2, %struct.2 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.0>
  br label %bb1

bb1:
  %2 = call %struct.1 @Transform(%struct.1 %p2, %struct.2 %p3)
  %3 = call ptr<float> @get_Item(ptr<%struct.0> %1, i32 %p0)
  %4 = extractvalue %struct.1 %2, 0
  %5 = extractvalue %struct.1 %2, 5
  %6 = fadd float %4, %5
  %7 = extractvalue %struct.1 %2, 10
  %8 = fadd float %6, %7
  %9 = extractvalue %struct.1 %2, 15
  %10 = fadd float %8, %9
  store float %10, ptr %3
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

define %struct.1 @Transform(%struct.1 %p0, %struct.2 %p1) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.1>
  %2 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %3 = addrspacecast ptr %2 to ptr<float>
  %4 = extractvalue %struct.1 %p0, 0
  %5 = extractvalue %struct.2 %p1, 1
  %6 = extractvalue %struct.2 %p1, 1
  %7 = extractvalue %struct.2 %p1, 1
  %8 = fadd float %6, %7
  %9 = fmul float %5, %8
  %10 = fsub float 1.0, %9
  %11 = extractvalue %struct.2 %p1, 2
  %12 = extractvalue %struct.2 %p1, 2
  %13 = extractvalue %struct.2 %p1, 2
  %14 = fadd float %12, %13
  %15 = fmul float %11, %14
  %16 = fsub float %10, %15
  %17 = fmul float %4, %16
  %18 = extractvalue %struct.1 %p0, 1
  %19 = extractvalue %struct.2 %p1, 0
  %20 = fmul float %19, %8
  %21 = extractvalue %struct.2 %p1, 3
  %22 = fmul float %21, %14
  %23 = fsub float %20, %22
  %24 = fmul float %18, %23
  %25 = fadd float %17, %24
  %26 = extractvalue %struct.1 %p0, 2
  %27 = extractvalue %struct.2 %p1, 0
  %28 = fmul float %27, %14
  %29 = extractvalue %struct.2 %p1, 3
  %30 = fmul float %29, %8
  %31 = fadd float %28, %30
  %32 = fmul float %26, %31
  %33 = fadd float %25, %32
  %34 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %35 = addrspacecast ptr %34 to ptr<float>
  %36 = extractvalue %struct.1 %p0, 0
  %37 = fadd float %20, %22
  %38 = fmul float %36, %37
  %39 = extractvalue %struct.1 %p0, 1
  %40 = extractvalue %struct.2 %p1, 0
  %41 = extractvalue %struct.2 %p1, 0
  %42 = extractvalue %struct.2 %p1, 0
  %43 = fadd float %41, %42
  %44 = fmul float %40, %43
  %45 = fsub float 1.0, %44
  %46 = fsub float %45, %15
  %47 = fmul float %39, %46
  %48 = fadd float %38, %47
  %49 = extractvalue %struct.1 %p0, 2
  %50 = extractvalue %struct.2 %p1, 1
  %51 = fmul float %50, %14
  %52 = extractvalue %struct.2 %p1, 3
  %53 = fmul float %52, %43
  %54 = fsub float %51, %53
  %55 = fmul float %49, %54
  %56 = fadd float %48, %55
  %57 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 2
  %58 = addrspacecast ptr %57 to ptr<float>
  %59 = extractvalue %struct.1 %p0, 0
  %60 = fsub float %28, %30
  %61 = fmul float %59, %60
  %62 = extractvalue %struct.1 %p0, 1
  %63 = fadd float %51, %53
  %64 = fmul float %62, %63
  %65 = fadd float %61, %64
  %66 = extractvalue %struct.1 %p0, 2
  %67 = fsub float 1.0, %44
  %68 = fsub float %67, %9
  %69 = fmul float %66, %68
  %70 = fadd float %65, %69
  %71 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 3
  %72 = addrspacecast ptr %71 to ptr<float>
  %73 = extractvalue %struct.1 %p0, 3
  %74 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 4
  %75 = addrspacecast ptr %74 to ptr<float>
  %76 = extractvalue %struct.1 %p0, 4
  %77 = fmul float %76, %16
  %78 = extractvalue %struct.1 %p0, 5
  %79 = fmul float %78, %23
  %80 = fadd float %77, %79
  %81 = extractvalue %struct.1 %p0, 6
  %82 = fmul float %81, %31
  %83 = fadd float %80, %82
  %84 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 5
  %85 = addrspacecast ptr %84 to ptr<float>
  %86 = extractvalue %struct.1 %p0, 4
  %87 = fmul float %86, %37
  %88 = extractvalue %struct.1 %p0, 5
  %89 = fmul float %88, %46
  %90 = fadd float %87, %89
  %91 = extractvalue %struct.1 %p0, 6
  %92 = fmul float %91, %54
  %93 = fadd float %90, %92
  %94 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 6
  %95 = addrspacecast ptr %94 to ptr<float>
  %96 = extractvalue %struct.1 %p0, 4
  %97 = fmul float %96, %60
  %98 = extractvalue %struct.1 %p0, 5
  %99 = fmul float %98, %63
  %100 = fadd float %97, %99
  %101 = extractvalue %struct.1 %p0, 6
  %102 = fmul float %101, %68
  %103 = fadd float %100, %102
  %104 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 7
  %105 = addrspacecast ptr %104 to ptr<float>
  %106 = extractvalue %struct.1 %p0, 7
  %107 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 8
  %108 = addrspacecast ptr %107 to ptr<float>
  %109 = extractvalue %struct.1 %p0, 8
  %110 = fmul float %109, %16
  %111 = extractvalue %struct.1 %p0, 9
  %112 = fmul float %111, %23
  %113 = fadd float %110, %112
  %114 = extractvalue %struct.1 %p0, 10
  %115 = fmul float %114, %31
  %116 = fadd float %113, %115
  %117 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 9
  %118 = addrspacecast ptr %117 to ptr<float>
  %119 = extractvalue %struct.1 %p0, 8
  %120 = fmul float %119, %37
  %121 = extractvalue %struct.1 %p0, 9
  %122 = fmul float %121, %46
  %123 = fadd float %120, %122
  %124 = extractvalue %struct.1 %p0, 10
  %125 = fmul float %124, %54
  %126 = fadd float %123, %125
  %127 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 10
  %128 = addrspacecast ptr %127 to ptr<float>
  %129 = extractvalue %struct.1 %p0, 8
  %130 = fmul float %129, %60
  %131 = extractvalue %struct.1 %p0, 9
  %132 = fmul float %131, %63
  %133 = fadd float %130, %132
  %134 = extractvalue %struct.1 %p0, 10
  %135 = fmul float %134, %68
  %136 = fadd float %133, %135
  %137 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 11
  %138 = addrspacecast ptr %137 to ptr<float>
  %139 = extractvalue %struct.1 %p0, 11
  %140 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 12
  %141 = addrspacecast ptr %140 to ptr<float>
  %142 = extractvalue %struct.1 %p0, 12
  %143 = fmul float %142, %16
  %144 = extractvalue %struct.1 %p0, 13
  %145 = fmul float %144, %23
  %146 = fadd float %143, %145
  %147 = extractvalue %struct.1 %p0, 14
  %148 = fmul float %147, %31
  %149 = fadd float %146, %148
  %150 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 13
  %151 = addrspacecast ptr %150 to ptr<float>
  %152 = extractvalue %struct.1 %p0, 12
  %153 = fmul float %152, %37
  %154 = extractvalue %struct.1 %p0, 13
  %155 = fmul float %154, %46
  %156 = fadd float %153, %155
  %157 = extractvalue %struct.1 %p0, 14
  %158 = fmul float %157, %54
  %159 = fadd float %156, %158
  %160 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 14
  %161 = addrspacecast ptr %160 to ptr<float>
  %162 = extractvalue %struct.1 %p0, 12
  %163 = fmul float %162, %60
  %164 = extractvalue %struct.1 %p0, 13
  %165 = fmul float %164, %63
  %166 = fadd float %163, %165
  %167 = extractvalue %struct.1 %p0, 14
  %168 = fmul float %167, %68
  %169 = fadd float %166, %168
  %170 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 15
  %171 = addrspacecast ptr %170 to ptr<float>
  %172 = extractvalue %struct.1 %p0, 15
  br label %bb1

bb1:
  store %struct.1 null, ptr %1
  store float %33, ptr %3
  store float %56, ptr %35
  store float %70, ptr %58
  store float %73, ptr %72
  store float %83, ptr %75
  store float %93, ptr %85
  store float %103, ptr %95
  store float %106, ptr %105
  store float %116, ptr %108
  store float %126, ptr %118
  store float %136, ptr %128
  store float %139, ptr %138
  store float %149, ptr %141
  store float %159, ptr %151
  store float %169, ptr %161
  store float %172, ptr %171
  %173 = load %struct.1, ptr %1
  br label %bb2

bb2:
  ret %struct.1 %173

}


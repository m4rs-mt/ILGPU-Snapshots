; module: Matrix4x4DecomposeKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }
%struct.2 = type { float, float, float }
%struct.3 = type { float, float, float, float }

define void @Matrix4x4DecomposeKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
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
  %12 = call i1 @Decompose(%struct.1 %p2, ptr<%struct.2> %4, ptr<%struct.3> %5, ptr<%struct.2> %6)
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

define i1 @Decompose(%struct.1 %p0, ptr<%struct.2> %p1, ptr<%struct.3> %p2, ptr<%struct.2> %p3) {
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
  %8 = extractvalue %struct.1 %p0, 0
  %9 = fmul float %7, %8
  %10 = extractvalue %struct.1 %p0, 1
  %11 = extractvalue %struct.1 %p0, 1
  %12 = fmul float %10, %11
  %13 = fadd float %9, %12
  %14 = extractvalue %struct.1 %p0, 2
  %15 = extractvalue %struct.1 %p0, 2
  %16 = fmul float %14, %15
  %17 = fadd float %13, %16
  %18 = call float @llvm.sqrt.float(float %17)
  %19 = fcmp olt float %18, 1E-30
  %20 = extractvalue %struct.1 %p0, 4
  %21 = extractvalue %struct.1 %p0, 4
  %22 = fmul float %20, %21
  %23 = extractvalue %struct.1 %p0, 5
  %24 = extractvalue %struct.1 %p0, 5
  %25 = fmul float %23, %24
  %26 = fadd float %22, %25
  %27 = extractvalue %struct.1 %p0, 6
  %28 = extractvalue %struct.1 %p0, 6
  %29 = fmul float %27, %28
  %30 = fadd float %26, %29
  %31 = call float @llvm.sqrt.float(float %30)
  %32 = fcmp olt float %31, 1E-30
  %33 = extractvalue %struct.1 %p0, 8
  %34 = extractvalue %struct.1 %p0, 8
  %35 = fmul float %33, %34
  %36 = extractvalue %struct.1 %p0, 9
  %37 = extractvalue %struct.1 %p0, 9
  %38 = fmul float %36, %37
  %39 = fadd float %35, %38
  %40 = extractvalue %struct.1 %p0, 10
  %41 = extractvalue %struct.1 %p0, 10
  %42 = fmul float %40, %41
  %43 = fadd float %39, %42
  %44 = call float @llvm.sqrt.float(float %43)
  %45 = fcmp olt float %44, 1E-30
  br label %bb1

bb1:
  store %struct.2 null, ptr %p1
  store %struct.3 null, ptr %p2
  store %struct.2 null, ptr %p3
  store float %2, ptr %1
  store float %4, ptr %3
  store float %6, ptr %5
  br i1 %19, label %bb4, label %bb2

bb2:
  br i1 %32, label %bb4, label %bb3

bb3:
  br label %bb5

bb4:
  %46 = phi %struct.1 [ %p0, %bb1 ], [ %p0, %bb2 ]
  %47 = phi float [ %18, %bb1 ], [ %18, %bb2 ]
  %48 = phi ptr<%struct.2> [ %p1, %bb1 ], [ %p1, %bb2 ]
  %49 = phi float [ %31, %bb1 ], [ %31, %bb2 ]
  %50 = phi float [ %44, %bb1 ], [ %44, %bb2 ]
  %51 = phi ptr<%struct.1> addrspace(local) [ %0, %bb1 ], [ %0, %bb2 ]
  %52 = phi ptr<%struct.3> [ %p2, %bb1 ], [ %p2, %bb2 ]
  br label %bb5

bb5:
  %53 = phi i1 [ %45, %bb3 ], [ true, %bb4 ]
  %54 = phi %struct.1 [ %p0, %bb3 ], [ %46, %bb4 ]
  %55 = phi float [ %18, %bb3 ], [ %47, %bb4 ]
  %56 = phi ptr<%struct.2> [ %p1, %bb3 ], [ %48, %bb4 ]
  %57 = phi float [ %31, %bb3 ], [ %49, %bb4 ]
  %58 = phi float [ %44, %bb3 ], [ %50, %bb4 ]
  %59 = phi ptr<%struct.1> addrspace(local) [ %0, %bb3 ], [ %51, %bb4 ]
  %60 = phi ptr<%struct.3> [ %p2, %bb3 ], [ %52, %bb4 ]
  %61 = xor i1 %53, -1
  %62 = extractvalue %struct.1 %54, 0
  %63 = extractvalue %struct.1 %54, 5
  %64 = extractvalue %struct.1 %54, 10
  %65 = fmul float %63, %64
  %66 = extractvalue %struct.1 %54, 6
  %67 = extractvalue %struct.1 %54, 9
  %68 = fmul float %66, %67
  %69 = fsub float %65, %68
  %70 = fmul float %62, %69
  %71 = extractvalue %struct.1 %54, 1
  %72 = extractvalue %struct.1 %54, 4
  %73 = extractvalue %struct.1 %54, 10
  %74 = fmul float %72, %73
  %75 = extractvalue %struct.1 %54, 6
  %76 = extractvalue %struct.1 %54, 8
  %77 = fmul float %75, %76
  %78 = fsub float %74, %77
  %79 = fmul float %71, %78
  %80 = fsub float %70, %79
  %81 = extractvalue %struct.1 %54, 2
  %82 = extractvalue %struct.1 %54, 4
  %83 = extractvalue %struct.1 %54, 9
  %84 = fmul float %82, %83
  %85 = extractvalue %struct.1 %54, 5
  %86 = extractvalue %struct.1 %54, 8
  %87 = fmul float %85, %86
  %88 = fsub float %84, %87
  %89 = fmul float %81, %88
  %90 = fadd float %80, %89
  %91 = fcmp olt float %90, 0.0
  br i1 %61, label %bb7, label %bb6

bb6:
  br label %bb11

bb7:
  br i1 %91, label %bb9, label %bb8

bb8:
  br label %bb10

bb9:
  br label %bb10

bb10:
  %92 = phi float [ 1.0, %bb8 ], [ -1.0, %bb9 ]
  %93 = phi float [ %55, %bb8 ], [ %55, %bb9 ]
  %94 = phi ptr<%struct.2> [ %56, %bb8 ], [ %56, %bb9 ]
  %95 = phi float [ %57, %bb8 ], [ %57, %bb9 ]
  %96 = phi float [ %58, %bb8 ], [ %58, %bb9 ]
  %97 = phi ptr<%struct.1> addrspace(local) [ %59, %bb8 ], [ %59, %bb9 ]
  %98 = phi %struct.1 [ %54, %bb8 ], [ %54, %bb9 ]
  %99 = phi ptr<%struct.3> [ %60, %bb8 ], [ %60, %bb9 ]
  %100 = getelementptr inbounds %struct.2, ptr %94, i32 0, i32 0
  %101 = fmul float %93, %92
  store float %101, ptr %100
  %102 = getelementptr inbounds %struct.2, ptr %94, i32 0, i32 1
  store float %95, ptr %102
  %103 = getelementptr inbounds %struct.2, ptr %94, i32 0, i32 2
  store float %96, ptr %103
  %104 = addrspacecast ptr %97 to ptr<%struct.1>
  store %struct.1 null, ptr %104
  %105 = getelementptr inbounds %struct.1, ptr %97, i32 0, i32 0
  %106 = addrspacecast ptr %105 to ptr<float>
  %107 = extractvalue %struct.1 %98, 0
  %108 = fdiv float 1.0, %101
  %109 = fmul float %107, %108
  store float %109, ptr %106
  %110 = getelementptr inbounds %struct.1, ptr %97, i32 0, i32 1
  %111 = addrspacecast ptr %110 to ptr<float>
  %112 = extractvalue %struct.1 %98, 1
  %113 = fmul float %112, %108
  store float %113, ptr %111
  %114 = getelementptr inbounds %struct.1, ptr %97, i32 0, i32 2
  %115 = addrspacecast ptr %114 to ptr<float>
  %116 = extractvalue %struct.1 %98, 2
  %117 = fmul float %116, %108
  store float %117, ptr %115
  %118 = getelementptr inbounds %struct.1, ptr %97, i32 0, i32 4
  %119 = addrspacecast ptr %118 to ptr<float>
  %120 = extractvalue %struct.1 %98, 4
  %121 = fdiv float 1.0, %95
  %122 = fmul float %120, %121
  store float %122, ptr %119
  %123 = getelementptr inbounds %struct.1, ptr %97, i32 0, i32 5
  %124 = addrspacecast ptr %123 to ptr<float>
  %125 = extractvalue %struct.1 %98, 5
  %126 = fmul float %125, %121
  store float %126, ptr %124
  %127 = getelementptr inbounds %struct.1, ptr %97, i32 0, i32 6
  %128 = addrspacecast ptr %127 to ptr<float>
  %129 = extractvalue %struct.1 %98, 6
  %130 = fmul float %129, %121
  store float %130, ptr %128
  %131 = getelementptr inbounds %struct.1, ptr %97, i32 0, i32 8
  %132 = addrspacecast ptr %131 to ptr<float>
  %133 = extractvalue %struct.1 %98, 8
  %134 = fdiv float 1.0, %96
  %135 = fmul float %133, %134
  store float %135, ptr %132
  %136 = getelementptr inbounds %struct.1, ptr %97, i32 0, i32 9
  %137 = addrspacecast ptr %136 to ptr<float>
  %138 = extractvalue %struct.1 %98, 9
  %139 = fmul float %138, %134
  store float %139, ptr %137
  %140 = getelementptr inbounds %struct.1, ptr %97, i32 0, i32 10
  %141 = addrspacecast ptr %140 to ptr<float>
  %142 = extractvalue %struct.1 %98, 10
  %143 = fmul float %142, %134
  store float %143, ptr %141
  %144 = getelementptr inbounds %struct.1, ptr %97, i32 0, i32 15
  %145 = addrspacecast ptr %144 to ptr<float>
  store float 1.0, ptr %145
  %146 = load %struct.1, ptr %104
  %147 = call %struct.3 @CreateFromRotationMatrix(%struct.1 %146)
  store %struct.3 %147, ptr %99
  br label %bb11

bb11:
  %148 = phi i1 [ false, %bb6 ], [ true, %bb10 ]
  ret i1 %148

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


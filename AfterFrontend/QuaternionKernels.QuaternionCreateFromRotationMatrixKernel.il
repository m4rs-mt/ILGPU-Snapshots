; module: QuaternionCreateFromRotationMatrixKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }
%struct.2 = type { float, float, float, float }

define void @QuaternionCreateFromRotationMatrixKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
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
  %5 = call %struct.2 @CreateFromRotationMatrix(%struct.1 %p2)
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

define %struct.2 @CreateFromRotationMatrix(%struct.1 %p0) {
entry:
  %0 = alloca %struct.2, i32 1
  store %struct.2 null, ptr %0
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
  %31 = phi ptr<%struct.2> addrspace(local) [ %0, %bb4 ], [ %0, %bb5 ]
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
  %99 = phi ptr<%struct.2> addrspace(local) [ %0, %bb2 ], [ %31, %bb7 ], [ %31, %bb9 ], [ %31, %bb10 ]
  %100 = phi float [ %19, %bb2 ], [ %43, %bb7 ], [ %55, %bb9 ], [ %67, %bb10 ]
  %101 = phi float [ %23, %bb2 ], [ %72, %bb7 ], [ %73, %bb9 ], [ %77, %bb10 ]
  %102 = phi float [ %27, %bb2 ], [ %81, %bb7 ], [ %85, %bb9 ], [ %86, %bb10 ]
  %103 = phi float [ %28, %bb2 ], [ %90, %bb7 ], [ %94, %bb9 ], [ %98, %bb10 ]
  %104 = addrspacecast ptr %99 to ptr<%struct.2>
  store %struct.2 null, ptr %104
  %105 = getelementptr inbounds %struct.2, ptr %99, i32 0, i32 0
  %106 = addrspacecast ptr %105 to ptr<float>
  store float %100, ptr %106
  %107 = getelementptr inbounds %struct.2, ptr %99, i32 0, i32 1
  %108 = addrspacecast ptr %107 to ptr<float>
  store float %101, ptr %108
  %109 = getelementptr inbounds %struct.2, ptr %99, i32 0, i32 2
  %110 = addrspacecast ptr %109 to ptr<float>
  store float %102, ptr %110
  %111 = getelementptr inbounds %struct.2, ptr %99, i32 0, i32 3
  %112 = addrspacecast ptr %111 to ptr<float>
  store float %103, ptr %112
  %113 = load %struct.2, ptr %104
  br label %bb12

bb12:
  ret %struct.2 %113

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
  br label %bb1

bb1:
  %3 = call i32 @get_X(ptr<i32> %2)
  ret i32 %3

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


; module: QuaternionLerpKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float }

define void @QuaternionLerpKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2, %struct.1 %p3, float %p4) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %1
  %2 = addrspacecast ptr %0 to ptr<%struct.0>
  %3 = addrspacecast ptr %1 to ptr<%struct.1>
  br label %bb1

bb1:
  %4 = call ptr<float> @get_Item(ptr<%struct.0> %2, i32 %p0)
  %5 = call %struct.1 @Lerp(%struct.1 %p2, %struct.1 %p3, float %p4)
  store %struct.1 %5, ptr %1
  %6 = call float @Sum(ptr<%struct.1> %3)
  store float %6, ptr %4
  ret void

}

define float @Sum(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 0
  %1 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 1
  %2 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 2
  %3 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 3
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

define %struct.1 @Lerp(%struct.1 %p0, %struct.1 %p1, float %p2) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.1>
  %2 = extractvalue %struct.1 %p0, 0
  %3 = extractvalue %struct.1 %p1, 0
  %4 = fmul float %2, %3
  %5 = extractvalue %struct.1 %p0, 1
  %6 = extractvalue %struct.1 %p1, 1
  %7 = fmul float %5, %6
  %8 = fadd float %4, %7
  %9 = extractvalue %struct.1 %p0, 2
  %10 = extractvalue %struct.1 %p1, 2
  %11 = fmul float %9, %10
  %12 = fadd float %8, %11
  %13 = extractvalue %struct.1 %p0, 3
  %14 = extractvalue %struct.1 %p1, 3
  %15 = fmul float %13, %14
  %16 = fadd float %12, %15
  %17 = fcmp ult float %16, 0.0
  %18 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %19 = addrspacecast ptr %18 to ptr<float>
  %20 = fsub float 1.0, %p2
  %21 = extractvalue %struct.1 %p0, 0
  %22 = fmul float %20, %21
  %23 = extractvalue %struct.1 %p1, 0
  %24 = fmul float %p2, %23
  %25 = fadd float %22, %24
  %26 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %27 = addrspacecast ptr %26 to ptr<float>
  %28 = extractvalue %struct.1 %p0, 1
  %29 = fmul float %20, %28
  %30 = extractvalue %struct.1 %p1, 1
  %31 = fmul float %p2, %30
  %32 = fadd float %29, %31
  %33 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 2
  %34 = addrspacecast ptr %33 to ptr<float>
  %35 = extractvalue %struct.1 %p0, 2
  %36 = fmul float %20, %35
  %37 = extractvalue %struct.1 %p1, 2
  %38 = fmul float %p2, %37
  %39 = fadd float %36, %38
  %40 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 3
  %41 = addrspacecast ptr %40 to ptr<float>
  %42 = extractvalue %struct.1 %p0, 3
  %43 = fmul float %20, %42
  %44 = extractvalue %struct.1 %p1, 3
  %45 = fmul float %p2, %44
  %46 = fadd float %43, %45
  %47 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %48 = addrspacecast ptr %47 to ptr<float>
  %49 = extractvalue %struct.1 %p0, 0
  %50 = fmul float %20, %49
  %51 = extractvalue %struct.1 %p1, 0
  %52 = fmul float %p2, %51
  %53 = fsub float %50, %52
  %54 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %55 = addrspacecast ptr %54 to ptr<float>
  %56 = extractvalue %struct.1 %p0, 1
  %57 = fmul float %20, %56
  %58 = extractvalue %struct.1 %p1, 1
  %59 = fmul float %p2, %58
  %60 = fsub float %57, %59
  %61 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 2
  %62 = addrspacecast ptr %61 to ptr<float>
  %63 = extractvalue %struct.1 %p0, 2
  %64 = fmul float %20, %63
  %65 = extractvalue %struct.1 %p1, 2
  %66 = fmul float %p2, %65
  %67 = fsub float %64, %66
  %68 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 3
  %69 = addrspacecast ptr %68 to ptr<float>
  %70 = extractvalue %struct.1 %p0, 3
  %71 = fmul float %20, %70
  %72 = extractvalue %struct.1 %p1, 3
  %73 = fmul float %p2, %72
  %74 = fsub float %71, %73
  br label %bb1

bb1:
  store %struct.1 null, ptr %1
  br i1 %17, label %bb3, label %bb2

bb2:
  store float %25, ptr %19
  store float %32, ptr %27
  store float %39, ptr %34
  store float %46, ptr %41
  br label %bb4

bb3:
  store float %53, ptr %48
  store float %60, ptr %55
  store float %67, ptr %62
  store float %74, ptr %69
  br label %bb4

bb4:
  %75 = phi ptr<%struct.1> addrspace(local) [ %0, %bb2 ], [ %0, %bb3 ]
  %76 = addrspacecast ptr %75 to ptr<%struct.1>
  %77 = load %struct.1, ptr %76
  %78 = load %struct.1, ptr %76
  %79 = load %struct.1, ptr %76
  %80 = load %struct.1, ptr %76
  %81 = load %struct.1, ptr %76
  %82 = load %struct.1, ptr %76
  %83 = load %struct.1, ptr %76
  %84 = load %struct.1, ptr %76
  %85 = getelementptr inbounds %struct.1, ptr %75, i32 0, i32 0
  %86 = addrspacecast ptr %85 to ptr<float>
  %87 = load float, ptr %86
  %88 = extractvalue %struct.1 %77, 0
  %89 = extractvalue %struct.1 %78, 0
  %90 = fmul float %88, %89
  %91 = extractvalue %struct.1 %79, 1
  %92 = extractvalue %struct.1 %80, 1
  %93 = fmul float %91, %92
  %94 = fadd float %90, %93
  %95 = extractvalue %struct.1 %81, 2
  %96 = extractvalue %struct.1 %82, 2
  %97 = fmul float %95, %96
  %98 = fadd float %94, %97
  %99 = extractvalue %struct.1 %83, 3
  %100 = extractvalue %struct.1 %84, 3
  %101 = fmul float %99, %100
  %102 = fadd float %98, %101
  %103 = call float @llvm.sqrt.float(float %102)
  %104 = fdiv float 1.0, %103
  %105 = fmul float %87, %104
  store float %105, ptr %86
  %106 = getelementptr inbounds %struct.1, ptr %75, i32 0, i32 1
  %107 = addrspacecast ptr %106 to ptr<float>
  %108 = load float, ptr %107
  %109 = fmul float %108, %104
  store float %109, ptr %107
  %110 = getelementptr inbounds %struct.1, ptr %75, i32 0, i32 2
  %111 = addrspacecast ptr %110 to ptr<float>
  %112 = load float, ptr %111
  %113 = fmul float %112, %104
  store float %113, ptr %111
  %114 = getelementptr inbounds %struct.1, ptr %75, i32 0, i32 3
  %115 = addrspacecast ptr %114 to ptr<float>
  %116 = load float, ptr %115
  %117 = fmul float %116, %104
  store float %117, ptr %115
  %118 = load %struct.1, ptr %76
  br label %bb5

bb5:
  ret %struct.1 %118

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


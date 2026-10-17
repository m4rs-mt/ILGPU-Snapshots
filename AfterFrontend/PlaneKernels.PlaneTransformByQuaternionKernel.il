; module: PlaneTransformByQuaternionKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float }
%struct.2 = type { float, float, float, float }

define void @PlaneTransformByQuaternionKernel(i32 %p0, %struct.0 %p1, %struct.2 %p2, %struct.2 %p3) {
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
  %5 = call %struct.2 @Transform(%struct.2 %p2, %struct.2 %p3)
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

define %struct.2 @Transform(%struct.2 %p0, %struct.2 %p1) {
entry:
  %0 = alloca %struct.2, i32 1
  store %struct.2 null, ptr %0
  %1 = alloca %struct.1, i32 1
  %2 = addrspacecast ptr %0 to ptr<%struct.2>
  %3 = addrspacecast ptr %1 to ptr<%struct.1>
  %4 = extractvalue %struct.2 %p0, 0 [Span: 3]
  %5 = extractvalue %struct.1 %4, 0
  %6 = extractvalue %struct.2 %p1, 1
  %7 = extractvalue %struct.2 %p1, 1
  %8 = extractvalue %struct.2 %p1, 1
  %9 = fadd float %7, %8
  %10 = fmul float %6, %9
  %11 = fsub float 1.0, %10
  %12 = extractvalue %struct.2 %p1, 2
  %13 = extractvalue %struct.2 %p1, 2
  %14 = extractvalue %struct.2 %p1, 2
  %15 = fadd float %13, %14
  %16 = fmul float %12, %15
  %17 = fsub float %11, %16
  %18 = fmul float %5, %17
  %19 = extractvalue %struct.2 %p0, 0 [Span: 3]
  %20 = extractvalue %struct.1 %19, 1
  %21 = extractvalue %struct.2 %p1, 0
  %22 = fmul float %21, %9
  %23 = extractvalue %struct.2 %p1, 3
  %24 = fmul float %23, %15
  %25 = fsub float %22, %24
  %26 = fmul float %20, %25
  %27 = fadd float %18, %26
  %28 = extractvalue %struct.2 %p0, 0 [Span: 3]
  %29 = extractvalue %struct.1 %28, 2
  %30 = extractvalue %struct.2 %p1, 0
  %31 = fmul float %30, %15
  %32 = extractvalue %struct.2 %p1, 3
  %33 = fmul float %32, %9
  %34 = fadd float %31, %33
  %35 = fmul float %29, %34
  %36 = fadd float %27, %35
  %37 = fadd float %22, %24
  %38 = fmul float %5, %37
  %39 = extractvalue %struct.2 %p1, 0
  %40 = extractvalue %struct.2 %p1, 0
  %41 = extractvalue %struct.2 %p1, 0
  %42 = fadd float %40, %41
  %43 = fmul float %39, %42
  %44 = fsub float 1.0, %43
  %45 = fsub float %44, %16
  %46 = fmul float %20, %45
  %47 = fadd float %38, %46
  %48 = extractvalue %struct.2 %p1, 1
  %49 = fmul float %48, %15
  %50 = extractvalue %struct.2 %p1, 3
  %51 = fmul float %50, %42
  %52 = fsub float %49, %51
  %53 = fmul float %29, %52
  %54 = fadd float %47, %53
  %55 = fsub float %31, %33
  %56 = fmul float %5, %55
  %57 = fadd float %49, %51
  %58 = fmul float %20, %57
  %59 = fadd float %56, %58
  %60 = fsub float 1.0, %43
  %61 = fsub float %60, %10
  %62 = fmul float %29, %61
  %63 = fadd float %59, %62
  %64 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 0
  %65 = addrspacecast ptr %64 to ptr<%struct.1>
  %66 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 3
  %67 = addrspacecast ptr %66 to ptr<float>
  %68 = extractvalue %struct.2 %p0, 3
  br label %bb1

bb1:
  store %struct.2 null, ptr %2
  store %struct.1 null, ptr %3
  call void @.ctor(ptr<%struct.1> %3, float %36, float %54, float %63)
  %69 = load %struct.1, ptr %3
  store %struct.1 %69, ptr %65
  store float %68, ptr %67
  %70 = load %struct.2, ptr %2
  br label %bb2

bb2:
  ret %struct.2 %70

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


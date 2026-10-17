; module: Matrix4x4TransposeKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }

define void @Matrix4x4TransposeKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %1
  %2 = addrspacecast ptr %0 to ptr<%struct.0>
  %3 = addrspacecast ptr %1 to ptr<%struct.1>
  br label %bb1

bb1:
  %4 = call %struct.1 @Transpose(%struct.1 %p2)
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

define %struct.1 @Transpose(%struct.1 %p0) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.1>
  %2 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %3 = addrspacecast ptr %2 to ptr<float>
  %4 = extractvalue %struct.1 %p0, 0
  %5 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %6 = addrspacecast ptr %5 to ptr<float>
  %7 = extractvalue %struct.1 %p0, 4
  %8 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 2
  %9 = addrspacecast ptr %8 to ptr<float>
  %10 = extractvalue %struct.1 %p0, 8
  %11 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 3
  %12 = addrspacecast ptr %11 to ptr<float>
  %13 = extractvalue %struct.1 %p0, 12
  %14 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 4
  %15 = addrspacecast ptr %14 to ptr<float>
  %16 = extractvalue %struct.1 %p0, 1
  %17 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 5
  %18 = addrspacecast ptr %17 to ptr<float>
  %19 = extractvalue %struct.1 %p0, 5
  %20 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 6
  %21 = addrspacecast ptr %20 to ptr<float>
  %22 = extractvalue %struct.1 %p0, 9
  %23 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 7
  %24 = addrspacecast ptr %23 to ptr<float>
  %25 = extractvalue %struct.1 %p0, 13
  %26 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 8
  %27 = addrspacecast ptr %26 to ptr<float>
  %28 = extractvalue %struct.1 %p0, 2
  %29 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 9
  %30 = addrspacecast ptr %29 to ptr<float>
  %31 = extractvalue %struct.1 %p0, 6
  %32 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 10
  %33 = addrspacecast ptr %32 to ptr<float>
  %34 = extractvalue %struct.1 %p0, 10
  %35 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 11
  %36 = addrspacecast ptr %35 to ptr<float>
  %37 = extractvalue %struct.1 %p0, 14
  %38 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 12
  %39 = addrspacecast ptr %38 to ptr<float>
  %40 = extractvalue %struct.1 %p0, 3
  %41 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 13
  %42 = addrspacecast ptr %41 to ptr<float>
  %43 = extractvalue %struct.1 %p0, 7
  %44 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 14
  %45 = addrspacecast ptr %44 to ptr<float>
  %46 = extractvalue %struct.1 %p0, 11
  %47 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 15
  %48 = addrspacecast ptr %47 to ptr<float>
  %49 = extractvalue %struct.1 %p0, 15
  br label %bb1

bb1:
  store %struct.1 null, ptr %1
  store float %4, ptr %3
  store float %7, ptr %6
  store float %10, ptr %9
  store float %13, ptr %12
  store float %16, ptr %15
  store float %19, ptr %18
  store float %22, ptr %21
  store float %25, ptr %24
  store float %28, ptr %27
  store float %31, ptr %30
  store float %34, ptr %33
  store float %37, ptr %36
  store float %40, ptr %39
  store float %43, ptr %42
  store float %46, ptr %45
  store float %49, ptr %48
  %50 = load %struct.1, ptr %1
  br label %bb2

bb2:
  ret %struct.1 %50

}


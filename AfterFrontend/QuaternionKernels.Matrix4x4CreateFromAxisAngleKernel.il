; module: Matrix4x4CreateFromAxisAngleKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float }
%struct.2 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }

define void @Matrix4x4CreateFromAxisAngleKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2, float %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.0>
  br label %bb1

bb1:
  %2 = call %struct.2 @CreateFromAxisAngle(%struct.1 %p2, float %p3)
  %3 = call ptr<float> @get_Item(ptr<%struct.0> %1, i32 %p0)
  %4 = extractvalue %struct.2 %2, 0
  %5 = extractvalue %struct.2 %2, 5
  %6 = fadd float %4, %5
  %7 = extractvalue %struct.2 %2, 10
  %8 = fadd float %6, %7
  %9 = extractvalue %struct.2 %2, 15
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

define %struct.2 @CreateFromAxisAngle(%struct.1 %p0, float %p1) {
entry:
  %0 = alloca %struct.2, i32 1
  store %struct.2 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.2>
  %2 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 0
  %3 = addrspacecast ptr %2 to ptr<float>
  %4 = extractvalue %struct.1 %p0, 0
  %5 = fmul float %4, %4
  %6 = call float @llvm.cos.float(float %p1)
  %7 = fsub float 1.0, %5
  %8 = fmul float %6, %7
  %9 = fadd float %5, %8
  %10 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 1
  %11 = addrspacecast ptr %10 to ptr<float>
  %12 = extractvalue %struct.1 %p0, 1
  %13 = fmul float %4, %12
  %14 = fmul float %6, %13
  %15 = fsub float %13, %14
  %16 = call float @llvm.sin.float(float %p1)
  %17 = extractvalue %struct.1 %p0, 2
  %18 = fmul float %16, %17
  %19 = fadd float %15, %18
  %20 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 2
  %21 = addrspacecast ptr %20 to ptr<float>
  %22 = fmul float %4, %17
  %23 = fmul float %6, %22
  %24 = fsub float %22, %23
  %25 = fmul float %16, %12
  %26 = fsub float %24, %25
  %27 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 4
  %28 = addrspacecast ptr %27 to ptr<float>
  %29 = fmul float %6, %13
  %30 = fsub float %13, %29
  %31 = fmul float %16, %17
  %32 = fsub float %30, %31
  %33 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 5
  %34 = addrspacecast ptr %33 to ptr<float>
  %35 = fmul float %12, %12
  %36 = fsub float 1.0, %35
  %37 = fmul float %6, %36
  %38 = fadd float %35, %37
  %39 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 6
  %40 = addrspacecast ptr %39 to ptr<float>
  %41 = fmul float %12, %17
  %42 = fmul float %6, %41
  %43 = fsub float %41, %42
  %44 = fmul float %16, %4
  %45 = fadd float %43, %44
  %46 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 8
  %47 = addrspacecast ptr %46 to ptr<float>
  %48 = fmul float %6, %22
  %49 = fsub float %22, %48
  %50 = fmul float %16, %12
  %51 = fadd float %49, %50
  %52 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 9
  %53 = addrspacecast ptr %52 to ptr<float>
  %54 = fmul float %6, %41
  %55 = fsub float %41, %54
  %56 = fmul float %16, %4
  %57 = fsub float %55, %56
  %58 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 10
  %59 = addrspacecast ptr %58 to ptr<float>
  %60 = fmul float %17, %17
  %61 = fsub float 1.0, %60
  %62 = fmul float %6, %61
  %63 = fadd float %60, %62
  %64 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 15
  %65 = addrspacecast ptr %64 to ptr<float>
  br label %bb1

bb1:
  store %struct.2 null, ptr %1
  store float %9, ptr %3
  store float %19, ptr %11
  store float %26, ptr %21
  store float %32, ptr %28
  store float %38, ptr %34
  store float %45, ptr %40
  store float %51, ptr %47
  store float %57, ptr %53
  store float %63, ptr %59
  store float 1.0, ptr %65
  %66 = load %struct.2, ptr %1
  br label %bb2

bb2:
  ret %struct.2 %66

}


; module: Vector4TransformKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float }
%struct.2 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }

define void @Vector4TransformKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2, %struct.2 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.0>
  br label %bb1

bb1:
  %2 = call %struct.1 @Transform(%struct.1 %p2, %struct.2 %p3)
  %3 = call ptr<float> @get_Item(ptr<%struct.0> %1, i32 %p0)
  %4 = extractvalue %struct.1 %2, 0
  %5 = extractvalue %struct.1 %2, 1
  %6 = fadd float %4, %5
  %7 = extractvalue %struct.1 %2, 2
  %8 = fadd float %6, %7
  %9 = extractvalue %struct.1 %2, 3
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

define %struct.1 @Transform(%struct.1 %p0, %struct.2 %p1) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.1>
  %2 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %3 = addrspacecast ptr %2 to ptr<float>
  %4 = extractvalue %struct.1 %p0, 0
  %5 = extractvalue %struct.2 %p1, 0
  %6 = fmul float %4, %5
  %7 = extractvalue %struct.1 %p0, 1
  %8 = extractvalue %struct.2 %p1, 4
  %9 = fmul float %7, %8
  %10 = fadd float %6, %9
  %11 = extractvalue %struct.1 %p0, 2
  %12 = extractvalue %struct.2 %p1, 8
  %13 = fmul float %11, %12
  %14 = fadd float %10, %13
  %15 = extractvalue %struct.1 %p0, 3
  %16 = extractvalue %struct.2 %p1, 12
  %17 = fmul float %15, %16
  %18 = fadd float %14, %17
  %19 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %20 = addrspacecast ptr %19 to ptr<float>
  %21 = extractvalue %struct.1 %p0, 0
  %22 = extractvalue %struct.2 %p1, 1
  %23 = fmul float %21, %22
  %24 = extractvalue %struct.1 %p0, 1
  %25 = extractvalue %struct.2 %p1, 5
  %26 = fmul float %24, %25
  %27 = fadd float %23, %26
  %28 = extractvalue %struct.1 %p0, 2
  %29 = extractvalue %struct.2 %p1, 9
  %30 = fmul float %28, %29
  %31 = fadd float %27, %30
  %32 = extractvalue %struct.1 %p0, 3
  %33 = extractvalue %struct.2 %p1, 13
  %34 = fmul float %32, %33
  %35 = fadd float %31, %34
  %36 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 2
  %37 = addrspacecast ptr %36 to ptr<float>
  %38 = extractvalue %struct.1 %p0, 0
  %39 = extractvalue %struct.2 %p1, 2
  %40 = fmul float %38, %39
  %41 = extractvalue %struct.1 %p0, 1
  %42 = extractvalue %struct.2 %p1, 6
  %43 = fmul float %41, %42
  %44 = fadd float %40, %43
  %45 = extractvalue %struct.1 %p0, 2
  %46 = extractvalue %struct.2 %p1, 10
  %47 = fmul float %45, %46
  %48 = fadd float %44, %47
  %49 = extractvalue %struct.1 %p0, 3
  %50 = extractvalue %struct.2 %p1, 14
  %51 = fmul float %49, %50
  %52 = fadd float %48, %51
  %53 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 3
  %54 = addrspacecast ptr %53 to ptr<float>
  %55 = extractvalue %struct.1 %p0, 0
  %56 = extractvalue %struct.2 %p1, 3
  %57 = fmul float %55, %56
  %58 = extractvalue %struct.1 %p0, 1
  %59 = extractvalue %struct.2 %p1, 7
  %60 = fmul float %58, %59
  %61 = fadd float %57, %60
  %62 = extractvalue %struct.1 %p0, 2
  %63 = extractvalue %struct.2 %p1, 11
  %64 = fmul float %62, %63
  %65 = fadd float %61, %64
  %66 = extractvalue %struct.1 %p0, 3
  %67 = extractvalue %struct.2 %p1, 15
  %68 = fmul float %66, %67
  %69 = fadd float %65, %68
  br label %bb1

bb1:
  store %struct.1 null, ptr %1
  store float %18, ptr %3
  store float %35, ptr %20
  store float %52, ptr %37
  store float %69, ptr %54
  %70 = load %struct.1, ptr %1
  br label %bb2

bb2:
  ret %struct.1 %70

}


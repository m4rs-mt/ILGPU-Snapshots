; module: Matrix4x4DeterminantKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }

define void @Matrix4x4DeterminantKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 %p2, ptr %1
  %2 = addrspacecast ptr %0 to ptr<%struct.0>
  %3 = addrspacecast ptr %1 to ptr<%struct.1>
  br label %bb1

bb1:
  %4 = call ptr<float> @get_Item(ptr<%struct.0> %2, i32 %p0)
  %5 = call float @GetDeterminant(ptr<%struct.1> %3)
  store float %5, ptr %4
  ret void

}

define float @GetDeterminant(ptr<%struct.1> %p0) {
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
  %32 = fmul float %26, %31
  %33 = fmul float %27, %30
  %34 = fsub float %32, %33
  %35 = fmul float %21, %34
  %36 = fmul float %25, %31
  %37 = fmul float %27, %29
  %38 = fsub float %36, %37
  %39 = fmul float %22, %38
  %40 = fsub float %35, %39
  %41 = fmul float %25, %30
  %42 = fmul float %26, %29
  %43 = fsub float %41, %42
  %44 = fmul float %23, %43
  %45 = fadd float %40, %44
  %46 = fmul float %16, %45
  %47 = fmul float %20, %34
  %48 = fmul float %24, %31
  %49 = fmul float %27, %28
  %50 = fsub float %48, %49
  %51 = fmul float %22, %50
  %52 = fsub float %47, %51
  %53 = fmul float %24, %30
  %54 = fmul float %26, %28
  %55 = fsub float %53, %54
  %56 = fmul float %23, %55
  %57 = fadd float %52, %56
  %58 = fmul float %17, %57
  %59 = fsub float %46, %58
  %60 = fmul float %20, %38
  %61 = fmul float %21, %50
  %62 = fsub float %60, %61
  %63 = fmul float %24, %29
  %64 = fmul float %25, %28
  %65 = fsub float %63, %64
  %66 = fmul float %23, %65
  %67 = fadd float %62, %66
  %68 = fmul float %18, %67
  %69 = fadd float %59, %68
  %70 = fmul float %20, %43
  %71 = fmul float %21, %55
  %72 = fsub float %70, %71
  %73 = fmul float %22, %65
  %74 = fadd float %72, %73
  %75 = fmul float %19, %74
  %76 = fsub float %69, %75
  br label %bb2

bb2:
  ret float %76

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


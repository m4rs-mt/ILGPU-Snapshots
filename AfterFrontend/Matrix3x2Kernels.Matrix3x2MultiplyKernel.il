; module: Matrix3x2MultiplyKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float, float, float }

define void @Matrix3x2MultiplyKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2, %struct.1 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %1
  %2 = addrspacecast ptr %0 to ptr<%struct.0>
  %3 = addrspacecast ptr %1 to ptr<%struct.1>
  br label %bb1

bb1:
  %4 = call %struct.1 @op_Multiply(%struct.1 %p2, %struct.1 %p3)
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
  br label %bb1

bb1:
  %6 = load float, ptr %0
  %7 = load float, ptr %1
  %8 = load float, ptr %2
  %9 = load float, ptr %3
  %10 = load float, ptr %4
  %11 = load float, ptr %5
  %12 = fadd float %6, %7
  %13 = fadd float %12, %8
  %14 = fadd float %13, %9
  %15 = fadd float %14, %10
  %16 = fadd float %15, %11
  ret float %16

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

define %struct.1 @op_Multiply(%struct.1 %p0, %struct.1 %p1) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.1>
  %2 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %3 = addrspacecast ptr %2 to ptr<float>
  %4 = extractvalue %struct.1 %p0, 0
  %5 = extractvalue %struct.1 %p1, 0
  %6 = fmul float %4, %5
  %7 = extractvalue %struct.1 %p0, 1
  %8 = extractvalue %struct.1 %p1, 2
  %9 = fmul float %7, %8
  %10 = fadd float %6, %9
  %11 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %12 = addrspacecast ptr %11 to ptr<float>
  %13 = extractvalue %struct.1 %p0, 0
  %14 = extractvalue %struct.1 %p1, 1
  %15 = fmul float %13, %14
  %16 = extractvalue %struct.1 %p0, 1
  %17 = extractvalue %struct.1 %p1, 3
  %18 = fmul float %16, %17
  %19 = fadd float %15, %18
  %20 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 2
  %21 = addrspacecast ptr %20 to ptr<float>
  %22 = extractvalue %struct.1 %p0, 2
  %23 = extractvalue %struct.1 %p1, 0
  %24 = fmul float %22, %23
  %25 = extractvalue %struct.1 %p0, 3
  %26 = extractvalue %struct.1 %p1, 2
  %27 = fmul float %25, %26
  %28 = fadd float %24, %27
  %29 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 3
  %30 = addrspacecast ptr %29 to ptr<float>
  %31 = extractvalue %struct.1 %p0, 2
  %32 = extractvalue %struct.1 %p1, 1
  %33 = fmul float %31, %32
  %34 = extractvalue %struct.1 %p0, 3
  %35 = extractvalue %struct.1 %p1, 3
  %36 = fmul float %34, %35
  %37 = fadd float %33, %36
  %38 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 4
  %39 = addrspacecast ptr %38 to ptr<float>
  %40 = extractvalue %struct.1 %p0, 4
  %41 = extractvalue %struct.1 %p1, 0
  %42 = fmul float %40, %41
  %43 = extractvalue %struct.1 %p0, 5
  %44 = extractvalue %struct.1 %p1, 2
  %45 = fmul float %43, %44
  %46 = fadd float %42, %45
  %47 = extractvalue %struct.1 %p1, 4
  %48 = fadd float %46, %47
  %49 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 5
  %50 = addrspacecast ptr %49 to ptr<float>
  %51 = extractvalue %struct.1 %p0, 4
  %52 = extractvalue %struct.1 %p1, 1
  %53 = fmul float %51, %52
  %54 = extractvalue %struct.1 %p0, 5
  %55 = extractvalue %struct.1 %p1, 3
  %56 = fmul float %54, %55
  %57 = fadd float %53, %56
  %58 = extractvalue %struct.1 %p1, 5
  %59 = fadd float %57, %58
  br label %bb1

bb1:
  store %struct.1 null, ptr %1
  store float %10, ptr %3
  store float %19, ptr %12
  store float %28, ptr %21
  store float %37, ptr %30
  store float %48, ptr %39
  store float %59, ptr %50
  %60 = load %struct.1, ptr %1
  br label %bb2

bb2:
  ret %struct.1 %60

}


; module: Matrix3x2InvertKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float, float, float }

define void @Matrix3x2InvertKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %1
  %2 = addrspacecast ptr %1 to ptr<%struct.1>
  %3 = addrspacecast ptr %0 to ptr<%struct.0>
  %4 = addrspacecast ptr %1 to ptr<%struct.1>
  %5 = addrspacecast ptr %0 to ptr<%struct.0>
  br label %bb1

bb1:
  %6 = call i1 @Invert(%struct.1 %p2, ptr<%struct.1> %2)
  %7 = xor i1 %6, -1
  br i1 %7, label %bb3, label %bb2

bb2:
  %8 = call ptr<float> @get_Item(ptr<%struct.0> %3, i32 %p0)
  %9 = call float @Sum(ptr<%struct.1> %4)
  store float %9, ptr %8
  br label %bb4

bb3:
  %10 = call ptr<float> @get_Item(ptr<%struct.0> %5, i32 %p0)
  store float -1.0, ptr %10
  br label %bb4

bb4:
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

define i1 @Invert(%struct.1 %p0, ptr<%struct.1> %p1) {
entry:
  %0 = extractvalue %struct.1 %p0, 0
  %1 = extractvalue %struct.1 %p0, 3
  %2 = fmul float %0, %1
  %3 = extractvalue %struct.1 %p0, 2
  %4 = extractvalue %struct.1 %p0, 1
  %5 = fmul float %3, %4
  %6 = fsub float %2, %5
  %7 = call float @llvm.fabs.float(float %6)
  %8 = fcmp uge float %7, 1E-30
  %9 = getelementptr inbounds %struct.1, ptr %p1, i32 0, i32 0
  %10 = extractvalue %struct.1 %p0, 3
  %11 = fdiv float 1.0, %6
  %12 = fmul float %10, %11
  %13 = getelementptr inbounds %struct.1, ptr %p1, i32 0, i32 1
  %14 = extractvalue %struct.1 %p0, 1
  %15 = fneg float %14
  %16 = fmul float %15, %11
  %17 = getelementptr inbounds %struct.1, ptr %p1, i32 0, i32 2
  %18 = extractvalue %struct.1 %p0, 2
  %19 = fneg float %18
  %20 = fmul float %19, %11
  %21 = getelementptr inbounds %struct.1, ptr %p1, i32 0, i32 3
  %22 = extractvalue %struct.1 %p0, 0
  %23 = fmul float %22, %11
  %24 = getelementptr inbounds %struct.1, ptr %p1, i32 0, i32 4
  %25 = extractvalue %struct.1 %p0, 2
  %26 = extractvalue %struct.1 %p0, 5
  %27 = fmul float %25, %26
  %28 = extractvalue %struct.1 %p0, 4
  %29 = extractvalue %struct.1 %p0, 3
  %30 = fmul float %28, %29
  %31 = fsub float %27, %30
  %32 = fmul float %31, %11
  %33 = getelementptr inbounds %struct.1, ptr %p1, i32 0, i32 5
  %34 = extractvalue %struct.1 %p0, 4
  %35 = extractvalue %struct.1 %p0, 1
  %36 = fmul float %34, %35
  %37 = extractvalue %struct.1 %p0, 0
  %38 = extractvalue %struct.1 %p0, 5
  %39 = fmul float %37, %38
  %40 = fsub float %36, %39
  %41 = fmul float %40, %11
  br label %bb1

bb1:
  br i1 %8, label %bb3, label %bb2

bb2:
  store %struct.1 null, ptr %p1
  br label %bb4

bb3:
  store %struct.1 null, ptr %p1
  store float %12, ptr %9
  store float %16, ptr %13
  store float %20, ptr %17
  store float %23, ptr %21
  store float %32, ptr %24
  store float %41, ptr %33
  br label %bb4

bb4:
  %42 = phi i1 [ false, %bb2 ], [ true, %bb3 ]
  ret i1 %42

}


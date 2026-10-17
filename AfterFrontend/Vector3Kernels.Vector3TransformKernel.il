; module: Vector3TransformKernel  [intptr: i64]

%struct.0 = type { float, float, float }
%view.struct = view %struct.0
%struct.1 = type { %view.struct, i64, i8 }
%struct.2 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }

define void @Vector3TransformKernel(i32 %p0, %struct.1 %p1, %struct.2 %p2) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.1>
  %2 = addrspacecast ptr %0 to ptr<%struct.1>
  br label %bb1

bb1:
  %3 = call ptr<%struct.0> @get_Item(ptr<%struct.1> %1, i32 %p0)
  %4 = load %struct.0, ptr %3
  %5 = call %struct.0 @get_Zero()
  %6 = call i1 @op_Equality(%struct.0 %4, %struct.0 %5)
  %7 = xor i1 %6, -1
  br i1 %7, label %bb3, label %bb2

bb2:
  br label %bb4

bb3:
  %8 = call ptr<%struct.0> @get_Item(ptr<%struct.1> %2, i32 %p0)
  %9 = call ptr<%struct.0> @get_Item(ptr<%struct.1> %2, i32 %p0)
  %10 = load %struct.0, ptr %9
  %11 = call %struct.0 @Transform(%struct.0 %10, %struct.2 %p2)
  store %struct.0 %11, ptr %8
  br label %bb4

bb4:
  ret void

}

define %struct.0 @Transform(%struct.0 %p0, %struct.2 %p1) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.0>
  %2 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %3 = addrspacecast ptr %2 to ptr<float>
  %4 = extractvalue %struct.0 %p0, 0
  %5 = extractvalue %struct.2 %p1, 0
  %6 = fmul float %4, %5
  %7 = extractvalue %struct.0 %p0, 1
  %8 = extractvalue %struct.2 %p1, 4
  %9 = fmul float %7, %8
  %10 = fadd float %6, %9
  %11 = extractvalue %struct.0 %p0, 2
  %12 = extractvalue %struct.2 %p1, 8
  %13 = fmul float %11, %12
  %14 = fadd float %10, %13
  %15 = extractvalue %struct.2 %p1, 12
  %16 = fadd float %14, %15
  %17 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 1
  %18 = addrspacecast ptr %17 to ptr<float>
  %19 = extractvalue %struct.0 %p0, 0
  %20 = extractvalue %struct.2 %p1, 1
  %21 = fmul float %19, %20
  %22 = extractvalue %struct.0 %p0, 1
  %23 = extractvalue %struct.2 %p1, 5
  %24 = fmul float %22, %23
  %25 = fadd float %21, %24
  %26 = extractvalue %struct.0 %p0, 2
  %27 = extractvalue %struct.2 %p1, 9
  %28 = fmul float %26, %27
  %29 = fadd float %25, %28
  %30 = extractvalue %struct.2 %p1, 13
  %31 = fadd float %29, %30
  %32 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 2
  %33 = addrspacecast ptr %32 to ptr<float>
  %34 = extractvalue %struct.0 %p0, 0
  %35 = extractvalue %struct.2 %p1, 2
  %36 = fmul float %34, %35
  %37 = extractvalue %struct.0 %p0, 1
  %38 = extractvalue %struct.2 %p1, 6
  %39 = fmul float %37, %38
  %40 = fadd float %36, %39
  %41 = extractvalue %struct.0 %p0, 2
  %42 = extractvalue %struct.2 %p1, 10
  %43 = fmul float %41, %42
  %44 = fadd float %40, %43
  %45 = extractvalue %struct.2 %p1, 14
  %46 = fadd float %44, %45
  br label %bb1

bb1:
  store %struct.0 null, ptr %1
  store float %16, ptr %3
  store float %31, ptr %18
  store float %46, ptr %33
  %47 = load %struct.0, ptr %1
  br label %bb2

bb2:
  ret %struct.0 %47

}

define i1 @op_Equality(%struct.0 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p0, 0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = fcmp une float %0, %1
  %3 = extractvalue %struct.0 %p0, 1
  %4 = extractvalue %struct.0 %p1, 1
  %5 = fcmp une float %3, %4
  %6 = extractvalue %struct.0 %p0, 2
  %7 = extractvalue %struct.0 %p1, 2
  %8 = fcmp oeq float %6, %7
  br label %bb1

bb1:
  br i1 %2, label %bb4, label %bb2

bb2:
  br i1 %5, label %bb4, label %bb3

bb3:
  br label %bb5

bb4:
  br label %bb5

bb5:
  %9 = phi i1 [ %8, %bb3 ], [ false, %bb4 ]
  ret i1 %9

}

define %struct.0 @get_Zero() {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.0>
  br label %bb1

bb1:
  store %struct.0 null, ptr %1
  %2 = load %struct.0, ptr %1
  br label %bb2

bb2:
  ret %struct.0 %2

}

define ptr<%struct.0> @get_Item(ptr<%struct.1> %p0, i32 %p1) {
entry:
  %0 = alloca %view.struct, i32 1
  store %view.struct null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%view.struct>
  br label %bb1

bb1:
  %2 = call %view.struct @get_BaseView(ptr<%struct.1> %p0)
  store %view.struct %2, ptr %0
  %3 = call i32 @ComputeLinearIndex(ptr<%struct.1> %p0, i32 %p1)
  %4 = load %view.struct, ptr %1
  %5 = getelementptr %struct.0, ptr %4, i32 %3
  ret ptr<%struct.0> %5

}

define i32 @ComputeLinearIndex(ptr<%struct.1> %p0, i32 %p1) {
entry:
  %0 = alloca i8, i32 1
  store i8 0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i8>
  br label %bb1

bb1:
  %2 = call i8 @get_Stride(ptr<%struct.1> %p0)
  store i8 %2, ptr %0
  %3 = call i32 @get_IntExtent(ptr<%struct.1> %p0)
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

define i32 @get_IntExtent(ptr<%struct.1> %p0) {
entry:
  %0 = alloca i64, i32 1
  store i64 0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i64>
  br label %bb1

bb1:
  %2 = call i64 @get_Extent(ptr<%struct.1> %p0)
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

define i64 @get_Extent(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 1
  br label %bb1

bb1:
  %1 = load i64, ptr %0
  ret i64 %1

}

define i8 @get_Stride(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 2
  br label %bb1

bb1:
  %1 = load i8, ptr %0
  ret i8 %1

}

define %view.struct @get_BaseView(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 0
  br label %bb1

bb1:
  %1 = load %view.struct, ptr %0
  ret %view.struct %1

}


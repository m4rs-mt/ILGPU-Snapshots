; module: Vector3TransformManualKernel  [intptr: i64]

%struct.0 = type { float, float, float }
%view.struct = view %struct.0
%struct.1 = type { %view.struct, i64, i8 }
%struct.2 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }

define void @Vector3TransformManualKernel(i32 %p0, %struct.1 %p1, %struct.2 %p2) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = alloca %struct.0, i32 1
  %2 = addrspacecast ptr %0 to ptr<%struct.1>
  %3 = addrspacecast ptr %0 to ptr<%struct.1>
  %4 = addrspacecast ptr %1 to ptr<%struct.0>
  %5 = extractvalue %struct.2 %p2, 0
  %6 = extractvalue %struct.2 %p2, 4
  %7 = extractvalue %struct.2 %p2, 8
  %8 = extractvalue %struct.2 %p2, 12
  %9 = extractvalue %struct.2 %p2, 1
  %10 = extractvalue %struct.2 %p2, 5
  %11 = extractvalue %struct.2 %p2, 9
  %12 = extractvalue %struct.2 %p2, 13
  %13 = extractvalue %struct.2 %p2, 2
  %14 = extractvalue %struct.2 %p2, 6
  %15 = extractvalue %struct.2 %p2, 10
  %16 = extractvalue %struct.2 %p2, 14
  br label %bb1

bb1:
  %17 = call ptr<%struct.0> @get_Item(ptr<%struct.1> %2, i32 %p0)
  %18 = load %struct.0, ptr %17
  %19 = call %struct.0 @get_Zero()
  %20 = call i1 @op_Equality(%struct.0 %18, %struct.0 %19)
  %21 = xor i1 %20, -1
  br i1 %21, label %bb3, label %bb2

bb2:
  br label %bb4

bb3:
  %22 = call ptr<%struct.0> @get_Item(ptr<%struct.1> %3, i32 %p0)
  %23 = load %struct.0, ptr %22
  %24 = call ptr<%struct.0> @get_Item(ptr<%struct.1> %3, i32 %p0)
  store %struct.0 null, ptr %4
  %25 = extractvalue %struct.0 %23, 0
  %26 = fmul float %25, %5
  %27 = extractvalue %struct.0 %23, 1
  %28 = fmul float %27, %6
  %29 = fadd float %26, %28
  %30 = extractvalue %struct.0 %23, 2
  %31 = fmul float %30, %7
  %32 = fadd float %29, %31
  %33 = fadd float %32, %8
  %34 = extractvalue %struct.0 %23, 0
  %35 = fmul float %34, %9
  %36 = extractvalue %struct.0 %23, 1
  %37 = fmul float %36, %10
  %38 = fadd float %35, %37
  %39 = extractvalue %struct.0 %23, 2
  %40 = fmul float %39, %11
  %41 = fadd float %38, %40
  %42 = fadd float %41, %12
  %43 = extractvalue %struct.0 %23, 0
  %44 = fmul float %43, %13
  %45 = extractvalue %struct.0 %23, 1
  %46 = fmul float %45, %14
  %47 = fadd float %44, %46
  %48 = extractvalue %struct.0 %23, 2
  %49 = fmul float %48, %15
  %50 = fadd float %47, %49
  %51 = fadd float %50, %16
  call void @.ctor(ptr<%struct.0> %4, float %33, float %42, float %51)
  %52 = load %struct.0, ptr %4
  store %struct.0 %52, ptr %24
  br label %bb4

bb4:
  ret void

}

define void @.ctor(ptr<%struct.0> %p0, float %p1, float %p2, float %p3) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  %2 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  br label %bb1

bb1:
  store float %p1, ptr %0
  store float %p2, ptr %1
  store float %p3, ptr %2
  ret void

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


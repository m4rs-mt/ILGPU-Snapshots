; module: Matrix4x4CreateFromQuaternionKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float }
%struct.2 = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }

define void @Matrix4x4CreateFromQuaternionKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.0>
  br label %bb1

bb1:
  %2 = call %struct.2 @CreateFromQuaternion(%struct.1 %p2)
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

define %struct.2 @CreateFromQuaternion(%struct.1 %p0) {
entry:
  %0 = alloca %struct.2, i32 1
  store %struct.2 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.2>
  %2 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 0
  %3 = addrspacecast ptr %2 to ptr<float>
  %4 = extractvalue %struct.1 %p0, 1
  %5 = extractvalue %struct.1 %p0, 1
  %6 = fmul float %4, %5
  %7 = extractvalue %struct.1 %p0, 2
  %8 = extractvalue %struct.1 %p0, 2
  %9 = fmul float %7, %8
  %10 = fadd float %6, %9
  %11 = fmul float %10, 2.0
  %12 = fsub float 1.0, %11
  %13 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 1
  %14 = addrspacecast ptr %13 to ptr<float>
  %15 = extractvalue %struct.1 %p0, 0
  %16 = extractvalue %struct.1 %p0, 1
  %17 = fmul float %15, %16
  %18 = extractvalue %struct.1 %p0, 2
  %19 = extractvalue %struct.1 %p0, 3
  %20 = fmul float %18, %19
  %21 = fadd float %17, %20
  %22 = fmul float %21, 2.0
  %23 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 2
  %24 = addrspacecast ptr %23 to ptr<float>
  %25 = extractvalue %struct.1 %p0, 2
  %26 = extractvalue %struct.1 %p0, 0
  %27 = fmul float %25, %26
  %28 = extractvalue %struct.1 %p0, 1
  %29 = extractvalue %struct.1 %p0, 3
  %30 = fmul float %28, %29
  %31 = fsub float %27, %30
  %32 = fmul float %31, 2.0
  %33 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 4
  %34 = addrspacecast ptr %33 to ptr<float>
  %35 = fsub float %17, %20
  %36 = fmul float %35, 2.0
  %37 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 5
  %38 = addrspacecast ptr %37 to ptr<float>
  %39 = extractvalue %struct.1 %p0, 0
  %40 = extractvalue %struct.1 %p0, 0
  %41 = fmul float %39, %40
  %42 = fadd float %9, %41
  %43 = fmul float %42, 2.0
  %44 = fsub float 1.0, %43
  %45 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 6
  %46 = addrspacecast ptr %45 to ptr<float>
  %47 = extractvalue %struct.1 %p0, 1
  %48 = extractvalue %struct.1 %p0, 2
  %49 = fmul float %47, %48
  %50 = extractvalue %struct.1 %p0, 0
  %51 = extractvalue %struct.1 %p0, 3
  %52 = fmul float %50, %51
  %53 = fadd float %49, %52
  %54 = fmul float %53, 2.0
  %55 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 8
  %56 = addrspacecast ptr %55 to ptr<float>
  %57 = fadd float %27, %30
  %58 = fmul float %57, 2.0
  %59 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 9
  %60 = addrspacecast ptr %59 to ptr<float>
  %61 = fsub float %49, %52
  %62 = fmul float %61, 2.0
  %63 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 10
  %64 = addrspacecast ptr %63 to ptr<float>
  %65 = fadd float %6, %41
  %66 = fmul float %65, 2.0
  %67 = fsub float 1.0, %66
  %68 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 15
  %69 = addrspacecast ptr %68 to ptr<float>
  br label %bb1

bb1:
  store %struct.2 null, ptr %1
  store float %12, ptr %3
  store float %22, ptr %14
  store float %32, ptr %24
  store float %36, ptr %34
  store float %44, ptr %38
  store float %54, ptr %46
  store float %58, ptr %56
  store float %62, ptr %60
  store float %67, ptr %64
  store float 1.0, ptr %69
  %70 = load %struct.2, ptr %1
  br label %bb2

bb2:
  ret %struct.2 %70

}


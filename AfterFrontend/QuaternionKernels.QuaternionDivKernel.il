; module: QuaternionDivKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float }

define void @QuaternionDivKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2, %struct.1 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %1
  %2 = addrspacecast ptr %0 to ptr<%struct.0>
  %3 = addrspacecast ptr %1 to ptr<%struct.1>
  br label %bb1

bb1:
  %4 = call %struct.1 @op_Division(%struct.1 %p2, %struct.1 %p3)
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

define %struct.1 @op_Division(%struct.1 %p0, %struct.1 %p1) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.1>
  %2 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %3 = addrspacecast ptr %2 to ptr<float>
  %4 = extractvalue %struct.1 %p0, 0
  %5 = extractvalue %struct.1 %p1, 3
  %6 = extractvalue %struct.1 %p1, 0
  %7 = extractvalue %struct.1 %p1, 0
  %8 = fmul float %6, %7
  %9 = extractvalue %struct.1 %p1, 1
  %10 = extractvalue %struct.1 %p1, 1
  %11 = fmul float %9, %10
  %12 = fadd float %8, %11
  %13 = extractvalue %struct.1 %p1, 2
  %14 = extractvalue %struct.1 %p1, 2
  %15 = fmul float %13, %14
  %16 = fadd float %12, %15
  %17 = extractvalue %struct.1 %p1, 3
  %18 = extractvalue %struct.1 %p1, 3
  %19 = fmul float %17, %18
  %20 = fadd float %16, %19
  %21 = fdiv float 1.0, %20
  %22 = fmul float %5, %21
  %23 = fmul float %4, %22
  %24 = extractvalue %struct.1 %p1, 0
  %25 = fneg float %24
  %26 = fmul float %25, %21
  %27 = extractvalue %struct.1 %p0, 3
  %28 = fmul float %26, %27
  %29 = fadd float %23, %28
  %30 = extractvalue %struct.1 %p0, 1
  %31 = extractvalue %struct.1 %p1, 2
  %32 = fneg float %31
  %33 = fmul float %32, %21
  %34 = fmul float %30, %33
  %35 = extractvalue %struct.1 %p0, 2
  %36 = extractvalue %struct.1 %p1, 1
  %37 = fneg float %36
  %38 = fmul float %37, %21
  %39 = fmul float %35, %38
  %40 = fsub float %34, %39
  %41 = fadd float %29, %40
  %42 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %43 = addrspacecast ptr %42 to ptr<float>
  %44 = extractvalue %struct.1 %p0, 1
  %45 = fmul float %44, %22
  %46 = extractvalue %struct.1 %p0, 3
  %47 = fmul float %38, %46
  %48 = fadd float %45, %47
  %49 = extractvalue %struct.1 %p0, 2
  %50 = fmul float %49, %26
  %51 = extractvalue %struct.1 %p0, 0
  %52 = fmul float %51, %33
  %53 = fsub float %50, %52
  %54 = fadd float %48, %53
  %55 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 2
  %56 = addrspacecast ptr %55 to ptr<float>
  %57 = extractvalue %struct.1 %p0, 2
  %58 = fmul float %57, %22
  %59 = extractvalue %struct.1 %p0, 3
  %60 = fmul float %33, %59
  %61 = fadd float %58, %60
  %62 = extractvalue %struct.1 %p0, 0
  %63 = fmul float %62, %38
  %64 = extractvalue %struct.1 %p0, 1
  %65 = fmul float %64, %26
  %66 = fsub float %63, %65
  %67 = fadd float %61, %66
  %68 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 3
  %69 = addrspacecast ptr %68 to ptr<float>
  %70 = extractvalue %struct.1 %p0, 3
  %71 = fmul float %70, %22
  %72 = extractvalue %struct.1 %p0, 0
  %73 = fmul float %72, %26
  %74 = extractvalue %struct.1 %p0, 1
  %75 = fmul float %74, %38
  %76 = fadd float %73, %75
  %77 = extractvalue %struct.1 %p0, 2
  %78 = fmul float %77, %33
  %79 = fadd float %76, %78
  %80 = fsub float %71, %79
  br label %bb1

bb1:
  store %struct.1 null, ptr %1
  store float %41, ptr %3
  store float %54, ptr %43
  store float %67, ptr %56
  store float %80, ptr %69
  %81 = load %struct.1, ptr %1
  br label %bb2

bb2:
  ret %struct.1 %81

}


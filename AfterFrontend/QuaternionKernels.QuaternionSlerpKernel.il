; module: QuaternionSlerpKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float }

define void @QuaternionSlerpKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2, %struct.1 %p3, float %p4) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %1
  %2 = addrspacecast ptr %0 to ptr<%struct.0>
  %3 = addrspacecast ptr %1 to ptr<%struct.1>
  br label %bb1

bb1:
  %4 = call ptr<float> @get_Item(ptr<%struct.0> %2, i32 %p0)
  %5 = call %struct.1 @Slerp(%struct.1 %p2, %struct.1 %p3, float %p4)
  store %struct.1 %5, ptr %1
  %6 = call float @Sum(ptr<%struct.1> %3)
  store float %6, ptr %4
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

define %struct.1 @Slerp(%struct.1 %p0, %struct.1 %p1, float %p2) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = extractvalue %struct.1 %p0, 0
  %2 = extractvalue %struct.1 %p1, 0
  %3 = fmul float %1, %2
  %4 = extractvalue %struct.1 %p0, 1
  %5 = extractvalue %struct.1 %p1, 1
  %6 = fmul float %4, %5
  %7 = fadd float %3, %6
  %8 = extractvalue %struct.1 %p0, 2
  %9 = extractvalue %struct.1 %p1, 2
  %10 = fmul float %8, %9
  %11 = fadd float %7, %10
  %12 = extractvalue %struct.1 %p0, 3
  %13 = extractvalue %struct.1 %p1, 3
  %14 = fmul float %12, %13
  %15 = fadd float %11, %14
  %16 = fcmp uge float %15, 0.0
  %17 = fneg float %15
  br label %bb1

bb1:
  br i1 %16, label %bb3, label %bb2

bb2:
  br label %bb3

bb3:
  %18 = phi float [ %15, %bb1 ], [ %17, %bb2 ]
  %19 = phi float [ %p2, %bb1 ], [ %p2, %bb2 ]
  %20 = phi i1 [ false, %bb1 ], [ true, %bb2 ]
  %21 = phi ptr<%struct.1> addrspace(local) [ %0, %bb1 ], [ %0, %bb2 ]
  %22 = phi %struct.1 [ %p0, %bb1 ], [ %p0, %bb2 ]
  %23 = phi %struct.1 [ %p1, %bb1 ], [ %p1, %bb2 ]
  %24 = fcmp ule float %18, 0.999998987
  %25 = fneg float %19
  %26 = fsub float 1.0, %19
  %27 = call float @ilgpu.acos.float(float %18)
  %28 = fmul float %19, %27
  %29 = call float @llvm.sin.float(float %28)
  %30 = call float @llvm.sin.float(float %27)
  %31 = fdiv float 1.0, %30
  %32 = fmul float %29, %31
  %33 = fmul float %19, %27
  %34 = call float @llvm.sin.float(float %33)
  %35 = fneg float %34
  %36 = fmul float %35, %31
  %37 = fsub float 1.0, %19
  %38 = fmul float %37, %27
  %39 = call float @llvm.sin.float(float %38)
  %40 = fmul float %39, %31
  br i1 %24, label %bb8, label %bb4

bb4:
  br i1 %20, label %bb6, label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %41 = phi float [ %19, %bb5 ], [ %25, %bb6 ]
  %42 = phi ptr<%struct.1> addrspace(local) [ %21, %bb5 ], [ %21, %bb6 ]
  %43 = phi float [ %26, %bb5 ], [ %26, %bb6 ]
  %44 = phi %struct.1 [ %22, %bb5 ], [ %22, %bb6 ]
  %45 = phi %struct.1 [ %23, %bb5 ], [ %23, %bb6 ]
  br label %bb12

bb8:
  br i1 %20, label %bb10, label %bb9

bb9:
  br label %bb11

bb10:
  br label %bb11

bb11:
  %46 = phi float [ %32, %bb9 ], [ %36, %bb10 ]
  %47 = phi ptr<%struct.1> addrspace(local) [ %21, %bb9 ], [ %21, %bb10 ]
  %48 = phi float [ %40, %bb9 ], [ %40, %bb10 ]
  %49 = phi %struct.1 [ %22, %bb9 ], [ %22, %bb10 ]
  %50 = phi %struct.1 [ %23, %bb9 ], [ %23, %bb10 ]
  br label %bb12

bb12:
  %51 = phi ptr<%struct.1> addrspace(local) [ %42, %bb7 ], [ %47, %bb11 ]
  %52 = phi float [ %43, %bb7 ], [ %48, %bb11 ]
  %53 = phi %struct.1 [ %44, %bb7 ], [ %49, %bb11 ]
  %54 = phi float [ %41, %bb7 ], [ %46, %bb11 ]
  %55 = phi %struct.1 [ %45, %bb7 ], [ %50, %bb11 ]
  %56 = addrspacecast ptr %51 to ptr<%struct.1>
  store %struct.1 null, ptr %56
  %57 = getelementptr inbounds %struct.1, ptr %51, i32 0, i32 0
  %58 = addrspacecast ptr %57 to ptr<float>
  %59 = extractvalue %struct.1 %53, 0
  %60 = fmul float %52, %59
  %61 = extractvalue %struct.1 %55, 0
  %62 = fmul float %54, %61
  %63 = fadd float %60, %62
  store float %63, ptr %58
  %64 = getelementptr inbounds %struct.1, ptr %51, i32 0, i32 1
  %65 = addrspacecast ptr %64 to ptr<float>
  %66 = extractvalue %struct.1 %53, 1
  %67 = fmul float %52, %66
  %68 = extractvalue %struct.1 %55, 1
  %69 = fmul float %54, %68
  %70 = fadd float %67, %69
  store float %70, ptr %65
  %71 = getelementptr inbounds %struct.1, ptr %51, i32 0, i32 2
  %72 = addrspacecast ptr %71 to ptr<float>
  %73 = extractvalue %struct.1 %53, 2
  %74 = fmul float %52, %73
  %75 = extractvalue %struct.1 %55, 2
  %76 = fmul float %54, %75
  %77 = fadd float %74, %76
  store float %77, ptr %72
  %78 = getelementptr inbounds %struct.1, ptr %51, i32 0, i32 3
  %79 = addrspacecast ptr %78 to ptr<float>
  %80 = extractvalue %struct.1 %53, 3
  %81 = fmul float %52, %80
  %82 = extractvalue %struct.1 %55, 3
  %83 = fmul float %54, %82
  %84 = fadd float %81, %83
  store float %84, ptr %79
  %85 = load %struct.1, ptr %56
  br label %bb13

bb13:
  ret %struct.1 %85

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


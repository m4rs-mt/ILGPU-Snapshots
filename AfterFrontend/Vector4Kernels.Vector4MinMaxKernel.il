; module: Vector4MinMaxKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%struct.1 = type { float, float, float, float }

define void @Vector4MinMaxKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2, %struct.1 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.0>
  br label %bb1

bb1:
  %2 = call %struct.1 @Min(%struct.1 %p2, %struct.1 %p3)
  %3 = call %struct.1 @Max(%struct.1 %p2, %struct.1 %p3)
  %4 = call ptr<float> @get_Item(ptr<%struct.0> %1, i32 %p0)
  %5 = extractvalue %struct.1 %2, 0
  %6 = extractvalue %struct.1 %3, 3
  %7 = fadd float %5, %6
  store float %7, ptr %4
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

define %struct.1 @Max(%struct.1 %p0, %struct.1 %p1) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.1>
  %2 = extractvalue %struct.1 %p0, 0
  %3 = extractvalue %struct.1 %p1, 0
  %4 = fcmp ogt float %2, %3
  %5 = extractvalue %struct.1 %p1, 0
  %6 = extractvalue %struct.1 %p0, 0
  br label %bb1

bb1:
  store %struct.1 null, ptr %1
  br i1 %4, label %bb3, label %bb2

bb2:
  br label %bb4

bb3:
  br label %bb4

bb4:
  %7 = phi float [ %5, %bb2 ], [ %6, %bb3 ]
  %8 = phi ptr<%struct.1> addrspace(local) [ %0, %bb2 ], [ %0, %bb3 ]
  %9 = phi ptr<%struct.1> addrspace(local) [ %0, %bb2 ], [ %0, %bb3 ]
  %10 = phi %struct.1 [ %p0, %bb2 ], [ %p0, %bb3 ]
  %11 = phi %struct.1 [ %p1, %bb2 ], [ %p1, %bb3 ]
  %12 = getelementptr inbounds %struct.1, ptr %8, i32 0, i32 0
  %13 = addrspacecast ptr %12 to ptr<float>
  store float %7, ptr %13
  %14 = extractvalue %struct.1 %10, 1
  %15 = extractvalue %struct.1 %11, 1
  %16 = fcmp ogt float %14, %15
  %17 = extractvalue %struct.1 %11, 1
  %18 = extractvalue %struct.1 %10, 1
  br i1 %16, label %bb6, label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %19 = phi float [ %17, %bb5 ], [ %18, %bb6 ]
  %20 = phi ptr<%struct.1> addrspace(local) [ %9, %bb5 ], [ %9, %bb6 ]
  %21 = phi ptr<%struct.1> addrspace(local) [ %9, %bb5 ], [ %9, %bb6 ]
  %22 = phi %struct.1 [ %10, %bb5 ], [ %10, %bb6 ]
  %23 = phi %struct.1 [ %11, %bb5 ], [ %11, %bb6 ]
  %24 = getelementptr inbounds %struct.1, ptr %20, i32 0, i32 1
  %25 = addrspacecast ptr %24 to ptr<float>
  store float %19, ptr %25
  %26 = extractvalue %struct.1 %22, 2
  %27 = extractvalue %struct.1 %23, 2
  %28 = fcmp ogt float %26, %27
  %29 = extractvalue %struct.1 %23, 2
  %30 = extractvalue %struct.1 %22, 2
  br i1 %28, label %bb9, label %bb8

bb8:
  br label %bb10

bb9:
  br label %bb10

bb10:
  %31 = phi float [ %29, %bb8 ], [ %30, %bb9 ]
  %32 = phi ptr<%struct.1> addrspace(local) [ %21, %bb8 ], [ %21, %bb9 ]
  %33 = phi ptr<%struct.1> addrspace(local) [ %21, %bb8 ], [ %21, %bb9 ]
  %34 = phi %struct.1 [ %22, %bb8 ], [ %22, %bb9 ]
  %35 = phi %struct.1 [ %23, %bb8 ], [ %23, %bb9 ]
  %36 = getelementptr inbounds %struct.1, ptr %32, i32 0, i32 2
  %37 = addrspacecast ptr %36 to ptr<float>
  store float %31, ptr %37
  %38 = extractvalue %struct.1 %34, 3
  %39 = extractvalue %struct.1 %35, 3
  %40 = fcmp ogt float %38, %39
  %41 = extractvalue %struct.1 %35, 3
  %42 = extractvalue %struct.1 %34, 3
  br i1 %40, label %bb12, label %bb11

bb11:
  br label %bb13

bb12:
  br label %bb13

bb13:
  %43 = phi float [ %41, %bb11 ], [ %42, %bb12 ]
  %44 = phi ptr<%struct.1> addrspace(local) [ %33, %bb11 ], [ %33, %bb12 ]
  %45 = phi ptr<%struct.1> addrspace(local) [ %33, %bb11 ], [ %33, %bb12 ]
  %46 = getelementptr inbounds %struct.1, ptr %44, i32 0, i32 3
  %47 = addrspacecast ptr %46 to ptr<float>
  store float %43, ptr %47
  %48 = addrspacecast ptr %45 to ptr<%struct.1>
  %49 = load %struct.1, ptr %48
  br label %bb14

bb14:
  ret %struct.1 %49

}

define %struct.1 @Min(%struct.1 %p0, %struct.1 %p1) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.1>
  %2 = extractvalue %struct.1 %p0, 0
  %3 = extractvalue %struct.1 %p1, 0
  %4 = fcmp olt float %2, %3
  %5 = extractvalue %struct.1 %p1, 0
  %6 = extractvalue %struct.1 %p0, 0
  br label %bb1

bb1:
  store %struct.1 null, ptr %1
  br i1 %4, label %bb3, label %bb2

bb2:
  br label %bb4

bb3:
  br label %bb4

bb4:
  %7 = phi float [ %5, %bb2 ], [ %6, %bb3 ]
  %8 = phi ptr<%struct.1> addrspace(local) [ %0, %bb2 ], [ %0, %bb3 ]
  %9 = phi ptr<%struct.1> addrspace(local) [ %0, %bb2 ], [ %0, %bb3 ]
  %10 = phi %struct.1 [ %p0, %bb2 ], [ %p0, %bb3 ]
  %11 = phi %struct.1 [ %p1, %bb2 ], [ %p1, %bb3 ]
  %12 = getelementptr inbounds %struct.1, ptr %8, i32 0, i32 0
  %13 = addrspacecast ptr %12 to ptr<float>
  store float %7, ptr %13
  %14 = extractvalue %struct.1 %10, 1
  %15 = extractvalue %struct.1 %11, 1
  %16 = fcmp olt float %14, %15
  %17 = extractvalue %struct.1 %11, 1
  %18 = extractvalue %struct.1 %10, 1
  br i1 %16, label %bb6, label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %19 = phi float [ %17, %bb5 ], [ %18, %bb6 ]
  %20 = phi ptr<%struct.1> addrspace(local) [ %9, %bb5 ], [ %9, %bb6 ]
  %21 = phi ptr<%struct.1> addrspace(local) [ %9, %bb5 ], [ %9, %bb6 ]
  %22 = phi %struct.1 [ %10, %bb5 ], [ %10, %bb6 ]
  %23 = phi %struct.1 [ %11, %bb5 ], [ %11, %bb6 ]
  %24 = getelementptr inbounds %struct.1, ptr %20, i32 0, i32 1
  %25 = addrspacecast ptr %24 to ptr<float>
  store float %19, ptr %25
  %26 = extractvalue %struct.1 %22, 2
  %27 = extractvalue %struct.1 %23, 2
  %28 = fcmp olt float %26, %27
  %29 = extractvalue %struct.1 %23, 2
  %30 = extractvalue %struct.1 %22, 2
  br i1 %28, label %bb9, label %bb8

bb8:
  br label %bb10

bb9:
  br label %bb10

bb10:
  %31 = phi float [ %29, %bb8 ], [ %30, %bb9 ]
  %32 = phi ptr<%struct.1> addrspace(local) [ %21, %bb8 ], [ %21, %bb9 ]
  %33 = phi ptr<%struct.1> addrspace(local) [ %21, %bb8 ], [ %21, %bb9 ]
  %34 = phi %struct.1 [ %22, %bb8 ], [ %22, %bb9 ]
  %35 = phi %struct.1 [ %23, %bb8 ], [ %23, %bb9 ]
  %36 = getelementptr inbounds %struct.1, ptr %32, i32 0, i32 2
  %37 = addrspacecast ptr %36 to ptr<float>
  store float %31, ptr %37
  %38 = extractvalue %struct.1 %34, 3
  %39 = extractvalue %struct.1 %35, 3
  %40 = fcmp olt float %38, %39
  %41 = extractvalue %struct.1 %35, 3
  %42 = extractvalue %struct.1 %34, 3
  br i1 %40, label %bb12, label %bb11

bb11:
  br label %bb13

bb12:
  br label %bb13

bb13:
  %43 = phi float [ %41, %bb11 ], [ %42, %bb12 ]
  %44 = phi ptr<%struct.1> addrspace(local) [ %33, %bb11 ], [ %33, %bb12 ]
  %45 = phi ptr<%struct.1> addrspace(local) [ %33, %bb11 ], [ %33, %bb12 ]
  %46 = getelementptr inbounds %struct.1, ptr %44, i32 0, i32 3
  %47 = addrspacecast ptr %46 to ptr<float>
  store float %43, ptr %47
  %48 = addrspacecast ptr %45 to ptr<%struct.1>
  %49 = load %struct.1, ptr %48
  br label %bb14

bb14:
  ret %struct.1 %49

}


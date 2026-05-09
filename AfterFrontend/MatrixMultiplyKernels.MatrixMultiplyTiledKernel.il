; module: MatrixMultiplyTiledKernel  [intptr: i64]

%struct.0 = type { i64, i32 }
%view.float = view float
%struct.1 = type { i64, i64 }
%struct.2 = type { %view.float, i64, i64, i32 }
%struct.3 = type { i32, i32 }

@g0 = internal global float zeroinitializer ; shared
@g1 = internal global float zeroinitializer ; shared

define void @MatrixMultiplyTiledKernel(%struct.0 %p0, %struct.2 %p1, %struct.2 %p2, %struct.2 %p3, i32 %p4) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p0, ptr %0
  %1 = alloca %struct.2, i32 1
  store %struct.2 %p1, ptr %1
  %2 = alloca %struct.2, i32 1
  store %struct.2 %p2, ptr %2
  %3 = alloca %struct.2, i32 1
  store %struct.2 %p3, ptr %3
  %4 = alloca %struct.2, i32 1
  store %struct.2 null, ptr %4
  %5 = alloca %struct.2, i32 1
  store %struct.2 null, ptr %5
  %6 = alloca %struct.3, i32 1
  store %struct.3 null, ptr %6
  %7 = alloca %struct.3, i32 1
  %8 = alloca %struct.3, i32 1
  %9 = alloca %struct.3, i32 1
  %10 = alloca %struct.3, i32 1
  %11 = alloca %struct.3, i32 1
  %12 = alloca %struct.3, i32 1
  %13 = alloca %struct.3, i32 1
  %14 = alloca %struct.3, i32 1
  %15 = alloca %struct.3, i32 1
  %16 = alloca %struct.3, i32 1
  %17 = alloca %struct.3, i32 1
  %18 = addrspacecast ptr %7 to ptr<%struct.3>
  %19 = call %view.float @ilgpu.view.new(ptr @g0, i64 4)
  %20 = bitcast %view.float %19 to %view.float
  %21 = { %view.float %20, i64 2, i64 2, i32 2 }  ; %struct.2
  %22 = addrspacecast ptr %8 to ptr<%struct.3>
  %23 = call %view.float @ilgpu.view.new(ptr @g1, i64 4)
  %24 = bitcast %view.float %23 to %view.float
  %25 = { %view.float %24, i64 2, i64 2, i32 2 }  ; %struct.2
  %26 = addrspacecast ptr %0 to ptr<%struct.0>
  %27 = sext i32 %p4 to i64
  %28 = sext i32 %p4 to i64
  %29 = addrspacecast ptr %9 to ptr<%struct.3>
  %30 = addrspacecast ptr %10 to ptr<%struct.3>
  %31 = addrspacecast ptr %11 to ptr<%struct.3>
  %32 = addrspacecast ptr %12 to ptr<%struct.3>
  %33 = addrspacecast ptr %13 to ptr<%struct.3>
  %34 = addrspacecast ptr %14 to ptr<%struct.3>
  %35 = addrspacecast ptr %15 to ptr<%struct.3>
  %36 = addrspacecast ptr %16 to ptr<%struct.3>
  %37 = addrspacecast ptr %17 to ptr<%struct.3>
  br label %bb1

bb1:
  store %struct.3 null, ptr %18
  call void @.ctor(ptr<%struct.3> %18, i32 2, i32 2)
  %38 = load %struct.3, ptr %18
  store %struct.2 %21, ptr %4
  store %struct.3 null, ptr %22
  call void @.ctor(ptr<%struct.3> %22, i32 2, i32 2)
  %39 = load %struct.3, ptr %22
  store %struct.2 %25, ptr %5
  %40 = call i64 @get_GridIndex(ptr<%struct.0> %26)
  %41 = call i64 @get_GridIndex(ptr<%struct.0> %26)
  %42 = call i32 @get_GroupIndex(ptr<%struct.0> %26)
  %43 = call i32 @get_GroupIndex(ptr<%struct.0> %26)
  %44 = sdiv i64 %40, %27
  %45 = trunc i64 %44 to i32
  %46 = shl i32 %45, 1
  %47 = ashr i32 %42, 1
  %48 = add i32 %46, %47
  %49 = srem i64 %41, %28
  %50 = trunc i64 %49 to i32
  %51 = shl i32 %50, 1
  %52 = srem i32 %43, 2
  %53 = add i32 %51, %52
  br label %bb2

bb2:
  %54 = phi i32 [ 0, %bb1 ], [ %66, %bb9 ]
  %55 = phi ptr<%struct.2> addrspace(local) [ %1, %bb1 ], [ %55, %bb9 ]
  %56 = phi ptr<%struct.3> addrspace(local) [ %6, %bb1 ], [ %56, %bb9 ]
  %57 = phi i32 [ %48, %bb1 ], [ %57, %bb9 ]
  %58 = phi ptr<%struct.2> addrspace(local) [ %3, %bb1 ], [ %58, %bb9 ]
  %59 = phi i32 [ %53, %bb1 ], [ %59, %bb9 ]
  %60 = phi float [ 0.0, %bb1 ], [ %122, %bb9 ]
  %61 = phi ptr<%struct.2> addrspace(local) [ %4, %bb1 ], [ %61, %bb9 ]
  %62 = phi i32 [ %47, %bb1 ], [ %62, %bb9 ]
  %63 = phi i32 [ %52, %bb1 ], [ %63, %bb9 ]
  %64 = phi ptr<%struct.2> addrspace(local) [ %5, %bb1 ], [ %64, %bb9 ]
  %65 = phi ptr<%struct.2> addrspace(local) [ %2, %bb1 ], [ %65, %bb9 ]
  %66 = add i32 %54, 2
  %67 = addrspacecast ptr %55 to ptr<%struct.2>
  %68 = call %struct.3 @get_IntExtent(ptr<%struct.2> %67)
  store %struct.3 %68, ptr %56
  %69 = addrspacecast ptr %56 to ptr<%struct.3>
  %70 = call i32 @get_Y(ptr<%struct.3> %69)
  %71 = icmp slt i32 %54, %70
  %72 = addrspacecast ptr %58 to ptr<%struct.2>
  %73 = addrspacecast ptr %56 to ptr<%struct.3>
  %74 = addrspacecast ptr %58 to ptr<%struct.2>
  %75 = addrspacecast ptr %56 to ptr<%struct.3>
  %76 = addrspacecast ptr %61 to ptr<%struct.2>
  %77 = add i32 %63, %54
  %78 = addrspacecast ptr %55 to ptr<%struct.2>
  %79 = addrspacecast ptr %64 to ptr<%struct.2>
  %80 = add i32 %62, %54
  %81 = addrspacecast ptr %65 to ptr<%struct.2>
  br i1 %71, label %bb9, label %bb3

bb3:
  %82 = call %struct.3 @get_IntExtent(ptr<%struct.2> %72)
  store %struct.3 %82, ptr %56
  %83 = call i32 @get_X(ptr<%struct.3> %73)
  %84 = icmp sge i32 %57, %83
  br i1 %84, label %bb5, label %bb4

bb4:
  %85 = call %struct.3 @get_IntExtent(ptr<%struct.2> %74)
  store %struct.3 %85, ptr %56
  %86 = call i32 @get_Y(ptr<%struct.3> %75)
  %87 = icmp slt i32 %59, %86
  br label %bb6

bb5:
  br label %bb6

bb6:
  %88 = phi i1 [ %87, %bb4 ], [ false, %bb5 ]
  %89 = phi ptr<%struct.2> addrspace(local) [ %58, %bb4 ], [ %58, %bb5 ]
  %90 = phi i32 [ %57, %bb4 ], [ %57, %bb5 ]
  %91 = phi i32 [ %59, %bb4 ], [ %59, %bb5 ]
  %92 = phi float [ %60, %bb4 ], [ %60, %bb5 ]
  %93 = xor i1 %88, -1
  %94 = addrspacecast ptr %89 to ptr<%struct.2>
  br i1 %93, label %bb8, label %bb7

bb7:
  store %struct.3 null, ptr %29
  call void @.ctor(ptr<%struct.3> %29, i32 %90, i32 %91)
  %95 = load %struct.3, ptr %29
  %96 = call ptr<float> @get_Item(ptr<%struct.2> %94, %struct.3 %95)
  store float %92, ptr %96
  br label %bb8

bb8:
  ret void

bb9:
  store %struct.3 null, ptr %30
  call void @.ctor(ptr<%struct.3> %30, i32 %62, i32 %63)
  %97 = load %struct.3, ptr %30
  %98 = call ptr<float> @get_Item(ptr<%struct.2> %76, %struct.3 %97)
  store %struct.3 null, ptr %31
  call void @.ctor(ptr<%struct.3> %31, i32 %57, i32 %77)
  %99 = load %struct.3, ptr %31
  %100 = call ptr<float> @get_Item(ptr<%struct.2> %78, %struct.3 %99)
  %101 = load float, ptr %100
  store float %101, ptr %98
  store %struct.3 null, ptr %32
  call void @.ctor(ptr<%struct.3> %32, i32 %62, i32 %63)
  %102 = load %struct.3, ptr %32
  %103 = call ptr<float> @get_Item(ptr<%struct.2> %79, %struct.3 %102)
  store %struct.3 null, ptr %33
  call void @.ctor(ptr<%struct.3> %33, i32 %80, i32 %59)
  %104 = load %struct.3, ptr %33
  %105 = call ptr<float> @get_Item(ptr<%struct.2> %81, %struct.3 %104)
  %106 = load float, ptr %105
  store float %106, ptr %103
  call void @ilgpu.barrier.group()
  store %struct.3 null, ptr %34
  call void @.ctor(ptr<%struct.3> %34, i32 %62, i32 0)
  %107 = load %struct.3, ptr %34
  %108 = call ptr<float> @get_Item(ptr<%struct.2> %76, %struct.3 %107)
  %109 = load float, ptr %108
  store %struct.3 null, ptr %35
  call void @.ctor(ptr<%struct.3> %35, i32 0, i32 %63)
  %110 = load %struct.3, ptr %35
  %111 = call ptr<float> @get_Item(ptr<%struct.2> %79, %struct.3 %110)
  %112 = load float, ptr %111
  store %struct.3 null, ptr %36
  call void @.ctor(ptr<%struct.3> %36, i32 %62, i32 1)
  %113 = load %struct.3, ptr %36
  %114 = call ptr<float> @get_Item(ptr<%struct.2> %76, %struct.3 %113)
  %115 = load float, ptr %114
  store %struct.3 null, ptr %37
  call void @.ctor(ptr<%struct.3> %37, i32 1, i32 %63)
  %116 = load %struct.3, ptr %37
  %117 = call ptr<float> @get_Item(ptr<%struct.2> %79, %struct.3 %116)
  %118 = load float, ptr %117
  call void @ilgpu.barrier.group()
  %119 = fmul float %109, %112
  %120 = fadd float %60, %119
  %121 = fmul float %115, %118
  %122 = fadd float %120, %121
  br label %bb2

}

define ptr<float> @get_Item(ptr<%struct.2> %p0, %struct.3 %p1) {
entry:
  %0 = alloca %view.float, i32 1
  store %view.float null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%view.float>
  br label %bb1

bb1:
  %2 = call %view.float @get_BaseView(ptr<%struct.2> %p0)
  store %view.float %2, ptr %0
  %3 = call i32 @ComputeLinearIndex(ptr<%struct.2> %p0, %struct.3 %p1)
  %4 = load %view.float, ptr %1
  %5 = getelementptr float, ptr %4, i32 %3
  ret ptr<float> %5

}

define i32 @ComputeLinearIndex(ptr<%struct.2> %p0, %struct.3 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i32>
  br label %bb1

bb1:
  %2 = call i32 @get_Stride(ptr<%struct.2> %p0)
  store i32 %2, ptr %0
  %3 = call %struct.3 @get_IntExtent(ptr<%struct.2> %p0)
  %4 = call i32 @ComputeElementIndexChecked(ptr<i32> %1, %struct.3 %p1, %struct.3 %3)
  ret i32 %4

}

define i32 @ComputeElementIndexChecked(ptr<i32> %p0, %struct.3 %p1, %struct.3 %p2) {
entry:
  br label %bb1

bb1:
  %0 = load i32, ptr %p0
  %1 = call i32 @ComputeElementIndexChecked(i32 %0, %struct.3 %p1, %struct.3 %p2)
  ret i32 %1

}

define i32 @ComputeElementIndexChecked(i32 %p0, %struct.3 %p1, %struct.3 %p2) {
entry:
  %0 = alloca %struct.3, i32 1
  store %struct.3 %p1, ptr %0
  %1 = alloca %struct.3, i32 1
  store %struct.3 %p2, ptr %1
  %2 = addrspacecast ptr %0 to ptr<%struct.3>
  %3 = addrspacecast ptr %1 to ptr<%struct.3>
  %4 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %5 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  br label %bb1

bb1:
  %6 = call i32 @get_X(ptr<%struct.3> %2)
  %7 = call i32 @get_X(ptr<%struct.3> %2)
  %8 = call i32 @get_X(ptr<%struct.3> %3)
  %9 = call i32 @get_X(ptr<%struct.3> %2)
  %10 = call i32 @get_X(ptr<%struct.3> %3)
  %11 = icmp sge i32 %6, 0
  %12 = icmp slt i32 %7, %8
  %13 = and i1 %11, %12
  %14 = icmp eq i32 %9, 0
  %15 = icmp eq i32 %10, 0
  %16 = and i1 %14, %15
  %17 = or i1 %13, %16
  call void @ilgpu.debug.assert(i1 %17, ptr %4)
  %18 = call i32 @get_Y(ptr<%struct.3> %2)
  %19 = call i32 @get_Y(ptr<%struct.3> %2)
  %20 = call i32 @get_Y(ptr<%struct.3> %3)
  %21 = call i32 @get_Y(ptr<%struct.3> %2)
  %22 = call i32 @get_Y(ptr<%struct.3> %3)
  %23 = icmp sge i32 %18, 0
  %24 = icmp slt i32 %19, %20
  %25 = and i1 %23, %24
  %26 = icmp eq i32 %21, 0
  %27 = icmp eq i32 %22, 0
  %28 = and i1 %26, %27
  %29 = or i1 %25, %28
  call void @ilgpu.debug.assert(i1 %29, ptr %5)
  %30 = load %struct.3, ptr %2
  %31 = call i32 @ComputeElementIndex(i32 %p0, %struct.3 %30)
  br label %bb2

bb2:
  ret i32 %31

}

define i32 @ComputeElementIndex(i32 %p0, %struct.3 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p0, ptr %0
  %1 = alloca %struct.3, i32 1
  store %struct.3 %p1, ptr %1
  %2 = addrspacecast ptr %1 to ptr<%struct.3>
  %3 = addrspacecast ptr %0 to ptr<i32>
  br label %bb1

bb1:
  %4 = call i32 @get_X(ptr<%struct.3> %2)
  %5 = call i32 @get_XStride(ptr<i32> %3)
  %6 = call i32 @get_Y(ptr<%struct.3> %2)
  %7 = call i32 @get_YStride(ptr<i32> %3)
  %8 = mul i32 %4, %5
  %9 = mul i32 %6, %7
  %10 = add i32 %8, %9
  ret i32 %10

}

define i32 @get_YStride(ptr<i32> %p0) {
entry:
  br label %bb1

bb1:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define i32 @get_XStride(ptr<i32> %p0) {
entry:
  br label %bb1

bb1:
  ret i32 1

}

define i32 @get_Stride(ptr<%struct.2> %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 3
  br label %bb1

bb1:
  %1 = load i32, ptr %0
  ret i32 %1

}

define %view.float @get_BaseView(ptr<%struct.2> %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 0
  br label %bb1

bb1:
  %1 = load %view.float, ptr %0
  ret %view.float %1

}

define i32 @get_X(ptr<%struct.3> %p0) {
entry:
  %0 = getelementptr inbounds %struct.3, ptr %p0, i32 0, i32 0
  br label %bb1

bb1:
  %1 = load i32, ptr %0
  ret i32 %1

}

define i32 @get_Y(ptr<%struct.3> %p0) {
entry:
  %0 = getelementptr inbounds %struct.3, ptr %p0, i32 0, i32 1
  br label %bb1

bb1:
  %1 = load i32, ptr %0
  ret i32 %1

}

define %struct.3 @get_IntExtent(ptr<%struct.2> %p0) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.1>
  br label %bb1

bb1:
  %2 = call %struct.1 @get_Extent(ptr<%struct.2> %p0)
  store %struct.1 %2, ptr %0
  %3 = call %struct.3 @ToIntIndex(ptr<%struct.1> %1)
  ret %struct.3 %3

}

define %struct.3 @ToIntIndex(ptr<%struct.1> %p0) {
entry:
  %0 = alloca %struct.3, i32 1
  %1 = addrspacecast ptr %0 to ptr<%struct.3>
  br label %bb1

bb1:
  %2 = call i64 @get_X(ptr<%struct.1> %p0)
  call void @AssertIntIndexRange(i64 %2)
  %3 = call i64 @get_Y(ptr<%struct.1> %p0)
  call void @AssertIntIndexRange(i64 %3)
  %4 = call i64 @get_X(ptr<%struct.1> %p0)
  %5 = call i64 @get_Y(ptr<%struct.1> %p0)
  store %struct.3 null, ptr %1
  %6 = trunc i64 %4 to i32
  %7 = trunc i64 %5 to i32
  call void @.ctor(ptr<%struct.3> %1, i32 %6, i32 %7)
  %8 = load %struct.3, ptr %1
  br label %bb2

bb2:
  ret %struct.3 %8

}

define i64 @get_Y(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 1
  br label %bb1

bb1:
  %1 = load i64, ptr %0
  ret i64 %1

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

define i64 @get_X(ptr<%struct.1> %p0) {
entry:
  %0 = getelementptr inbounds %struct.1, ptr %p0, i32 0, i32 0
  br label %bb1

bb1:
  %1 = load i64, ptr %0
  ret i64 %1

}

define %struct.1 @get_Extent(ptr<%struct.2> %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 1
  br label %bb1

bb1:
  %1 = load %struct.1, ptr %0
  ret %struct.1 %1

}

define i32 @get_GroupIndex(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  br label %bb1

bb1:
  %1 = load i32, ptr %0
  ret i32 %1

}

define i64 @get_GridIndex(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  br label %bb1

bb1:
  %1 = load i64, ptr %0
  ret i64 %1

}

define void @.ctor(ptr<%struct.3> %p0, i32 %p1, i32 %p2) {
entry:
  %0 = getelementptr inbounds %struct.3, ptr %p0, i32 0, i32 0
  %1 = getelementptr inbounds %struct.3, ptr %p0, i32 0, i32 1
  br label %bb1

bb1:
  store i32 %p1, ptr %0
  store i32 %p2, ptr %1
  ret void

}


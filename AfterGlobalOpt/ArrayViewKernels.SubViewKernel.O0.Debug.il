; stage: AfterGlobalOpt  opt: O0
; module: SubViewKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { view<i32>, i64, i8 }

define void @SubViewKernel(i32 %p0, %struct.1 %p1, %struct.1 %p2, i32 %p3) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 %p1, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 %p2, ptr %1
  %2 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %2
  %3 = alloca i32, i32 1
  store i32 0, ptr %3
  %4 = addrspacecast ptr %3 to ptr<i32>
  call void @.ctor(ptr<i32> %4, i32 %p3)
  %5 = load i32, ptr %3
  %6 = addrspacecast ptr %0 to ptr<%struct.1>
  %7 = call i64 @get_Length(ptr<%struct.1> %6)
  call void @AssertIntIndexRange(i64 %7)
  %8 = alloca i32, i32 1
  store i32 0, ptr %8
  %9 = addrspacecast ptr %8 to ptr<i32>
  %10 = trunc i64 %7 to i32
  %11 = sub i32 %10, %p3
  call void @.ctor(ptr<i32> %9, i32 %11)
  %12 = load i32, ptr %8
  %13 = alloca i32, i32 1
  store i32 %5, ptr %13
  %14 = alloca i32, i32 1
  store i32 %12, ptr %14
  %15 = alloca i64, i32 1
  store i64 0, ptr %15
  %16 = alloca i8, i32 1
  store i8 0, ptr %16
  %17 = alloca %struct.0, i32 1
  %18 = addrspacecast ptr %13 to ptr<i32>
  %19 = call i32 @get_X(ptr<i32> %18)
  %20 = call i32 @get_X(ptr<i32> %18)
  %21 = addrspacecast ptr %14 to ptr<i32>
  %22 = call i32 @get_X(ptr<i32> %21)
  %23 = call i64 @get_Extent(ptr<%struct.1> %6)
  store i64 %23, ptr %15
  %24 = addrspacecast ptr %15 to ptr<i64>
  %25 = call i64 @get_X(ptr<i64> %24)
  %26 = call i32 @get_X(ptr<i32> %18)
  %27 = call i32 @get_X(ptr<i32> %21)
  %28 = icmp sge i32 %19, 0
  %29 = add i32 %20, %22
  %30 = trunc i64 %25 to i32
  %31 = icmp sle i32 %29, %30
  %32 = icmp eq i32 %26, 0
  %33 = icmp eq i32 %27, 0
  %34 = and i1 %32, %33
  %35 = or i1 %31, %34
  %36 = and i1 %28, %35
  %37 = call ptr @ilgpu.string("Index_Extent_X_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %36, ptr %37)
  %38 = load i32, ptr %13
  %39 = call i32 @ComputeLinearIndex(ptr<%struct.1> %6, i32 %38)
  %40 = call i8 @get_Stride(ptr<%struct.1> %6)
  store i8 %40, ptr %16
  %41 = load i32, ptr %14
  %42 = addrspacecast ptr %16 to ptr<i8>
  %43 = call i32 @ComputeBufferLength(ptr<i8> %42, i32 %41)
  %44 = call %view.i32 @get_BaseView(ptr<%struct.1> %6)
  %45 = load i32, ptr %14
  %46 = call i64 @op_Implicit(i32 %45)
  %47 = call i8 @get_Stride(ptr<%struct.1> %6)
  store %struct.0 null, ptr %17
  %48 = addrspacecast ptr %17 to ptr<%struct.0>
  %49 = call %view.i32 @ilgpu.view.sub(%view.i32 %44, i64 %39, i64 %43)
  call void @.ctor(ptr<%struct.0> %48, %view.i32 %49, i64 %46, i8 %47)
  %50 = load %struct.0, ptr %17
  store %struct.0 %50, ptr %2
  %51 = addrspacecast ptr %2 to ptr<%struct.0>
  %52 = call i64 @get_Length(ptr<%struct.0> %51)
  call void @AssertIntIndexRange(i64 %52)
  %53 = trunc i64 %52 to i32
  %54 = icmp sge i32 %p0, %53
  %55 = addrspacecast ptr %1 to ptr<%struct.1>
  br i1 %54, label %bb2, label %bb1

bb1:
  %56 = call %view.i32 @get_BaseView(ptr<%struct.1> %55)
  %57 = call i32 @ComputeLinearIndex(ptr<%struct.1> %55, i32 %p0)
  %58 = call %view.i32 @get_BaseView(ptr<%struct.0> %51)
  %59 = call i32 @ComputeLinearIndex(ptr<%struct.0> %51, i32 %p0)
  %60 = getelementptr i32, ptr %58, i32 %59
  %61 = load i32, ptr %60
  %62 = getelementptr i32, ptr %56, i32 %57
  store i32 %61, ptr %62
  br label %bb3

bb2:
  %63 = call %view.i32 @get_BaseView(ptr<%struct.1> %55)
  %64 = call i32 @ComputeLinearIndex(ptr<%struct.1> %55, i32 %p0)
  %65 = getelementptr i32, ptr %63, i32 %64
  store i32 -1, ptr %65
  br label %bb3

bb3:
  ret void

}

define void @.ctor(ptr<%struct.0> %p0, %view.i32 %p1, i64 %p2, i8 %p3) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  store %view.i32 %p1, ptr %0
  %1 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  store i64 %p2, ptr %1
  %2 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  store i8 %p3, ptr %2
  ret void

}

define i64 @op_Implicit(i32 %p0) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p0, ptr %0
  %1 = alloca i64, i32 1
  %2 = addrspacecast ptr %0 to ptr<i32>
  %3 = call i32 @get_X(ptr<i32> %2)
  %4 = addrspacecast ptr %1 to ptr<i64>
  store i64 0, ptr %4
  %5 = sext i32 %3 to i64
  call void @.ctor(ptr<i64> %4, i64 %5)
  %6 = load i64, ptr %4
  ret i64 %6

}

define void @.ctor(ptr<i64> %p0, i64 %p1) {
entry:
  store i64 %p1, ptr %p0
  ret void

}

define %view.i32 @get_BaseView(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

}

define i32 @ComputeBufferLength(ptr<i8> %p0, i32 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p1, ptr %0
  %1 = addrspacecast ptr %0 to ptr<i32>
  %2 = call i32 @get_X(ptr<i32> %1)
  ret i32 %2

}

define i8 @get_Stride(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  ret i8 %1

}

define i32 @ComputeLinearIndex(ptr<%struct.0> %p0, i32 %p1) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = call i64 @get_Extent(ptr<%struct.0> %p0)
  store i64 %3, ptr %2
  %4 = addrspacecast ptr %2 to ptr<i64>
  %5 = call i32 @ToIntIndex(ptr<i64> %4)
  %6 = call i32 @ComputeElementIndexChecked(i8 %1, i32 %p1, i32 %5)
  ret i32 %6

}

define i32 @ComputeElementIndexChecked(i8 %p0, i32 %p1, i32 %p2) {
entry:
  %0 = icmp sge i32 %p1, 0
  %1 = icmp slt i32 %p1, %p2
  %2 = and i1 %0, %1
  %3 = icmp eq i32 %p1, 0
  %4 = icmp eq i32 %p2, 0
  %5 = and i1 %3, %4
  %6 = or i1 %2, %5
  %7 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  %8 = alloca i8, i32 1
  store i8 %p0, ptr %8
  %9 = alloca i32, i32 1
  store i32 %p1, ptr %9
  %10 = addrspacecast ptr %9 to ptr<i32>
  %11 = call i32 @get_X(ptr<i32> %10)
  %12 = addrspacecast ptr %8 to ptr<i8>
  %13 = call i32 @get_XStride(ptr<i8> %12)
  %14 = mul i32 %11, %13
  ret i32 %14

}

define i32 @get_XStride(ptr<i8> %p0) {
entry:
  ret i32 1

}

define i32 @ToIntIndex(ptr<i64> %p0) {
entry:
  %0 = load i64, ptr %p0
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = load i64, ptr %p0
  %6 = trunc i64 %5 to i32
  ret i32 %6

}

define i64 @get_X(ptr<i64> %p0) {
entry:
  %0 = load i64, ptr %p0
  ret i64 %0

}

define i64 @get_Extent(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define i32 @get_X(ptr<i32> %p0) {
entry:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define void @AssertIntIndexRange(i64 %p0) {
entry:
  %0 = icmp sge i64 %p0, -2147483648
  %1 = icmp sle i64 %p0, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  ret void

}

define i64 @get_Length(ptr<%struct.0> %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  %3 = load i64, ptr %2
  %4 = call i64 @op_Implicit(i64 %3)
  ret i64 %4

}

define i64 @op_Implicit(i64 %p0) {
entry:
  ret i64 %p0

}

define void @.ctor(ptr<i32> %p0, i32 %p1) {
entry:
  store i32 %p1, ptr %p0
  ret void

}


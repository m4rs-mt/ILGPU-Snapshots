; stage: AfterGlobalOpt  opt: O0
; module: SubViewKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @SubViewKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, i32 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca %struct.0, i32 1
  store %struct.0 %p2, ptr %1
  %2 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %2
  %3 = alloca i32, i32 1
  store i32 0, ptr %3
  call void @.ctor(ptr<i32> addrspace(local) %3, i32 %p3)
  %4 = load i32, ptr %3
  %5 = call i64 @get_Length(ptr<%struct.0> addrspace(local) %0)
  call void @AssertIntIndexRange(i64 %5)
  %6 = alloca i32, i32 1
  store i32 0, ptr %6
  %7 = trunc i64 %5 to i32
  %8 = sub i32 %7, %p3
  call void @.ctor(ptr<i32> addrspace(local) %6, i32 %8)
  %9 = load i32, ptr %6
  %10 = alloca i32, i32 1
  store i32 %4, ptr %10
  %11 = alloca i32, i32 1
  store i32 %9, ptr %11
  %12 = alloca i64, i32 1
  store i64 0, ptr %12
  %13 = alloca i8, i32 1
  store i8 0, ptr %13
  %14 = alloca %struct.0, i32 1
  %15 = call i32 @get_X(ptr<i32> addrspace(local) %10)
  %16 = call i32 @get_X(ptr<i32> addrspace(local) %10)
  %17 = call i32 @get_X(ptr<i32> addrspace(local) %11)
  %18 = call i64 @get_Extent(ptr<%struct.0> addrspace(local) %0)
  store i64 %18, ptr %12
  %19 = call i64 @get_X(ptr<i64> addrspace(local) %12)
  %20 = call i32 @get_X(ptr<i32> addrspace(local) %10)
  %21 = call i32 @get_X(ptr<i32> addrspace(local) %11)
  %22 = icmp sge i32 %15, 0
  %23 = add i32 %16, %17
  %24 = trunc i64 %19 to i32
  %25 = icmp sle i32 %23, %24
  %26 = icmp eq i32 %20, 0
  %27 = icmp eq i32 %21, 0
  %28 = and i1 %26, %27
  %29 = or i1 %25, %28
  %30 = and i1 %22, %29
  %31 = call ptr @ilgpu.string("Index_Extent_X_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %30, ptr %31)
  %32 = load i32, ptr %10
  %33 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %32)
  %34 = call i8 @get_Stride(ptr<%struct.0> addrspace(local) %0)
  store i8 %34, ptr %13
  %35 = load i32, ptr %11
  %36 = addrspacecast ptr %13 to ptr<i8>
  %37 = call i32 @ComputeBufferLength(ptr<i8> %36, i32 %35)
  %38 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %39 = load i32, ptr %11
  %40 = call i64 @op_Implicit(i32 %39)
  %41 = call i8 @get_Stride(ptr<%struct.0> addrspace(local) %0)
  store %struct.0 null, ptr %14
  %42 = call %view.i32 @ilgpu.view.sub(%view.i32 %38, i64 %33, i64 %37)
  call void @.ctor(ptr<%struct.0> addrspace(local) %14, %view.i32 %42, i64 %40, i8 %41)
  %43 = load %struct.0, ptr %14
  store %struct.0 %43, ptr %2
  %44 = call i64 @get_Length(ptr<%struct.0> addrspace(local) %2)
  call void @AssertIntIndexRange(i64 %44)
  %45 = trunc i64 %44 to i32
  %46 = icmp sge i32 %p0, %45
  br i1 %46, label %bb2, label %bb1

bb1:
  %47 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %1)
  %48 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %1, i32 %p0)
  %49 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %2)
  %50 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %2, i32 %p0)
  %51 = getelementptr i32, ptr %49, i32 %50
  %52 = load i32, ptr %51
  %53 = getelementptr i32, ptr %47, i32 %48
  store i32 %52, ptr %53
  br label %bb3

bb2:
  %54 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %1)
  %55 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %1, i32 %p0)
  %56 = getelementptr i32, ptr %54, i32 %55
  store i32 -1, ptr %56
  br label %bb3

bb3:
  ret void

}

define void @.ctor(ptr<%struct.0> addrspace(local) %p0, %view.i32 %p1, i64 %p2, i8 %p3) {
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
  %2 = call i32 @get_X(ptr<i32> addrspace(local) %0)
  store i64 0, ptr %1
  %3 = sext i32 %2 to i64
  call void @.ctor(ptr<i64> addrspace(local) %1, i64 %3)
  %4 = load i64, ptr %1
  ret i64 %4

}

define void @.ctor(ptr<i64> addrspace(local) %p0, i64 %p1) {
entry:
  store i64 %p1, ptr %p0
  ret void

}

define %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

}

define i32 @ComputeBufferLength(ptr<i8> %p0, i32 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p1, ptr %0
  %1 = call i32 @get_X(ptr<i32> addrspace(local) %0)
  ret i32 %1

}

define i8 @get_Stride(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  ret i8 %1

}

define i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %p0, i32 %p1) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = call i64 @get_Extent(ptr<%struct.0> addrspace(local) %p0)
  store i64 %3, ptr %2
  %4 = call i32 @ToIntIndex(ptr<i64> addrspace(local) %2)
  %5 = call i32 @ComputeElementIndexChecked(i8 %1, i32 %p1, i32 %4)
  ret i32 %5

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
  %8 = alloca i32, i32 1
  store i32 %p1, ptr %8
  %9 = call i32 @get_X(ptr<i32> addrspace(local) %8)
  ret i32 %9

}

define i32 @ToIntIndex(ptr<i64> addrspace(local) %p0) {
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

define i64 @get_X(ptr<i64> addrspace(local) %p0) {
entry:
  %0 = load i64, ptr %p0
  ret i64 %0

}

define i64 @get_Extent(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define i32 @get_X(ptr<i32> addrspace(local) %p0) {
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

define i64 @get_Length(ptr<%struct.0> addrspace(local) %p0) {
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

define void @.ctor(ptr<i32> addrspace(local) %p0, i32 %p1) {
entry:
  store i32 %p1, ptr %p0
  ret void

}


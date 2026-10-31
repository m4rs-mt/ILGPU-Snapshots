; stage: AfterGlobalOpt  opt: O0
; module: BytesKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i32, i32 }

define void @BytesKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca i32, i32 1
  store i32 0, ptr %1
  %2 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %2
  %3 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %4 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %5 = getelementptr i32, ptr %3, i32 %4
  %6 = load i32, ptr %5
  %7 = add i32 %6, 16909056
  store i32 %7, ptr %1
  %8 = getelementptr inbounds %struct.1, ptr %2, i32 0, i32 0
  store i32 256, ptr %8
  %9 = getelementptr inbounds %struct.1, ptr %2, i32 0, i32 1
  store i32 2, ptr %9
  %10 = getelementptr inbounds %struct.1, ptr %2, i32 0, i32 2
  store i32 3, ptr %10
  %11 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %12 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %13 = bitcast ptr %1 to ptr ; i32 -> i8
  %14 = load i8, ptr %13
  %15 = getelementptr i8, ptr %13, i32 1
  %16 = load i8, ptr %15
  %17 = getelementptr i8, ptr %13, i32 2
  %18 = load i8, ptr %17
  %19 = and i32 %p0, 3
  %20 = getelementptr i8, ptr %13, i32 %19
  %21 = load i8, ptr %20
  %22 = getelementptr inbounds %struct.1, ptr %2, i32 0, i32 0
  %23 = bitcast ptr %22 to ptr ; i32 -> i8
  %24 = getelementptr i8, ptr %23, i32 1
  %25 = load i8, ptr %24
  %26 = getelementptr i32, ptr %22, i32 1
  %27 = load i32, ptr %26
  %28 = getelementptr i32, ptr %11, i32 %12
  %29 = zext i8 %14 to i32
  %30 = zext i8 %16 to i32
  %31 = mul i32 %30, 10
  %32 = add i32 %29, %31
  %33 = zext i8 %18 to i32
  %34 = mul i32 %33, 100
  %35 = add i32 %32, %34
  %36 = zext i8 %21 to i32
  %37 = mul i32 %36, 1000
  %38 = add i32 %35, %37
  %39 = zext i8 %25 to i32
  %40 = add i32 %39, %27
  %41 = mul i32 %40, 10000
  %42 = add i32 %38, %41
  store i32 %42, ptr %28
  ret void

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

define i32 @get_X(ptr<i32> addrspace(local) %p0) {
entry:
  %0 = load i32, ptr %p0
  ret i32 %0

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

define i64 @get_Extent(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

}


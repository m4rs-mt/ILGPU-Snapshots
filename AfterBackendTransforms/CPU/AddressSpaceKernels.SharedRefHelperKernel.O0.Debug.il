; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: SharedRefHelperKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedRefHelperKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 32)
  %3 = getelementptr i32, ptr %2, i32 %0
  %4 = mul i32 %p0, 10
  %5 = getelementptr i32, ptr %2, i32 %0
  %6 = icmp sge i32 %0, 32
  %7 = extractvalue %struct.0 %p1, 1
  %8 = icmp sge i64 %7, -2147483648
  %9 = icmp sle i64 %7, 2147483647
  %10 = and i1 %8, %9
  %11 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %12 = icmp sge i32 %p0, 0
  %13 = trunc i64 %7 to i32
  %14 = icmp slt i32 %p0, %13
  %15 = and i1 %12, %14
  %16 = icmp eq i32 %p0, 0
  %17 = icmp eq i32 %13, 0
  %18 = and i1 %16, %17
  %19 = or i1 %15, %18
  %20 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %21 = getelementptr i32, ptr %2, i32 %0
  %22 = extractvalue %struct.0 %p1, 0
  %23 = getelementptr i32, ptr %22, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %4, ptr %3
  call void @Increment(ptr<i32> addrspace(shared) %5)
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %6, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %10, ptr %11)
  call void @ilgpu.debug.assert(i1 %19, ptr %20)
  %24 = load i32, ptr %21
  store i32 %24, ptr %23
  br label %bb4

bb4:
  ret void

}

define void @Increment(ptr<i32> addrspace(shared) %p0) {
entry:
  %0 = load i32, ptr %p0
  %1 = add i32 %0, 1
  store i32 %1, ptr %p0
  ret void

}


; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: SharedMemoryVariableKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedMemoryVariableKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 32)
  %3 = getelementptr i32, ptr %2, i32 %0
  %4 = shl i32 %0, 1
  %5 = icmp sge i32 %0, 32
  %6 = extractvalue %struct.0 %p1, 1
  %7 = icmp sge i64 %6, -2147483648
  %8 = icmp sle i64 %6, 2147483647
  %9 = and i1 %7, %8
  %10 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %11 = icmp sge i32 %p0, 0
  %12 = trunc i64 %6 to i32
  %13 = icmp slt i32 %p0, %12
  %14 = and i1 %11, %13
  %15 = icmp eq i32 %p0, 0
  %16 = icmp eq i32 %12, 0
  %17 = and i1 %15, %16
  %18 = or i1 %14, %17
  %19 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %20 = getelementptr i32, ptr %2, i32 %0
  %21 = extractvalue %struct.0 %p1, 0
  %22 = getelementptr i32, ptr %21, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %4, ptr %3
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %5, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %9, ptr %10)
  call void @ilgpu.debug.assert(i1 %18, ptr %19)
  %23 = load i32, ptr %20
  store i32 %23, ptr %22
  br label %bb4

bb4:
  ret void

}


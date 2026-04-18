; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: SharedMemoryVariableKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedMemoryVariableKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = getelementptr i32, ptr @g0, i32 %0
  %3 = shl i32 %0, 1
  %4 = icmp sge i32 %0, 32
  %5 = extractvalue %struct.1 %p1, 2
  %6 = icmp sge i64 %5, -2147483648
  %7 = icmp sle i64 %5, 2147483647
  %8 = and i1 %6, %7
  %9 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %10 = icmp sge i32 %p0, 0
  %11 = trunc i64 %5 to i32
  %12 = icmp slt i32 %p0, %11
  %13 = and i1 %10, %12
  %14 = icmp eq i32 %p0, 0
  %15 = icmp eq i32 %11, 0
  %16 = and i1 %14, %15
  %17 = or i1 %13, %16
  %18 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %19 = getelementptr i32, ptr @g0, i32 %0
  %20 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %21 = extractvalue %struct.0 %20, 0
  %22 = getelementptr i32, ptr %21, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %3, ptr %2
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %4, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %8, ptr %9)
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  %23 = load i32, ptr %19
  store i32 %23, ptr %22
  br label %bb4

bb4:
  ret void

}


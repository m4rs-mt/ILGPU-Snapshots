; stage: AfterGlobalOpt  opt: O1
; module: SharedRefReturnKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedRefReturnKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 33)
  %3 = add i32 %0, 1
  %4 = getelementptr i32, ptr %2, i32 %3
  %5 = getelementptr i32, ptr %2, i32 %0
  %6 = add i32 %p0, 100
  %7 = icmp sge i32 %0, 32
  %8 = extractvalue %struct.0 %p1, 1
  %9 = icmp sge i64 %8, -2147483648
  %10 = icmp sle i64 %8, 2147483647
  %11 = and i1 %9, %10
  %12 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %13 = icmp sge i32 %p0, 0
  %14 = trunc i64 %8 to i32
  %15 = icmp slt i32 %p0, %14
  %16 = and i1 %13, %15
  %17 = icmp eq i32 %p0, 0
  %18 = icmp eq i32 %14, 0
  %19 = and i1 %17, %18
  %20 = or i1 %16, %19
  %21 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %22 = add i32 %0, 1
  %23 = getelementptr i32, ptr %2, i32 %22
  %24 = extractvalue %struct.0 %p1, 0
  %25 = getelementptr i32, ptr %24, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 0, ptr %4
  %26 = call ptr<i32> @Next(ptr<i32> addrspace(shared) %5)
  store i32 %6, ptr %26
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %7, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  call void @ilgpu.debug.assert(i1 %20, ptr %21)
  %27 = load i32, ptr %23
  store i32 %27, ptr %25
  br label %bb4

bb4:
  ret void

}

define ptr<i32> @Next(ptr<i32> addrspace(shared) %p0) {
entry:
  %0 = getelementptr i32, ptr %p0, i32 1
  %1 = addrspacecast ptr %0 to ptr<i32>
  ret ptr<i32> %1

}


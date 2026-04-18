; stage: AfterGlobalOpt  opt: O1
; module: SharedMemoryArrayKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @SharedMemoryArrayKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 64
  %2 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 64)
  %3 = getelementptr i32, ptr %2, i32 %0
  %4 = icmp sge i32 %0, 64
  %5 = add i32 %0, 1
  %6 = call i32 @ilgpu.group.dim()
  %7 = srem i32 %5, %6
  %8 = icmp sge i32 %7, 64
  %9 = extractvalue %struct.0 %p1, 1
  %10 = icmp sge i64 %9, -2147483648
  %11 = icmp sle i64 %9, 2147483647
  %12 = and i1 %10, %11
  %13 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %14 = icmp sge i32 %p0, 0
  %15 = trunc i64 %9 to i32
  %16 = icmp slt i32 %p0, %15
  %17 = and i1 %14, %16
  %18 = icmp eq i32 %p0, 0
  %19 = icmp eq i32 %15, 0
  %20 = and i1 %18, %19
  %21 = or i1 %17, %20
  %22 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %23 = getelementptr i32, ptr %2, i32 %7
  %24 = extractvalue %struct.0 %p1, 0
  %25 = getelementptr i32, ptr %24, i32 %p0
  %26 = extractvalue %struct.0 %p1, 1
  %27 = icmp sge i64 %26, -2147483648
  %28 = icmp sle i64 %26, 2147483647
  %29 = and i1 %27, %28
  %30 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %31 = icmp sge i32 %p0, 0
  %32 = trunc i64 %26 to i32
  %33 = icmp slt i32 %p0, %32
  %34 = and i1 %31, %33
  %35 = icmp eq i32 %p0, 0
  %36 = icmp eq i32 %32, 0
  %37 = and i1 %35, %36
  %38 = or i1 %34, %37
  %39 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %40 = getelementptr i32, ptr %2, i32 %0
  %41 = extractvalue %struct.0 %p1, 0
  %42 = getelementptr i32, ptr %41, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %p0, ptr %3
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %4, label %bb7, label %bb3

bb3:
  br i1 %8, label %bb5, label %bb4

bb4:
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  call void @ilgpu.debug.assert(i1 %21, ptr %22)
  %43 = load i32, ptr %23
  store i32 %43, ptr %25
  br label %bb6

bb5:
  call void @ilgpu.debug.assert(i1 %29, ptr %30)
  call void @ilgpu.debug.assert(i1 %38, ptr %39)
  %44 = load i32, ptr %40
  store i32 %44, ptr %42
  br label %bb6

bb6:
  br label %bb7

bb7:
  ret void

}


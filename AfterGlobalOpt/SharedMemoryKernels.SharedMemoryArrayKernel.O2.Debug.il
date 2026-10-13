; stage: AfterGlobalOpt  opt: O2
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
  %21 = extractvalue %struct.0 %p1, 0
  %22 = getelementptr i32, ptr %21, i32 %p0
  %23 = extractvalue %struct.0 %p1, 1
  %24 = icmp sge i64 %23, -2147483648
  %25 = icmp sle i64 %23, 2147483647
  %26 = and i1 %24, %25
  %27 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %28 = icmp sge i32 %p0, 0
  %29 = trunc i64 %23 to i32
  %30 = icmp slt i32 %p0, %29
  %31 = and i1 %28, %30
  %32 = icmp eq i32 %p0, 0
  %33 = icmp eq i32 %29, 0
  %34 = and i1 %32, %33
  %35 = or i1 %31, %34
  %36 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %37 = getelementptr i32, ptr %2, i32 %0
  %38 = extractvalue %struct.0 %p1, 0
  %39 = getelementptr i32, ptr %38, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %p0, ptr %3
  br label %bb2

bb2:
  call void @ilgpu.barrier.group()
  br i1 %4, label %bb7, label %bb3

bb3:
  %40 = srem i32 %5, %6
  %41 = icmp sge i32 %40, 64
  %42 = getelementptr i32, ptr %2, i32 %40
  br i1 %41, label %bb5, label %bb4

bb4:
  call void @ilgpu.debug.assert(i1 %10, ptr %11)
  call void @ilgpu.debug.assert(i1 %19, ptr %20)
  %43 = load i32, ptr %42
  store i32 %43, ptr %22
  br label %bb6

bb5:
  call void @ilgpu.debug.assert(i1 %26, ptr %27)
  call void @ilgpu.debug.assert(i1 %35, ptr %36)
  %44 = load i32, ptr %37
  store i32 %44, ptr %39
  br label %bb6

bb6:
  br label %bb7

bb7:
  ret void

}


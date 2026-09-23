; stage: AfterGlobalOpt  opt: O1
; module: FixedNullKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @FixedNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 2)
  %1 = and i32 %p0, 1
  %2 = getelementptr i32, ptr %0, i32 %1
  store i32 %p0, ptr %2
  %3 = extractvalue %struct.0 %p1, 1
  %4 = icmp sge i64 %3, -2147483648
  %5 = icmp sle i64 %3, 2147483647
  %6 = and i1 %4, %5
  %7 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  %8 = icmp sge i32 %p0, 0
  %9 = trunc i64 %3 to i32
  %10 = icmp slt i32 %p0, %9
  %11 = and i1 %8, %10
  %12 = icmp eq i32 %p0, 0
  %13 = icmp eq i32 %9, 0
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %16 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  %17 = call i32 @ilgpu.array.length(array<i32, 1> %0)
  %18 = icmp ne i32 %17, 0
  %19 = getelementptr i32, ptr %0, i32 0
  %20 = select i1 %18, ptr<i32> %19, ptr<i32> null
  %21 = icmp ne ptr<i32> %20, null
  %22 = call array<i32, 1> @ilgpu.array.new(ptr undef, i32 0)
  %23 = call i32 @ilgpu.array.length(array<i32, 1> %22)
  %24 = icmp ne i32 %23, 0
  %25 = getelementptr i32, ptr %22, i32 0
  %26 = select i1 %24, ptr<i32> %25, ptr<i32> null
  %27 = icmp ne ptr<i32> %26, null
  %28 = call i32 @ilgpu.array.length(array<i32, 1> null)
  %29 = icmp ne i32 %28, 0
  %30 = getelementptr i32, ptr null, i32 0
  %31 = select i1 %29, ptr<i32> %30, ptr<i32> null
  %32 = icmp ne ptr<i32> %31, null
  %33 = extractvalue %struct.0 %p1, 0
  %34 = getelementptr i32, ptr %33, i32 %p0
  br i1 %21, label %bb1, label %bb2

bb1:
  %35 = load i32, ptr %20
  br label %bb2

bb2:
  %36 = phi i32 [ %35, %bb1 ], [ -1, %entry ]
  br i1 %27, label %bb3, label %bb4

bb3:
  %37 = load i32, ptr %26
  br label %bb4

bb4:
  %38 = phi i32 [ %37, %bb3 ], [ -1, %bb2 ]
  %39 = add i32 %36, %38
  br i1 %32, label %bb5, label %bb6

bb5:
  %40 = load i32, ptr %31
  br label %bb6

bb6:
  %41 = phi i32 [ %40, %bb5 ], [ -1, %bb4 ]
  %42 = add i32 %39, %41
  store i32 %42, ptr %34
  ret void

}


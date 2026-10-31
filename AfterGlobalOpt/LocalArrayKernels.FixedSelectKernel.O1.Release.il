; stage: AfterGlobalOpt  opt: O1
; module: FixedSelectKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global i32 zeroinitializer ; local

define void @FixedSelectKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = and i32 %p0, 1
  %1 = icmp eq i32 %0, 0
  %2 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 4)
  %3 = call array<i32, 1> @ilgpu.array.new(ptr @g1, i32 2)
  %4 = select i1 %1, array<i32, 1> %2, array<i32, 1> %3
  %5 = call i32 @ilgpu.array.length(array<i32, 1> %4)
  %6 = call i32 @ilgpu.array.length(array<i32, 1> %4)
  %7 = extractvalue %struct.0 %p1, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  %9 = extractvalue %struct.0 %p1, 0
  %10 = add i32 %p0, 4
  %11 = getelementptr i32, ptr %9, i32 %10
  %12 = call array<i32, 1> @ilgpu.array.new(ptr undef, i32 0)
  %13 = call i32 @ilgpu.array.length(array<i32, 1> %12)
  %14 = icmp ne i32 %13, 0
  %15 = getelementptr i32, ptr %12, i32 0
  %16 = select i1 %14, ptr<i32> %15, ptr<i32> null
  %17 = icmp eq ptr<i32> %16, null
  %18 = select i1 %17, i32 -7, i32 1
  %19 = call i32 @ilgpu.array.length(array<i32, 1> %4)
  %20 = icmp ne i32 %19, 0
  %21 = getelementptr i32, ptr %4, i32 0
  %22 = call i32 @ilgpu.array.length(array<i32, 1> %4)
  %23 = icmp ne i32 %22, 0
  %24 = getelementptr i32, ptr %4, i32 0
  %25 = select i1 %23, ptr<i32> %24, ptr<i32> null
  br label %bb1

bb1:
  %26 = phi i32 [ 0, %entry ], [ %27, %bb5 ]
  %27 = add i32 %26, 1
  %28 = icmp slt i32 %26, %5
  %29 = icmp sge i32 %26, %5
  %30 = and i1 %29, %20
  %31 = select i1 %30, ptr<i32> %21, ptr<i32> null
  %32 = bitcast ptr %31 to ptr ; i32 -> i8
  %33 = getelementptr i32, ptr %25, i32 %26
  %34 = add i32 %p0, %26
  br i1 %28, label %bb5, label %bb2

bb2:
  %35 = phi i32 [ 0, %bb1 ], [ %37, %bb4 ]
  %36 = phi i32 [ 0, %bb1 ], [ %43, %bb4 ]
  %37 = add i32 %35, 1
  %38 = icmp slt i32 %35, %6
  %39 = shl i32 %35, 2
  %40 = getelementptr i8, ptr %32, i32 %39
  br i1 %38, label %bb4, label %bb3

bb3:
  store i32 %36, ptr %8
  store i32 %18, ptr %11
  ret void

bb4:
  %41 = load i8, ptr %40
  %42 = zext i8 %41 to i32
  %43 = add i32 %36, %42
  br label %bb2

bb5:
  store i32 %34, ptr %33
  br label %bb1

}


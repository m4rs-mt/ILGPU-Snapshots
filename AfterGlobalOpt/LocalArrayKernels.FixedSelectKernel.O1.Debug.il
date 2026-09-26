; stage: AfterGlobalOpt  opt: O1
; module: FixedSelectKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global i32 zeroinitializer ; local
@g2 = internal global i32 zeroinitializer ; local

define void @FixedSelectKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = and i32 %p0, 1
  %1 = icmp eq i32 %0, 0
  %2 = call array<i32, 1> @ilgpu.array.new(ptr @g1, i32 4)
  %3 = call array<i32, 1> @ilgpu.array.new(ptr @g2, i32 2)
  %4 = select i1 %1, array<i32, 1> %2, array<i32, 1> %3
  %5 = call i32 @ilgpu.array.length(array<i32, 1> %4)
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
  %20 = call i32 @ilgpu.array.length(array<i32, 1> %4)
  %21 = extractvalue %struct.0 %p1, 0
  %22 = getelementptr i32, ptr %21, i32 %p0
  %23 = extractvalue %struct.0 %p1, 1
  %24 = icmp sge i64 %23, -2147483648
  %25 = icmp sle i64 %23, 2147483647
  %26 = and i1 %24, %25
  %27 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %28 = add i32 %p0, 4
  %29 = icmp sge i32 %28, 0
  %30 = trunc i64 %23 to i32
  %31 = icmp slt i32 %28, %30
  %32 = and i1 %29, %31
  %33 = icmp eq i32 %28, 0
  %34 = icmp eq i32 %30, 0
  %35 = and i1 %33, %34
  %36 = or i1 %32, %35
  %37 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %38 = extractvalue %struct.0 %p1, 0
  %39 = getelementptr i32, ptr %38, i32 %28
  %40 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %41 = call i32 @ilgpu.array.length(array<i32, 1> %40)
  %42 = icmp ne i32 %41, 0
  %43 = getelementptr i32, ptr %40, i32 0
  %44 = select i1 %42, ptr<i32> %43, ptr<i32> null
  %45 = icmp eq ptr<i32> %44, null
  %46 = select i1 %45, i32 -7, i32 1
  %47 = call i32 @ilgpu.array.length(array<i32, 1> %4)
  %48 = icmp ne i32 %47, 0
  %49 = getelementptr i32, ptr %4, i32 0
  %50 = select i1 %48, ptr<i32> %49, ptr<i32> null
  %51 = bitcast ptr %50 to ptr ; i32 -> i8
  %52 = call i32 @ilgpu.array.length(array<i32, 1> %4)
  %53 = icmp ne i32 %52, 0
  %54 = getelementptr i32, ptr %4, i32 0
  %55 = select i1 %53, ptr<i32> %54, ptr<i32> null
  br label %bb1

bb1:
  %56 = phi i32 [ 0, %entry ], [ %57, %bb6 ]
  %57 = add i32 %56, 1
  %58 = icmp slt i32 %56, %5
  %59 = getelementptr i32, ptr %55, i32 %56
  %60 = add i32 %p0, %56
  br i1 %58, label %bb6, label %bb2

bb2:
  call void @ilgpu.debug.assert(i1 %9, ptr %10)
  call void @ilgpu.debug.assert(i1 %18, ptr %19)
  br label %bb3

bb3:
  %61 = phi i32 [ 0, %bb2 ], [ %63, %bb5 ]
  %62 = phi i32 [ 0, %bb2 ], [ %69, %bb5 ]
  %63 = add i32 %61, 1
  %64 = icmp slt i32 %61, %20
  %65 = shl i32 %61, 2
  %66 = getelementptr i8, ptr %51, i32 %65
  br i1 %64, label %bb5, label %bb4

bb4:
  store i32 %62, ptr %22
  call void @ilgpu.debug.assert(i1 %26, ptr %27)
  call void @ilgpu.debug.assert(i1 %36, ptr %37)
  store i32 %46, ptr %39
  ret void

bb5:
  %67 = load i8, ptr %66
  %68 = zext i8 %67 to i32
  %69 = add i32 %62, %68
  br label %bb3

bb6:
  store i32 %60, ptr %59
  br label %bb1

}


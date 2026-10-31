; stage: AfterGlobalOpt  opt: O2
; module: FixedNullKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global i32 zeroinitializer ; local

define void @FixedNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 2)
  %1 = and i32 %p0, 1
  %2 = getelementptr i32, ptr %0, i32 %1
  store i32 %p0, ptr %2
  %3 = call i32 @ilgpu.array.length(array<i32, 1> %0)
  %4 = icmp ne i32 %3, 0
  %5 = getelementptr i32, ptr %0, i32 0
  %6 = select i1 %4, ptr<i32> %5, ptr<i32> null
  %7 = icmp ne ptr<i32> %6, null
  %8 = call array<i32, 1> @ilgpu.array.new(ptr @g1, i32 0)
  %9 = call i32 @ilgpu.array.length(array<i32, 1> %8)
  %10 = icmp ne i32 %9, 0
  %11 = getelementptr i32, ptr %8, i32 0
  %12 = select i1 %10, ptr<i32> %11, ptr<i32> null
  %13 = icmp ne ptr<i32> %12, null
  %14 = call i32 @ilgpu.array.length(array<i32, 1> null)
  %15 = icmp ne i32 %14, 0
  %16 = getelementptr i32, ptr null, i32 0
  %17 = select i1 %15, ptr<i32> %16, ptr<i32> null
  %18 = icmp ne ptr<i32> %17, null
  %19 = extractvalue %struct.0 %p1, 0
  %20 = getelementptr i32, ptr %19, i32 %p0
  br i1 %7, label %bb1, label %bb2

bb1:
  %21 = load i32, ptr %6
  br label %bb2

bb2:
  %22 = phi i32 [ %21, %bb1 ], [ -1, %entry ]
  br i1 %13, label %bb3, label %bb4

bb3:
  %23 = load i32, ptr %12
  br label %bb4

bb4:
  %24 = phi i32 [ %23, %bb3 ], [ -1, %bb2 ]
  %25 = add i32 %22, %24
  br i1 %18, label %bb5, label %bb6

bb5:
  %26 = load i32, ptr %17
  br label %bb6

bb6:
  %27 = phi i32 [ %26, %bb5 ], [ -1, %bb4 ]
  %28 = add i32 %25, %27
  store i32 %28, ptr %20
  ret void

}


; stage: AfterBackendTransforms  backend: CPU  opt: O2
; module: AccumulateKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @AccumulateKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 3)
  %1 = getelementptr i32, ptr %0, i32 0
  %2 = getelementptr i32, ptr %0, i32 1
  %3 = getelementptr i32, ptr %0, i32 2
  %4 = extractvalue %struct.0 %p1, 0
  %5 = getelementptr i32, ptr %4, i32 %p0
  br label %bb1

bb1:
  store i32 1, ptr %1
  store i32 2, ptr %2
  store i32 3, ptr %3
  br label %bb2

bb2:
  %6 = phi i32 [ 0, %bb1 ], [ %8, %bb4 ]
  %7 = phi i32 [ 0, %bb1 ], [ %12, %bb4 ]
  %8 = add i32 %6, 1
  %9 = icmp slt i32 %6, 3
  %10 = getelementptr i32, ptr %0, i32 %6
  br i1 %9, label %bb4, label %bb3

bb3:
  store i32 %7, ptr %5
  ret void

bb4:
  %11 = load i32, ptr %10
  %12 = add i32 %7, %11
  br label %bb2

}


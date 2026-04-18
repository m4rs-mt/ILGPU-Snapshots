; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: LessThanKernel  [intptr: i64]

%view.i8 = view i8
%struct.0 = type { %view.i8, i64, i8 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @LessThanKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, %struct.1 %p3) {
entry:
  %0 = extractvalue %struct.0 %p2, 0
  %1 = getelementptr i8, ptr %0, i32 %p0
  %2 = load i8, ptr %1
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i8, ptr %3, i32 %p0
  %5 = load i8, ptr %4
  %6 = sext i8 %5 to i32
  %7 = sext i8 %2 to i32
  %8 = icmp slt i32 %6, %7
  %9 = extractvalue %struct.1 %p3, 0
  %10 = getelementptr i32, ptr %9, i32 %p0
  br i1 %8, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %11 = phi i32 [ 0, %bb1 ], [ 1, %bb2 ]
  store i32 %11, ptr %10
  ret void

}


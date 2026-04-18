; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: LessThanKernel  [intptr: i64]

%view.double = view double
%struct.0 = type { %view.double, i64, i8 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @LessThanKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, %struct.1 %p3) {
entry:
  %0 = extractvalue %struct.0 %p2, 0
  %1 = getelementptr double, ptr %0, i32 %p0
  %2 = load double, ptr %1
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr double, ptr %3, i32 %p0
  %5 = load double, ptr %4
  %6 = fcmp olt double %5, %2
  %7 = extractvalue %struct.1 %p3, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  br i1 %6, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %9 = phi i32 [ 0, %bb1 ], [ 1, %bb2 ]
  store i32 %9, ptr %8
  ret void

}


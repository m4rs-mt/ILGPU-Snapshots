; stage: AfterGlobalOpt  opt: O1
; module: UInt64ToDoubleKernel  [intptr: i64]

%view.i64 = view i64
%struct.0 = type { %view.i64, i64, i8 }
%view.double = view double
%struct.1 = type { %view.double, i64, i8 }

define void @UInt64ToDoubleKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = alloca i64, i32 1
  store i64 0, ptr %0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i64, ptr %1, i32 %p0
  %3 = load i64, ptr %2
  store i64 %3, ptr %0
  %4 = bitcast ptr %0 to ptr ; i64 -> double
  %5 = load double, ptr %4
  %6 = extractvalue %struct.1 %p2, 0
  %7 = getelementptr double, ptr %6, i32 %p0
  store double %5, ptr %7
  ret void

}


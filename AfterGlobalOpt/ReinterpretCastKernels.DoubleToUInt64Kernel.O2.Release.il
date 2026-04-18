; stage: AfterGlobalOpt  opt: O2
; module: DoubleToUInt64Kernel  [intptr: i64]

%view.double = view double
%struct.0 = type { %view.double, i64, i8 }
%view.i64 = view i64
%struct.1 = type { %view.i64, i64, i8 }

define void @DoubleToUInt64Kernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = alloca double, i32 1
  store double 0.0, ptr %0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr double, ptr %1, i32 %p0
  %3 = load double, ptr %2
  store double %3, ptr %0
  %4 = bitcast ptr %0 to ptr ; double -> i64
  %5 = load i64, ptr %4
  %6 = extractvalue %struct.1 %p2, 0
  %7 = getelementptr i64, ptr %6, i32 %p0
  store i64 %5, ptr %7
  ret void

}


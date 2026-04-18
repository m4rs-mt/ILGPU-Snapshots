; stage: AfterGlobalOpt  opt: O1
; module: GreaterEqualKernel  [intptr: i64]

%view.double = view double
%struct.0 = type { %view.double, i64, i8 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @GreaterEqualKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, %struct.1 %p3) {
entry:
  %0 = extractvalue %struct.0 %p2, 0
  %1 = getelementptr double, ptr %0, i32 %p0
  %2 = load double, ptr %1
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr double, ptr %3, i32 %p0
  %5 = load double, ptr %4
  %6 = extractvalue %struct.1 %p3, 0
  %7 = getelementptr i32, ptr %6, i32 %p0
  %8 = fcmp oge double %5, %2
  %9 = select i1 %8, i32 1, i32 0
  store i32 %9, ptr %7
  ret void

}


; stage: AfterGlobalOpt  opt: O2
; module: NotEqualKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @NotEqualKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, %struct.0 %p3) {
entry:
  %0 = extractvalue %struct.0 %p2, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = load i32, ptr %1
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  %5 = load i32, ptr %4
  %6 = extractvalue %struct.0 %p3, 0
  %7 = getelementptr i32, ptr %6, i32 %p0
  %8 = icmp ne i32 %5, %2
  %9 = select i1 %8, i32 1, i32 0
  store i32 %9, ptr %7
  ret void

}


; stage: AfterGlobalOpt  opt: O2
; module: NegKernel  [intptr: i64]

%view.i8 = view i8
%struct.0 = type { %view.i8, i64, i8 }

define void @NegKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i8, ptr %0, i32 %p0
  %2 = load i8, ptr %1
  %3 = extractvalue %struct.0 %p2, 0
  %4 = getelementptr i8, ptr %3, i32 %p0
  %5 = zext i8 %2 to i32
  %6 = sub i32 0, %5
  %7 = trunc i32 %6 to i8
  store i8 %7, ptr %4
  ret void

}


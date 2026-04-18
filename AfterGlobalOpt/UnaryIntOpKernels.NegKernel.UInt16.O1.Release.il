; stage: AfterGlobalOpt  opt: O1
; module: NegKernel  [intptr: i64]

%view.i16 = view i16
%struct.0 = type { %view.i16, i64, i8 }

define void @NegKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i16, ptr %0, i32 %p0
  %2 = load i16, ptr %1
  %3 = extractvalue %struct.0 %p2, 0
  %4 = getelementptr i16, ptr %3, i32 %p0
  %5 = zext i16 %2 to i32
  %6 = sub i32 0, %5
  %7 = trunc i32 %6 to i16
  store i16 %7, ptr %4
  ret void

}


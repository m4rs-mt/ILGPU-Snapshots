; stage: AfterGlobalOpt  opt: O2
; module: XorKernel  [intptr: i64]

%view.i16 = view i16
%struct.0 = type { %view.i16, i64, i8 }

define void @XorKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, %struct.0 %p3) {
entry:
  %0 = extractvalue %struct.0 %p2, 0
  %1 = getelementptr i16, ptr %0, i32 %p0
  %2 = load i16, ptr %1
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i16, ptr %3, i32 %p0
  %5 = load i16, ptr %4
  %6 = extractvalue %struct.0 %p3, 0
  %7 = getelementptr i16, ptr %6, i32 %p0
  %8 = zext i16 %5 to i32
  %9 = zext i16 %2 to i32
  %10 = xor i32 %8, %9
  %11 = trunc i32 %10 to i16
  store i16 %11, ptr %7
  ret void

}


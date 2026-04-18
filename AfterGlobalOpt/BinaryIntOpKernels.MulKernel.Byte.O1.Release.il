; stage: AfterGlobalOpt  opt: O1
; module: MulKernel  [intptr: i64]

%view.i8 = view i8
%struct.0 = type { %view.i8, i64, i8 }

define void @MulKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, %struct.0 %p3) {
entry:
  %0 = extractvalue %struct.0 %p2, 0
  %1 = getelementptr i8, ptr %0, i32 %p0
  %2 = load i8, ptr %1
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i8, ptr %3, i32 %p0
  %5 = load i8, ptr %4
  %6 = extractvalue %struct.0 %p3, 0
  %7 = getelementptr i8, ptr %6, i32 %p0
  %8 = zext i8 %5 to i32
  %9 = zext i8 %2 to i32
  %10 = mul i32 %8, %9
  %11 = trunc i32 %10 to i8
  store i8 %11, ptr %7
  ret void

}


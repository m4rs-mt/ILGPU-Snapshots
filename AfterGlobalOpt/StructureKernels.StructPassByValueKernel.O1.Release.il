; stage: AfterGlobalOpt  opt: O1
; module: StructPassByValueKernel  [intptr: i64]

%struct.0 = type { i32, i64, i16, i32 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @StructPassByValueKernel(i32 %p0, %struct.1 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.1 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = extractvalue %struct.0 %p2, 0
  %3 = add i32 %2, 1
  %4 = extractvalue %struct.0 %p2, 1
  %5 = add i64 %4, 10
  %6 = trunc i64 %5 to i32
  %7 = add i32 %3, %6
  %8 = extractvalue %struct.0 %p2, 2
  %9 = sext i16 %8 to i32
  %10 = add i32 %9, 100
  %11 = trunc i32 %10 to i16
  %12 = sext i16 %11 to i32
  %13 = add i32 %7, %12
  %14 = extractvalue %struct.0 %p2, 3
  %15 = add i32 %14, 1000
  %16 = add i32 %13, %15
  store i32 %16, ptr %1
  ret void

}


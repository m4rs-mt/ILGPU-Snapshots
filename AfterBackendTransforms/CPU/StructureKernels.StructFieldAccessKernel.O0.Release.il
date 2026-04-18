; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: StructFieldAccessKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i64, i16, i32 }

define void @StructFieldAccessKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = extractvalue %struct.1 %p2, 0
  %3 = extractvalue %struct.1 %p2, 1
  %4 = trunc i64 %3 to i32
  %5 = add i32 %2, %4
  %6 = extractvalue %struct.1 %p2, 2
  %7 = sext i16 %6 to i32
  %8 = add i32 %5, %7
  %9 = extractvalue %struct.1 %p2, 3
  %10 = add i32 %8, %9
  store i32 %10, ptr %1
  ret void

}


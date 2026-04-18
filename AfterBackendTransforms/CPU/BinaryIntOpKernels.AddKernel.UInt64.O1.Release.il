; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: AddKernel  [intptr: i64]

%view.i64 = view i64
%struct.0 = type { %view.i64, i64, i8 }

define void @AddKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, %struct.0 %p3) {
entry:
  %0 = extractvalue %struct.0 %p2, 0
  %1 = getelementptr i64, ptr %0, i32 %p0
  %2 = load i64, ptr %1
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i64, ptr %3, i32 %p0
  %5 = load i64, ptr %4
  %6 = extractvalue %struct.0 %p3, 0
  %7 = getelementptr i64, ptr %6, i32 %p0
  %8 = add i64 %5, %2
  store i64 %8, ptr %7
  ret void

}


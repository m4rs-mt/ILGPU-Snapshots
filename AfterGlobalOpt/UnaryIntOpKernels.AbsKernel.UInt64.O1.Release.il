; stage: AfterGlobalOpt  opt: O1
; module: AbsKernel  [intptr: i64]

%view.i64 = view i64
%struct.0 = type { %view.i64, i64, i8 }

define void @AbsKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i64, ptr %0, i32 %p0
  %2 = load i64, ptr %1
  %3 = extractvalue %struct.0 %p2, 0
  %4 = getelementptr i64, ptr %3, i32 %p0
  store i64 %2, ptr %4
  ret void

}


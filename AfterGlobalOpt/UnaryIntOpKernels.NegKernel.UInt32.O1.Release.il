; stage: AfterGlobalOpt  opt: O1
; module: NegKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @NegKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = load i32, ptr %1
  %3 = extractvalue %struct.0 %p2, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  %5 = sub i32 0, %2
  store i32 %5, ptr %4
  ret void

}


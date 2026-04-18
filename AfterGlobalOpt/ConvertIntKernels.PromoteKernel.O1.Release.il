; stage: AfterGlobalOpt  opt: O1
; module: PromoteKernel  [intptr: i64]

%view.i64 = view i64
%struct.0 = type { %view.i64, i64, i8 }

define void @PromoteKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i64, ptr %0, i32 %p0
  %2 = sext i32 %p2 to i64
  store i64 %2, ptr %1
  ret void

}


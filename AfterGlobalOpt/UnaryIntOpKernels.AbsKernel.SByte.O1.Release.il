; stage: AfterGlobalOpt  opt: O1
; module: AbsKernel  [intptr: i64]

%view.i8 = view i8
%struct.0 = type { %view.i8, i64, i8 }

define void @AbsKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i8, ptr %0, i32 %p0
  %2 = load i8, ptr %1
  %3 = extractvalue %struct.0 %p2, 0
  %4 = getelementptr i8, ptr %3, i32 %p0
  %5 = call i8 @llvm.abs.i8(i8 %2, i1 false)
  store i8 %5, ptr %4
  ret void

}


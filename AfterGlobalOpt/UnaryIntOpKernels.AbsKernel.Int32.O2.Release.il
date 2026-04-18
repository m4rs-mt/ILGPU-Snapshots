; stage: AfterGlobalOpt  opt: O2
; module: AbsKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @AbsKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = load i32, ptr %1
  %3 = extractvalue %struct.0 %p2, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  %5 = call i32 @llvm.abs.i32(i32 %2, i1 false)
  store i32 %5, ptr %4
  ret void

}


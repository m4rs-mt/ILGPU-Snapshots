; stage: AfterGlobalOpt  opt: O1
; module: Index2DKernel  [intptr: i64]

%struct.0 = type { i32, i32 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @Index2DKernel(%struct.0 %p0, %struct.1 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.1 %p1, 0
  %1 = extractvalue %struct.0 %p0, 0
  %2 = extractvalue %struct.0 %p0, 1
  %3 = mul i32 %2, %p2
  %4 = add i32 %1, %3
  %5 = getelementptr i32, ptr %0, i32 %4
  %6 = extractvalue %struct.0 %p0, 0
  %7 = extractvalue %struct.0 %p0, 1
  %8 = mul i32 %7, 1000
  %9 = add i32 %6, %8
  store i32 %9, ptr %5
  ret void

}


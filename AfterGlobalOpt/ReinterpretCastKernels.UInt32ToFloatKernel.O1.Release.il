; stage: AfterGlobalOpt  opt: O1
; module: UInt32ToFloatKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%view.float = view float
%struct.1 = type { %view.float, i64, i8 }

define void @UInt32ToFloatKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = load i32, ptr %2
  store i32 %3, ptr %0
  %4 = bitcast ptr %0 to ptr ; i32 -> float
  %5 = load float, ptr %4
  %6 = extractvalue %struct.1 %p2, 0
  %7 = getelementptr float, ptr %6, i32 %p0
  store float %5, ptr %7
  ret void

}


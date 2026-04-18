; stage: AfterGlobalOpt  opt: O2
; module: FloatToDoubleKernel  [intptr: i64]

%view.double = view double
%struct.0 = type { %view.double, i64, i8 }

define void @FloatToDoubleKernel(i32 %p0, %struct.0 %p1, float %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr double, ptr %0, i32 %p0
  %2 = fpext float %p2 to double
  store double %2, ptr %1
  ret void

}


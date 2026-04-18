; stage: AfterGlobalOpt  opt: O2
; module: IntToFloatKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }

define void @IntToFloatKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr float, ptr %0, i32 %p0
  %2 = sitofp i32 %p2 to float
  store float %2, ptr %1
  ret void

}


; stage: AfterGlobalOpt  opt: O1
; module: TuplePassKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%view.float = view float
%struct.1 = type { %view.float, i64, i8 }

define void @TuplePassKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = add i32 %p0, 1
  store i32 %2, ptr %1
  %3 = extractvalue %struct.1 %p2, 0
  %4 = getelementptr float, ptr %3, i32 %p0
  %5 = sitofp i32 %p0 to float
  %6 = fadd float %5, 1.0
  store float %6, ptr %4
  ret void

}


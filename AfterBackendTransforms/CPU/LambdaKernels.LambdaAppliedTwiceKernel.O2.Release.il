; stage: AfterBackendTransforms  backend: CPU  opt: O2
; module: LambdaAppliedTwiceKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @LambdaAppliedTwiceKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = add i32 %p0, %p2
  %3 = add i32 %p0, 1
  %4 = add i32 %3, %p2
  %5 = add i32 %2, %4
  store i32 %5, ptr %1
  ret void

}


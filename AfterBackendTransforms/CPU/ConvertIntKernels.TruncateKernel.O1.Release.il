; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: TruncateKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @TruncateKernel(i32 %p0, %struct.0 %p1, i64 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = trunc i64 %p2 to i32
  store i32 %2, ptr %1
  ret void

}


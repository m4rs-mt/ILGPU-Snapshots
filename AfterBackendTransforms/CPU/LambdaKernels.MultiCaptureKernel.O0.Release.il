; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: MultiCaptureKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @MultiCaptureKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = mul i32 %p0, %p2
  %3 = add i32 %2, %p3
  store i32 %3, ptr %1
  ret void

}


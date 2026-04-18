; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: LengthKernel  [intptr: i64]

%struct.0 = type { view<i32>, i64, i8 }
%view.i64 = view i64
%struct.1 = type { %view.i64, i64, i8 }

define void @LengthKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = extractvalue %struct.1 %p2, 0
  %1 = getelementptr i64, ptr %0, i32 %p0
  %2 = extractvalue %struct.0 %p1, 1
  store i64 %2, ptr %1
  ret void

}


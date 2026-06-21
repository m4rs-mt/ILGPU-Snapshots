; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: BoxUnboxStructKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }

define void @BoxUnboxStructKernel(i32 %p0, %struct.1 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = shl i32 %p2, 1
  %4 = add i32 %p2, %3
  store i32 %4, ptr %2
  ret void

}


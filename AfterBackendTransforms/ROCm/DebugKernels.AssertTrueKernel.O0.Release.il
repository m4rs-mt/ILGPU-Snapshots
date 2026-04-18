; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: AssertTrueKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @AssertTrueKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  store i32 42, ptr %2
  ret void

}


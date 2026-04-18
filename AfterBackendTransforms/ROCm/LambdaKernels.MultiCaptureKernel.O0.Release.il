; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: MultiCaptureKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @MultiCaptureKernel(i32 %p0, %struct.1 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = mul i32 %p0, %p2
  %4 = add i32 %3, %p3
  store i32 %4, ptr %2
  ret void

}


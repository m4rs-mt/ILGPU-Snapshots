; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: LengthKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.1 = type { ptr<i64> addrspace(global), i64 }
%struct.2 = type { ptr<i64> addrspace(global), i64, i64, i8 }

define void @LengthKernel(i32 %p0, %struct.0 %p1, %struct.2 %p2) {
entry:
  %0 = extractvalue %struct.2 %p2, 0 [Span: 2]
  %1 = extractvalue %struct.1 %0, 0
  %2 = getelementptr i64, ptr %1, i32 %p0
  %3 = extractvalue %struct.0 %p1, 2
  store i64 %3, ptr %2
  ret void

}


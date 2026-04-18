; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: SimpleCallKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @SimpleCallKernel(i32 %p0, %struct.1 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = add i32 %p2, %p3
  store i32 %3, ptr %2
  ret void

}


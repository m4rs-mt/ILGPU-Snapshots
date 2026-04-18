; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: AtomicAddKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @AtomicAddKernel(i32 %p0, %struct.1 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = atomicrmw add ptr %1, i32 %p2 seq_cst
  ret void

}


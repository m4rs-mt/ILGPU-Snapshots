; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: AtomicAddKernel  [intptr: i64]

define void @AtomicAddKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = atomicrmw add ptr %p2, i32 %p1 seq_cst
  ret void

}


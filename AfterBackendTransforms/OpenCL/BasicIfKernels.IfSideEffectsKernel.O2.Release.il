; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: IfSideEffectsKernel  [intptr: i64]

define void @IfSideEffectsKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = getelementptr i32, ptr %p2, i32 %p0
  %1 = icmp sgt i32 %p0, %p1
  %2 = select i1 %1, i32 1, i32 0
  store i32 %2, ptr %0
  ret void

}


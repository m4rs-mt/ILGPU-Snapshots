; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: GotoKernel  [intptr: i64]

define void @GotoKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = getelementptr i32, ptr %p2, i32 %p0
  %1 = icmp sle i32 %p1, 5
  %2 = shl i32 %p1, 1
  %3 = select i1 %1, i32 %2, i32 0
  store i32 %3, ptr %0
  ret void

}


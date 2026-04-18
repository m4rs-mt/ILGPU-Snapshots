; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: SimpleCallKernel  [intptr: i64]

define void @SimpleCallKernel(i32 %p0, i32 %p1, i32 %p2, ptr<i32> addrspace(global) %p3, i64 %p4, i64 %p5, i8 %p6) {
entry:
  %0 = getelementptr i32, ptr %p3, i32 %p0
  %1 = add i32 %p1, %p2
  store i32 %1, ptr %0
  ret void

}


; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: SimpleArrayKernel  [intptr: i64]

define void @SimpleArrayKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i32> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = getelementptr i32, ptr %p1, i32 %p0
  %1 = load i32, ptr %0
  %2 = getelementptr i32, ptr %p5, i32 %p0
  %3 = shl i32 %1, 1
  %4 = add i32 %3, 1
  store i32 %4, ptr %2
  ret void

}


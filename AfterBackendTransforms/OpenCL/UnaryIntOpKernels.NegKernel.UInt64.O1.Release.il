; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: NegKernel  [intptr: i64]

define void @NegKernel(i32 %p0, ptr<i64> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i64> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = getelementptr i64, ptr %p1, i32 %p0
  %1 = load i64, ptr %0
  %2 = getelementptr i64, ptr %p5, i32 %p0
  %3 = sub i64 0, %1
  store i64 %3, ptr %2
  ret void

}


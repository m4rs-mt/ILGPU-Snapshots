; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: NegKernel  [intptr: i64]

define void @NegKernel(i32 %p0, ptr<i8> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i8> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = getelementptr i8, ptr %p1, i32 %p0
  %1 = load i8, ptr %0
  %2 = getelementptr i8, ptr %p5, i32 %p0
  %3 = zext i8 %1 to i32
  %4 = sub i32 0, %3
  %5 = trunc i32 %4 to i8
  store i8 %5, ptr %2
  ret void

}


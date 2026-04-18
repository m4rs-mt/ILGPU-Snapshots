; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: NegKernel  [intptr: i64]

define void @NegKernel(i32 %p0, ptr<i16> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i16> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = getelementptr i16, ptr %p1, i32 %p0
  %1 = load i16, ptr %0
  %2 = getelementptr i16, ptr %p5, i32 %p0
  %3 = zext i16 %1 to i32
  %4 = sub i32 0, %3
  %5 = trunc i32 %4 to i16
  store i16 %5, ptr %2
  ret void

}


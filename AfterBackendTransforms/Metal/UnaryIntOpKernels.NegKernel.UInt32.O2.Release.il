; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: NegKernel  [intptr: i64]

define void @NegKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i32> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = getelementptr i32, ptr %p1, i32 %p0
  %1 = load i32, ptr %0
  %2 = getelementptr i32, ptr %p5, i32 %p0
  %3 = sub i32 0, %1
  store i32 %3, ptr %2
  ret void

}


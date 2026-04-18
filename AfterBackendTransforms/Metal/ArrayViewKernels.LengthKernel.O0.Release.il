; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: LengthKernel  [intptr: i64]

define void @LengthKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i64> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = getelementptr i64, ptr %p5, i32 %p0
  store i64 %p3, ptr %0
  ret void

}


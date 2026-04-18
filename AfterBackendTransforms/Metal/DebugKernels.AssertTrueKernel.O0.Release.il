; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: AssertTrueKernel  [intptr: i64]

define void @AssertTrueKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = getelementptr i32, ptr %p1, i32 %p0
  store i32 42, ptr %0
  ret void

}


; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: TruncateKernel  [intptr: i64]

define void @TruncateKernel(i32 %p0, i64 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = getelementptr i32, ptr %p2, i32 %p0
  %1 = trunc i64 %p1 to i32
  store i32 %1, ptr %0
  ret void

}


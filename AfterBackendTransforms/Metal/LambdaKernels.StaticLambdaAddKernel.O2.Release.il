; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: StaticLambdaAddKernel  [intptr: i64]

define void @StaticLambdaAddKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = getelementptr i32, ptr %p1, i32 %p0
  %1 = add i32 %p0, 1
  store i32 %1, ptr %0
  ret void

}


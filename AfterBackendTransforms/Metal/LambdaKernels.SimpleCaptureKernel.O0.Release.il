; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: SimpleCaptureKernel  [intptr: i64]

define void @SimpleCaptureKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = getelementptr i32, ptr %p2, i32 %p0
  %1 = add i32 %p0, %p1
  store i32 %1, ptr %0
  ret void

}


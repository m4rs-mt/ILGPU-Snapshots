; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: MultiCaptureKernel  [intptr: i64]

define void @MultiCaptureKernel(i32 %p0, i32 %p1, i32 %p2, ptr<i32> addrspace(global) %p3, i64 %p4, i64 %p5, i8 %p6) {
entry:
  %0 = getelementptr i32, ptr %p3, i32 %p0
  %1 = mul i32 %p0, %p1
  %2 = add i32 %1, %p2
  store i32 %2, ptr %0
  ret void

}


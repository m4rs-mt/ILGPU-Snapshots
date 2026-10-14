; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: BoxUnboxStructKernel  [intptr: i64]

define void @BoxUnboxStructKernel(i32 %p0, i32 %p1, ptr<i32> %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = getelementptr i32, ptr %p2, i32 %p0
  %1 = shl i32 %p1, 1
  %2 = add i32 %p1, %1
  store i32 %2, ptr %0
  ret void

}


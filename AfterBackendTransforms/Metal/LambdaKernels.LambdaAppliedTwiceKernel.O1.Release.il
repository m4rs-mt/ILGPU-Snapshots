; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: LambdaAppliedTwiceKernel  [intptr: i64]

define void @LambdaAppliedTwiceKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = getelementptr i32, ptr %p2, i32 %p0
  %1 = add i32 %p0, %p1
  %2 = add i32 %p0, 1
  %3 = add i32 %2, %p1
  %4 = add i32 %1, %3
  store i32 %4, ptr %0
  ret void

}


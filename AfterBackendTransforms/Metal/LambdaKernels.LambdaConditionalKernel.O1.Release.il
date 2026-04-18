; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: LambdaConditionalKernel  [intptr: i64]

define void @LambdaConditionalKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = icmp sgt i32 %p0, %p1
  %1 = getelementptr i32, ptr %p2, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %2 = phi i32 [ %p0, %bb1 ], [ %p1, %bb2 ]
  store i32 %2, ptr %1
  ret void

}


; stage: AfterBackendTransforms  backend: Cuda  opt: O2
; module: LambdaConditionalKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @LambdaConditionalKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = icmp sgt i32 %p0, %p2
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %3 = phi i32 [ %p0, %bb1 ], [ %p2, %bb2 ]
  store i32 %3, ptr %2
  ret void

}


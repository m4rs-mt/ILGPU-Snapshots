; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: GotoKernel  [intptr: i64]

define void @GotoKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = icmp sle i32 %p1, 5
  %1 = shl i32 %p1, 1
  %2 = getelementptr i32, ptr %p2, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %3 = phi i32 [ 0, %bb1 ], [ %1, %bb2 ]
  store i32 %3, ptr %2
  ret void

}


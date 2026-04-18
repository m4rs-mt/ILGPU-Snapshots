; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: WhileLoopKernel  [intptr: i64]

define void @WhileLoopKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = getelementptr i32, ptr %p1, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %1 = phi i32 [ 0, %bb1 ], [ %3, %bb4 ]
  %2 = phi i32 [ 0, %bb1 ], [ %4, %bb4 ]
  %3 = add i32 %1, 1
  %4 = add i32 %2, %1
  %5 = icmp slt i32 %1, 10
  br i1 %5, label %bb4, label %bb3

bb3:
  store i32 %2, ptr %0
  ret void

bb4:
  br label %bb2

}


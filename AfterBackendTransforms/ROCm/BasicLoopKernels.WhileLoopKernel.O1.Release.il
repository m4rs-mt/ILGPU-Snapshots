; stage: AfterBackendTransforms  backend: ROCm  opt: O1
; module: WhileLoopKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @WhileLoopKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %2 = phi i32 [ 0, %bb1 ], [ %4, %bb4 ]
  %3 = phi i32 [ 0, %bb1 ], [ %5, %bb4 ]
  %4 = add i32 %2, 1
  %5 = add i32 %3, %2
  %6 = icmp slt i32 %2, 10
  br i1 %6, label %bb4, label %bb3

bb3:
  store i32 %3, ptr %1
  ret void

bb4:
  br label %bb2

}


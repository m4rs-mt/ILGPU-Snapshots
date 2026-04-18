; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: WhileLoopKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @WhileLoopKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %3 = phi i32 [ 0, %bb1 ], [ %5, %bb4 ]
  %4 = phi i32 [ 0, %bb1 ], [ %6, %bb4 ]
  %5 = add i32 %3, 1
  %6 = add i32 %4, %3
  %7 = icmp slt i32 %3, 10
  br i1 %7, label %bb4, label %bb3

bb3:
  store i32 %4, ptr %2
  ret void

bb4:
  br label %bb2

}


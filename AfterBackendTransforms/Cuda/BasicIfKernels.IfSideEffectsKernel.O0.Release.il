; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: IfSideEffectsKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @IfSideEffectsKernel(i32 %p0, %struct.1 %p1, i32 %p2) {
entry:
  %0 = icmp sgt i32 %p0, %p2
  %1 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %2 = extractvalue %struct.0 %1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %4 = phi i32 [ 0, %bb1 ], [ 1, %bb2 ]
  store i32 %4, ptr %3
  ret void

}


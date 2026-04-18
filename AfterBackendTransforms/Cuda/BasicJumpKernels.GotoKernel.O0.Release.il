; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: GotoKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @GotoKernel(i32 %p0, %struct.1 %p1, i32 %p2) {
entry:
  %0 = icmp sle i32 %p2, 5
  %1 = shl i32 %p2, 1
  %2 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %3 = extractvalue %struct.0 %2, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %5 = phi i32 [ 0, %bb1 ], [ %1, %bb2 ]
  store i32 %5, ptr %4
  ret void

}


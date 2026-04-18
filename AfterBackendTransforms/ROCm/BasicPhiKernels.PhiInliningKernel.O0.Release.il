; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: PhiInliningKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @PhiInliningKernel(i32 %p0, %struct.1 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp sle i32 %p2, %p3
  %1 = sub i32 %p2, %p3
  %2 = sub i32 %p3, %p2
  %3 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %4 = extractvalue %struct.0 %3, 0
  %5 = getelementptr i32, ptr %4, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %6 = phi i32 [ %1, %bb1 ], [ %2, %bb2 ]
  store i32 %6, ptr %5
  ret void

}


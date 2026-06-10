; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: AndChainKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @AndChainKernel(i32 %p0, %struct.1 %p1, i32 %p2, i32 %p3, i32 %p4) {
entry:
  %0 = icmp sle i32 %p2, 0
  %1 = icmp sle i32 %p3, 0
  %2 = icmp sgt i32 %p4, 0
  %3 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %4 = extractvalue %struct.0 %3, 0
  %5 = getelementptr i32, ptr %4, i32 %p0
  %6 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %7 = extractvalue %struct.0 %6, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  br i1 %0, label %bb3, label %bb1

bb1:
  br i1 %1, label %bb3, label %bb2

bb2:
  br label %bb4

bb3:
  br label %bb4

bb4:
  %9 = phi i1 [ %2, %bb2 ], [ false, %bb3 ]
  %10 = xor i1 %9, -1
  br i1 %10, label %bb6, label %bb5

bb5:
  store i32 1, ptr %5
  br label %bb7

bb6:
  store i32 0, ptr %8
  br label %bb7

bb7:
  ret void

}


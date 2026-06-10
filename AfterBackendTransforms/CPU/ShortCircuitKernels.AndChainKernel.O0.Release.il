; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: AndChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @AndChainKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4) {
entry:
  %0 = icmp sle i32 %p2, 0
  %1 = icmp sle i32 %p3, 0
  %2 = icmp sgt i32 %p4, 0
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  %5 = extractvalue %struct.0 %p1, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  br i1 %0, label %bb3, label %bb1

bb1:
  br i1 %1, label %bb3, label %bb2

bb2:
  br label %bb4

bb3:
  br label %bb4

bb4:
  %7 = phi i1 [ %2, %bb2 ], [ false, %bb3 ]
  %8 = xor i1 %7, -1
  br i1 %8, label %bb6, label %bb5

bb5:
  store i32 1, ptr %4
  br label %bb7

bb6:
  store i32 0, ptr %6
  br label %bb7

bb7:
  ret void

}


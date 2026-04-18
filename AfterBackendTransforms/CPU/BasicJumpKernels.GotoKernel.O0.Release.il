; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: GotoKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @GotoKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = icmp sle i32 %p2, 5
  %1 = shl i32 %p2, 1
  %2 = extractvalue %struct.0 %p1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %4 = phi i32 [ 0, %bb1 ], [ %1, %bb2 ]
  store i32 %4, ptr %3
  ret void

}


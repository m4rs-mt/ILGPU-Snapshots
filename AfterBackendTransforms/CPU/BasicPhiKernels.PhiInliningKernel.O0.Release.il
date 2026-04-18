; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: PhiInliningKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @PhiInliningKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp sle i32 %p2, %p3
  %1 = sub i32 %p2, %p3
  %2 = sub i32 %p3, %p2
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %5 = phi i32 [ %1, %bb1 ], [ %2, %bb2 ]
  store i32 %5, ptr %4
  ret void

}


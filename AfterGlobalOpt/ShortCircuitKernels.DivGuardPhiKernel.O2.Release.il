; stage: AfterGlobalOpt  opt: O2
; module: DivGuardPhiKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DivGuardPhiKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp ne i32 %p3, 0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  %3 = sdiv i32 %p2, %p3
  br label %bb3

bb3:
  %4 = phi i32 [ 0, %bb1 ], [ %3, %bb2 ]
  store i32 %4, ptr %2
  ret void

}


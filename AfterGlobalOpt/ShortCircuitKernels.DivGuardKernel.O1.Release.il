; stage: AfterGlobalOpt  opt: O1
; module: DivGuardKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DivGuardKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp eq i32 %p3, 0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  %5 = sdiv i32 %p2, %p3
  %6 = icmp sgt i32 %5, 2
  br label %bb3

bb2:
  br label %bb3

bb3:
  %7 = phi i1 [ %6, %bb1 ], [ false, %bb2 ]
  %8 = xor i1 %7, -1
  br i1 %8, label %bb5, label %bb4

bb4:
  store i32 1, ptr %2
  br label %bb6

bb5:
  store i32 0, ptr %4
  br label %bb6

bb6:
  ret void

}


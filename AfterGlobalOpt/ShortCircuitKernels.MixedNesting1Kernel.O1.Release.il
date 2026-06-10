; stage: AfterGlobalOpt  opt: O1
; module: MixedNesting1Kernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @MixedNesting1Kernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4) {
entry:
  %0 = icmp sle i32 %p2, 0
  %1 = icmp sle i32 %p3, 0
  %2 = and i1 %0, %1
  %3 = icmp sgt i32 %p4, 0
  %4 = select i1 %3, i32 1, i32 0
  %5 = select i1 %2, i32 0, i32 %4
  %6 = icmp eq i32 %5, 0
  %7 = extractvalue %struct.0 %p1, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  %9 = extractvalue %struct.0 %p1, 0
  %10 = getelementptr i32, ptr %9, i32 %p0
  br i1 %6, label %bb2, label %bb1

bb1:
  store i32 1, ptr %8
  br label %bb3

bb2:
  store i32 0, ptr %10
  br label %bb3

bb3:
  ret void

}


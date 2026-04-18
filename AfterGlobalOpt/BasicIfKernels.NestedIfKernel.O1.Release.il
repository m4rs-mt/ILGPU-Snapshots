; stage: AfterGlobalOpt  opt: O1
; module: NestedIfKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @NestedIfKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = icmp sle i32 %p2, 10
  %1 = icmp sle i32 %p2, 20
  %2 = extractvalue %struct.0 %p1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  %4 = extractvalue %struct.0 %p1, 0
  %5 = getelementptr i32, ptr %4, i32 %p0
  %6 = extractvalue %struct.0 %p1, 0
  %7 = getelementptr i32, ptr %6, i32 %p0
  br i1 %0, label %bb5, label %bb1

bb1:
  br i1 %1, label %bb3, label %bb2

bb2:
  store i32 3, ptr %3
  br label %bb4

bb3:
  store i32 2, ptr %5
  br label %bb4

bb4:
  br label %bb6

bb5:
  store i32 1, ptr %7
  br label %bb6

bb6:
  ret void

}


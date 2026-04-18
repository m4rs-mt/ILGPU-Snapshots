; stage: AfterGlobalOpt  opt: O1
; module: IfAndOrKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @IfAndOrKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp sle i32 %p2, 0
  %1 = icmp sle i32 %p3, 0
  %2 = or i1 %0, %1
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  %5 = icmp sle i32 %p2, 0
  %6 = icmp sle i32 %p3, 0
  %7 = and i1 %5, %6
  %8 = extractvalue %struct.0 %p1, 0
  %9 = getelementptr i32, ptr %8, i32 %p0
  %10 = extractvalue %struct.0 %p1, 0
  %11 = getelementptr i32, ptr %10, i32 %p0
  br i1 %2, label %bb2, label %bb1

bb1:
  store i32 1, ptr %4
  br label %bb5

bb2:
  br i1 %7, label %bb4, label %bb3

bb3:
  store i32 2, ptr %9
  br label %bb5

bb4:
  store i32 0, ptr %11
  br label %bb5

bb5:
  ret void

}


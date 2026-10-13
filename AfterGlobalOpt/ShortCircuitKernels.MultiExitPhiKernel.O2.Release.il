; stage: AfterGlobalOpt  opt: O2
; module: MultiExitPhiKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @MultiExitPhiKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4, i32 %p5, i32 %p6) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = icmp sgt i32 %p2, 0
  %3 = icmp sle i32 %p2, 0
  %4 = icmp sle i32 %p3, 0
  %5 = and i1 %3, %4
  %6 = select i1 %5, i32 %p6, i32 %p5
  %7 = select i1 %2, i32 %p4, i32 %6
  store i32 %7, ptr %1
  ret void

}


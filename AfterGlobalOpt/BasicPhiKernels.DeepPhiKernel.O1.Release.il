; stage: AfterGlobalOpt  opt: O1
; module: DeepPhiKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DeepPhiKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = icmp sle i32 %p2, 100
  %3 = icmp sle i32 %p2, 200
  %4 = icmp sle i32 %p2, 300
  %5 = select i1 %4, i32 3, i32 4
  %6 = select i1 %3, i32 2, i32 %5
  %7 = select i1 %2, i32 1, i32 %6
  store i32 %7, ptr %1
  ret void

}


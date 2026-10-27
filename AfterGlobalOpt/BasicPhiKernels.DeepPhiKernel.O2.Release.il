; stage: AfterGlobalOpt  opt: O2
; module: DeepPhiKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DeepPhiKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = icmp sgt i32 %p2, 100
  %3 = icmp sgt i32 %p2, 200
  %4 = and i1 %2, %3
  %5 = icmp sle i32 %p2, 300
  %6 = and i1 %4, %5
  %7 = select i1 %6, i32 3, i32 4
  %8 = select i1 %4, i32 %7, i32 2
  %9 = select i1 %2, i32 %8, i32 1
  store i32 %9, ptr %1
  ret void

}


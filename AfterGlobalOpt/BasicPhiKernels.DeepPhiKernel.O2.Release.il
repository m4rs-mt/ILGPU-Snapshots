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
  %5 = icmp sgt i32 %p2, 300
  %6 = and i1 %4, %5
  %7 = icmp sle i32 %p2, 300
  %8 = and i1 %4, %7
  %9 = or i1 %6, %8
  %10 = icmp sle i32 %p2, 200
  %11 = and i1 %2, %10
  %12 = or i1 %9, %11
  %13 = select i1 %8, i32 3, i32 4
  %14 = select i1 %9, i32 %13, i32 2
  %15 = select i1 %12, i32 %14, i32 1
  store i32 %15, ptr %1
  ret void

}


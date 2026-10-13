; stage: AfterGlobalOpt  opt: O1
; module: DiamondFeedChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DiamondFeedChainKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4, i32 %p5) {
entry:
  %0 = icmp sle i32 %p2, 0
  %1 = icmp sgt i32 %p2, 0
  %2 = or i1 %0, %1
  %3 = icmp sgt i32 %p2, 0
  %4 = icmp sgt i32 %p3, 0
  %5 = icmp sgt i32 %p4, 0
  %6 = select i1 %3, i1 %4, i1 %5
  %7 = xor i1 %6, -1
  %8 = and i1 %2, %7
  %9 = icmp sle i32 %p5, 0
  %10 = or i1 %8, %9
  %11 = extractvalue %struct.0 %p1, 0
  %12 = getelementptr i32, ptr %11, i32 %p0
  %13 = extractvalue %struct.0 %p1, 0
  %14 = getelementptr i32, ptr %13, i32 %p0
  br i1 %10, label %bb2, label %bb1

bb1:
  store i32 1, ptr %12
  br label %bb3

bb2:
  store i32 0, ptr %14
  br label %bb3

bb3:
  ret void

}


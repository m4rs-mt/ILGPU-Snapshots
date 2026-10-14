; stage: AfterGlobalOpt  opt: O1
; module: DiamondFeedChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DiamondFeedChainKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4, i32 %p5) {
entry:
  %0 = icmp sgt i32 %p2, 0
  %1 = icmp sgt i32 %p3, 0
  %2 = icmp sgt i32 %p4, 0
  %3 = select i1 %0, i1 %1, i1 %2
  %4 = xor i1 %3, -1
  %5 = icmp sle i32 %p5, 0
  %6 = or i1 %4, %5
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


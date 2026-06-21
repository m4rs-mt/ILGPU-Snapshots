; stage: AfterGlobalOpt  opt: O2
; module: AndChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @AndChainKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4) {
entry:
  %0 = icmp sle i32 %p3, 0
  %1 = icmp sle i32 %p2, 0
  %2 = or i1 %0, %1
  %3 = icmp sle i32 %p4, 0
  %4 = or i1 %2, %3
  %5 = extractvalue %struct.0 %p1, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  %7 = extractvalue %struct.0 %p1, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  br i1 %4, label %bb2, label %bb1

bb1:
  store i32 1, ptr %6
  br label %bb3

bb2:
  store i32 0, ptr %8
  br label %bb3

bb3:
  ret void

}


; stage: AfterGlobalOpt  opt: O2
; module: ThreeWayChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @ThreeWayChainKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4) {
entry:
  %0 = icmp sgt i32 %p2, 0
  %1 = icmp sgt i32 %p3, 0
  %2 = or i1 %0, %1
  %3 = icmp sle i32 %p4, 0
  %4 = extractvalue %struct.0 %p1, 0
  %5 = getelementptr i32, ptr %4, i32 %p0
  %6 = extractvalue %struct.0 %p1, 0
  %7 = getelementptr i32, ptr %6, i32 %p0
  %8 = extractvalue %struct.0 %p1, 0
  %9 = getelementptr i32, ptr %8, i32 %p0
  br i1 %2, label %bb4, label %bb1

bb1:
  br i1 %3, label %bb3, label %bb2

bb2:
  store i32 20, ptr %5
  br label %bb5

bb3:
  store i32 30, ptr %7
  br label %bb5

bb4:
  store i32 10, ptr %9
  br label %bb5

bb5:
  ret void

}


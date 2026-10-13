; stage: AfterGlobalOpt  opt: O2
; module: MixedNesting2Kernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @MixedNesting2Kernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4) {
entry:
  %0 = icmp sle i32 %p2, 0
  %1 = icmp sgt i32 %p3, 0
  %2 = or i1 %0, %1
  %3 = icmp sle i32 %p2, 0
  %4 = icmp sle i32 %p3, 0
  %5 = or i1 %3, %4
  %6 = and i1 %2, %5
  %7 = icmp sle i32 %p2, 0
  %8 = icmp sle i32 %p3, 0
  %9 = or i1 %7, %8
  %10 = icmp sle i32 %p4, 0
  %11 = and i1 %9, %10
  %12 = or i1 %6, %11
  %13 = extractvalue %struct.0 %p1, 0
  %14 = getelementptr i32, ptr %13, i32 %p0
  %15 = extractvalue %struct.0 %p1, 0
  %16 = getelementptr i32, ptr %15, i32 %p0
  br i1 %12, label %bb2, label %bb1

bb1:
  store i32 1, ptr %14
  br label %bb3

bb2:
  store i32 0, ptr %16
  br label %bb3

bb3:
  ret void

}


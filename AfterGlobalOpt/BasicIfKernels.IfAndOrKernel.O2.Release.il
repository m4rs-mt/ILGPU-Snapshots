; stage: AfterGlobalOpt  opt: O2
; module: IfAndOrKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @IfAndOrKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp sgt i32 %p2, 0
  %1 = icmp sgt i32 %p3, 0
  %2 = and i1 %0, %1
  %3 = icmp sle i32 %p2, 0
  %4 = icmp sgt i32 %p2, 0
  %5 = and i1 %3, %4
  %6 = icmp sgt i32 %p2, 0
  %7 = icmp sgt i32 %p3, 0
  %8 = and i1 %6, %7
  %9 = or i1 %5, %8
  %10 = icmp sle i32 %p2, 0
  %11 = or i1 %9, %10
  %12 = icmp sle i32 %p3, 0
  %13 = and i1 %11, %12
  %14 = extractvalue %struct.0 %p1, 0
  %15 = getelementptr i32, ptr %14, i32 %p0
  %16 = extractvalue %struct.0 %p1, 0
  %17 = getelementptr i32, ptr %16, i32 %p0
  %18 = extractvalue %struct.0 %p1, 0
  %19 = getelementptr i32, ptr %18, i32 %p0
  br i1 %2, label %bb4, label %bb1

bb1:
  br i1 %13, label %bb3, label %bb2

bb2:
  store i32 2, ptr %15
  br label %bb5

bb3:
  store i32 0, ptr %17
  br label %bb5

bb4:
  store i32 1, ptr %19
  br label %bb5

bb5:
  ret void

}


; stage: AfterGlobalOpt  opt: O1
; module: DeepMixedKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DeepMixedKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4, i32 %p5, i32 %p6) {
entry:
  %0 = icmp sgt i32 %p2, 0
  %1 = icmp sgt i32 %p3, 0
  %2 = and i1 %0, %1
  %3 = icmp sle i32 %p3, 0
  %4 = and i1 %0, %3
  %5 = icmp sgt i32 %p4, 0
  %6 = and i1 %4, %5
  %7 = or i1 %2, %6
  %8 = icmp sgt i32 %p2, 0
  %9 = icmp sle i32 %p2, 0
  %10 = icmp sgt i32 %p3, 0
  %11 = or i1 %9, %10
  %12 = icmp sgt i32 %p4, 0
  %13 = or i1 %11, %12
  %14 = and i1 %8, %13
  %15 = icmp sgt i32 %p5, 0
  %16 = or i1 %14, %15
  %17 = icmp sgt i32 %p6, 0
  %18 = and i1 %16, %17
  %19 = select i1 %18, i32 1, i32 0
  %20 = select i1 %7, i32 1, i32 %19
  %21 = icmp eq i32 %20, 0
  %22 = extractvalue %struct.0 %p1, 0
  %23 = getelementptr i32, ptr %22, i32 %p0
  %24 = extractvalue %struct.0 %p1, 0
  %25 = getelementptr i32, ptr %24, i32 %p0
  br i1 %21, label %bb2, label %bb1

bb1:
  store i32 1, ptr %23
  br label %bb3

bb2:
  store i32 0, ptr %25
  br label %bb3

bb3:
  ret void

}


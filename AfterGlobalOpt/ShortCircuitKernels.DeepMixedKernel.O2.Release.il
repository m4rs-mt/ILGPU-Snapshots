; stage: AfterGlobalOpt  opt: O2
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
  %8 = icmp sle i32 %p2, 0
  %9 = icmp sgt i32 %p3, 0
  %10 = or i1 %8, %9
  %11 = icmp sgt i32 %p4, 0
  %12 = or i1 %10, %11
  %13 = and i1 %0, %12
  %14 = icmp sgt i32 %p5, 0
  %15 = or i1 %13, %14
  %16 = icmp sgt i32 %p6, 0
  %17 = and i1 %15, %16
  %18 = select i1 %17, i32 1, i32 0
  %19 = select i1 %7, i32 1, i32 %18
  %20 = icmp eq i32 %19, 0
  %21 = extractvalue %struct.0 %p1, 0
  %22 = getelementptr i32, ptr %21, i32 %p0
  %23 = extractvalue %struct.0 %p1, 0
  %24 = getelementptr i32, ptr %23, i32 %p0
  br i1 %20, label %bb2, label %bb1

bb1:
  store i32 1, ptr %22
  br label %bb3

bb2:
  store i32 0, ptr %24
  br label %bb3

bb3:
  ret void

}


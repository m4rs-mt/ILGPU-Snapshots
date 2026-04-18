; stage: AfterGlobalOpt  opt: O2
; module: DivergentLoopKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DivergentLoopKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = srem i32 %p0, 4
  %1 = add i32 %0, 1
  %2 = extractvalue %struct.0 %p1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %4 = phi i32 [ 0, %bb1 ], [ %6, %bb4 ]
  %5 = phi i32 [ 0, %bb1 ], [ %7, %bb4 ]
  %6 = add i32 %4, 1
  %7 = add i32 %5, %4
  %8 = icmp slt i32 %4, %1
  br i1 %8, label %bb4, label %bb3

bb3:
  store i32 %5, ptr %3
  ret void

bb4:
  br label %bb2

}


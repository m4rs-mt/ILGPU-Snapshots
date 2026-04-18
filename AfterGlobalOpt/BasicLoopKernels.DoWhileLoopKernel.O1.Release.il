; stage: AfterGlobalOpt  opt: O1
; module: DoWhileLoopKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DoWhileLoopKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  br label %bb1

bb1:
  br label %bb2

bb2:
  %2 = phi i32 [ 0, %bb1 ], [ %4, %bb2 ]
  %3 = phi i32 [ %p2, %bb1 ], [ %5, %bb2 ]
  %4 = add i32 %2, 1
  %5 = sub i32 %3, 1
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %bb2, label %bb3

bb3:
  store i32 %4, ptr %1
  ret void

}


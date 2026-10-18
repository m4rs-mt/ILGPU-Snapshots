; stage: AfterGlobalOpt  opt: O1
; module: SwitchMapKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @SwitchMapKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  switch i32 %p2, label %bb5 [
    i32 0, label %bb4
    i32 1, label %bb3
    i32 2, label %bb2
    i32 3, label %bb1
  ]

bb1:
  br label %bb6

bb2:
  br label %bb6

bb3:
  br label %bb6

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %2 = phi i32 [ 40, %bb1 ], [ 30, %bb2 ], [ 20, %bb3 ], [ 10, %bb4 ], [ -1, %bb5 ]
  store i32 %2, ptr %1
  ret void

}


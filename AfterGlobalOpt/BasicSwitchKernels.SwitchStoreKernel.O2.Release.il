; stage: AfterGlobalOpt  opt: O2
; module: SwitchStoreKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @SwitchStoreKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = mul i32 %p0, %p0
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  %5 = add i32 %p0, 100
  %6 = extractvalue %struct.0 %p1, 0
  %7 = getelementptr i32, ptr %6, i32 %p0
  %8 = shl i32 %p0, 1
  %9 = extractvalue %struct.0 %p1, 0
  %10 = getelementptr i32, ptr %9, i32 %p0
  switch i32 %p2, label %bb4 [
    i32 0, label %bb3
    i32 1, label %bb2
    i32 2, label %bb1
  ]

bb1:
  store i32 %2, ptr %1
  br label %bb5

bb2:
  store i32 %5, ptr %4
  br label %bb5

bb3:
  store i32 %8, ptr %7
  br label %bb5

bb4:
  store i32 0, ptr %10
  br label %bb5

bb5:
  ret void

}


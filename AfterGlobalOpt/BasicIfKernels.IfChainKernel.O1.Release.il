; stage: AfterGlobalOpt  opt: O1
; module: IfChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @IfChainKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = icmp ne i32 %p2, 0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = icmp ne i32 %p2, 1
  %4 = extractvalue %struct.0 %p1, 0
  %5 = getelementptr i32, ptr %4, i32 %p0
  %6 = icmp ne i32 %p2, 2
  %7 = extractvalue %struct.0 %p1, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  %9 = extractvalue %struct.0 %p1, 0
  %10 = getelementptr i32, ptr %9, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  store i32 10, ptr %2
  br label %bb7

bb2:
  br i1 %3, label %bb4, label %bb3

bb3:
  store i32 20, ptr %5
  br label %bb7

bb4:
  br i1 %6, label %bb6, label %bb5

bb5:
  store i32 30, ptr %8
  br label %bb7

bb6:
  store i32 40, ptr %10
  br label %bb7

bb7:
  ret void

}


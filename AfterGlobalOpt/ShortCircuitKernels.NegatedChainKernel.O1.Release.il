; stage: AfterGlobalOpt  opt: O1
; module: NegatedChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @NegatedChainKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp sgt i32 %p2, 0
  %1 = icmp sgt i32 %p3, 0
  %2 = and i1 %0, %1
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  %5 = extractvalue %struct.0 %p1, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  br i1 %2, label %bb2, label %bb1

bb1:
  store i32 1, ptr %4
  br label %bb3

bb2:
  store i32 0, ptr %6
  br label %bb3

bb3:
  ret void

}


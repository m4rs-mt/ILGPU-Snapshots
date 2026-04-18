; stage: AfterGlobalOpt  opt: O1
; module: ArrayBoundsKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @ArrayBoundsKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = icmp sge i32 %p0, %p2
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  store i32 %p0, ptr %2
  br label %bb3

bb2:
  store i32 -1, ptr %4
  br label %bb3

bb3:
  ret void

}


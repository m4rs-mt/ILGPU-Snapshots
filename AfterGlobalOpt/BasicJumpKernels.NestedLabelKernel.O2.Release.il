; stage: AfterGlobalOpt  opt: O2
; module: NestedLabelKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @NestedLabelKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = icmp ne i32 %p2, 0
  %1 = icmp ne i32 %p2, 1
  %2 = mul i32 %p2, 3
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  br i1 %0, label %bb3, label %bb1

bb1:
  br label %bb2

bb2:
  br label %bb7

bb3:
  br i1 %1, label %bb6, label %bb4

bb4:
  br label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %5 = phi i32 [ 100, %bb2 ], [ 200, %bb5 ], [ %2, %bb6 ]
  store i32 %5, ptr %4
  ret void

}


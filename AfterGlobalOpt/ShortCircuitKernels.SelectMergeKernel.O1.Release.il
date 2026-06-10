; stage: AfterGlobalOpt  opt: O1
; module: SelectMergeKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @SelectMergeKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4, i32 %p5) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = icmp sgt i32 %p2, 0
  %3 = icmp sgt i32 %p3, 0
  %4 = and i1 %2, %3
  %5 = select i1 %4, i32 %p4, i32 %p5
  store i32 %5, ptr %1
  ret void

}


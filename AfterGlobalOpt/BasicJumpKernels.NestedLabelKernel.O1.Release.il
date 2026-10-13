; stage: AfterGlobalOpt  opt: O1
; module: NestedLabelKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @NestedLabelKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = icmp eq i32 %p2, 0
  %3 = icmp ne i32 %p2, 0
  %4 = icmp ne i32 %p2, 1
  %5 = and i1 %3, %4
  %6 = mul i32 %p2, 3
  %7 = select i1 %5, i32 %6, i32 200
  %8 = select i1 %2, i32 100, i32 %7
  store i32 %8, ptr %1
  ret void

}


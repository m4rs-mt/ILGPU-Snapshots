; stage: AfterGlobalOpt  opt: O2
; module: SubViewKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @SubViewKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, i32 %p3) {
entry:
  %0 = extractvalue %struct.0 %p1, 1
  %1 = trunc i64 %0 to i32
  %2 = sub i32 %1, %p3
  %3 = icmp sge i32 %p0, %2
  %4 = extractvalue %struct.0 %p1, 0
  %5 = call %view.i32 @ilgpu.view.sub(%view.i32 %4, i64 %p3, i64 %2)
  %6 = getelementptr i32, ptr %5, i32 %p0
  %7 = extractvalue %struct.0 %p2, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  %9 = extractvalue %struct.0 %p2, 0
  %10 = getelementptr i32, ptr %9, i32 %p0
  br i1 %3, label %bb2, label %bb1

bb1:
  %11 = load i32, ptr %6
  store i32 %11, ptr %8
  br label %bb3

bb2:
  store i32 -1, ptr %10
  br label %bb3

bb3:
  ret void

}


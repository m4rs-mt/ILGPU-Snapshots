; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: TwoClosuresCrossBlockKernel  [intptr: i64]

define void @TwoClosuresCrossBlockKernel(i32 %p0, i32 %p1, i32 %p2, ptr<i32> addrspace(global) %p3, i64 %p4, i64 %p5, i8 %p6) {
entry:
  %0 = icmp sgt i32 %p0, 0
  %1 = icmp sgt i32 %p0, 0
  %2 = getelementptr i32, ptr %p3, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %3 = phi i32 [ %p1, %bb1 ], [ %p0, %bb2 ]
  %4 = add i32 %3, %p1
  br i1 %1, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %5 = phi i32 [ %p2, %bb4 ], [ %p0, %bb5 ]
  %6 = mul i32 %5, %p2
  %7 = add i32 %4, %6
  store i32 %7, ptr %2
  ret void

}


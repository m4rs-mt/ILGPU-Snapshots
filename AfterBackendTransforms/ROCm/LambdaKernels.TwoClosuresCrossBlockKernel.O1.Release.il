; stage: AfterBackendTransforms  backend: ROCm  opt: O1
; module: TwoClosuresCrossBlockKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @TwoClosuresCrossBlockKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = icmp sgt i32 %p0, 0
  %1 = icmp sgt i32 %p0, 0
  %2 = extractvalue %struct.0 %p1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb4

bb2:
  br label %bb3

bb3:
  br label %bb4

bb4:
  %4 = phi i32 [ %p2, %bb1 ], [ %p0, %bb3 ]
  %5 = add i32 %4, %p2
  br i1 %1, label %bb6, label %bb5

bb5:
  br label %bb8

bb6:
  br label %bb7

bb7:
  br label %bb8

bb8:
  %6 = phi i32 [ %p3, %bb5 ], [ %p0, %bb7 ]
  %7 = mul i32 %6, %p3
  %8 = add i32 %5, %7
  store i32 %8, ptr %3
  ret void

}


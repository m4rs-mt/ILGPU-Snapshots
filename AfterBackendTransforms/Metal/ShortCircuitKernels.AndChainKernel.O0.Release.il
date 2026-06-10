; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: AndChainKernel  [intptr: i64]

define void @AndChainKernel(i32 %p0, i32 %p1, i32 %p2, i32 %p3, ptr<i32> addrspace(global) %p4, i64 %p5, i64 %p6, i8 %p7) {
entry:
  %0 = icmp sle i32 %p1, 0
  %1 = icmp sle i32 %p2, 0
  %2 = icmp sgt i32 %p3, 0
  %3 = getelementptr i32, ptr %p4, i32 %p0
  %4 = getelementptr i32, ptr %p4, i32 %p0
  br i1 %0, label %bb3, label %bb1

bb1:
  br i1 %1, label %bb3, label %bb2

bb2:
  br label %bb4

bb3:
  br label %bb4

bb4:
  %5 = phi i1 [ %2, %bb2 ], [ false, %bb3 ]
  %6 = xor i1 %5, -1
  br i1 %6, label %bb6, label %bb5

bb5:
  store i32 1, ptr %3
  br label %bb7

bb6:
  store i32 0, ptr %4
  br label %bb7

bb7:
  ret void

}


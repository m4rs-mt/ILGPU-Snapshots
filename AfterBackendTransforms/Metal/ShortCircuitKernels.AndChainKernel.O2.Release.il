; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: AndChainKernel  [intptr: i64]

define void @AndChainKernel(i32 %p0, i32 %p1, i32 %p2, i32 %p3, ptr<i32> addrspace(global) %p4, i64 %p5, i64 %p6, i8 %p7) {
entry:
  %0 = icmp sle i32 %p1, 0
  %1 = icmp sgt i32 %p1, 0
  %2 = icmp sle i32 %p2, 0
  %3 = and i1 %1, %2
  %4 = or i1 %0, %3
  %5 = icmp sle i32 %p3, 0
  %6 = or i1 %4, %5
  %7 = getelementptr i32, ptr %p4, i32 %p0
  %8 = getelementptr i32, ptr %p4, i32 %p0
  br i1 %6, label %bb2, label %bb1

bb1:
  store i32 1, ptr %7
  br label %bb3

bb2:
  store i32 0, ptr %8
  br label %bb3

bb3:
  ret void

}


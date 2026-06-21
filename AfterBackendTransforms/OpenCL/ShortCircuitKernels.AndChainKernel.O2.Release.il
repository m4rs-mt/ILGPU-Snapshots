; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: AndChainKernel  [intptr: i64]

define void @AndChainKernel(i32 %p0, i32 %p1, i32 %p2, i32 %p3, ptr<i32> addrspace(global) %p4, i64 %p5, i64 %p6, i8 %p7) {
entry:
  %0 = icmp sle i32 %p2, 0
  %1 = icmp sle i32 %p1, 0
  %2 = or i1 %0, %1
  %3 = icmp sle i32 %p3, 0
  %4 = or i1 %2, %3
  %5 = getelementptr i32, ptr %p4, i32 %p0
  %6 = getelementptr i32, ptr %p4, i32 %p0
  br i1 %4, label %bb2, label %bb1

bb1:
  store i32 1, ptr %5
  br label %bb3

bb2:
  store i32 0, ptr %6
  br label %bb3

bb3:
  ret void

}


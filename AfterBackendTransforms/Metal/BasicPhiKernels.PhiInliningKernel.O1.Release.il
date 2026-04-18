; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: PhiInliningKernel  [intptr: i64]

define void @PhiInliningKernel(i32 %p0, i32 %p1, i32 %p2, ptr<i32> addrspace(global) %p3, i64 %p4, i64 %p5, i8 %p6) {
entry:
  %0 = getelementptr i32, ptr %p3, i32 %p0
  %1 = icmp sle i32 %p1, %p2
  %2 = sub i32 %p2, %p1
  %3 = sub i32 %p1, %p2
  %4 = select i1 %1, i32 %2, i32 %3
  store i32 %4, ptr %0
  ret void

}


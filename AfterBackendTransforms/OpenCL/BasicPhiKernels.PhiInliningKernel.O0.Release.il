; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: PhiInliningKernel  [intptr: i64]

define void @PhiInliningKernel(i32 %p0, i32 %p1, i32 %p2, ptr<i32> addrspace(global) %p3, i64 %p4, i64 %p5, i8 %p6) {
entry:
  %0 = icmp sle i32 %p1, %p2
  %1 = sub i32 %p1, %p2
  %2 = sub i32 %p2, %p1
  %3 = getelementptr i32, ptr %p3, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %4 = phi i32 [ %1, %bb1 ], [ %2, %bb2 ]
  store i32 %4, ptr %3
  ret void

}


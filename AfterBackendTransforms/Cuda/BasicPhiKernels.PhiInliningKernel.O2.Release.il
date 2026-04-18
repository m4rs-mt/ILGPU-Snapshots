; stage: AfterBackendTransforms  backend: Cuda  opt: O2
; module: PhiInliningKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @PhiInliningKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = icmp sle i32 %p2, %p3
  %3 = sub i32 %p3, %p2
  %4 = sub i32 %p2, %p3
  %5 = select i1 %2, i32 %3, i32 %4
  store i32 %5, ptr %1
  ret void

}


; stage: AfterBackendTransforms  backend: Cuda  opt: O1
; module: GotoKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @GotoKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = icmp sle i32 %p2, 5
  %3 = shl i32 %p2, 1
  %4 = select i1 %2, i32 %3, i32 0
  store i32 %4, ptr %1
  ret void

}


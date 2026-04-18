; stage: AfterBackendTransforms  backend: ROCm  opt: O1
; module: CopyKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @CopyKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = load i32, ptr %1
  %3 = extractvalue %struct.0 %p2, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  store i32 %2, ptr %4
  ret void

}


; stage: AfterBackendTransforms  backend: ROCm  opt: O2
; module: NegKernel  [intptr: i64]

%struct.0 = type { ptr<i64> addrspace(global), i64, i64, i8 }

define void @NegKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i64, ptr %0, i32 %p0
  %2 = load i64, ptr %1
  %3 = extractvalue %struct.0 %p2, 0
  %4 = getelementptr i64, ptr %3, i32 %p0
  %5 = sub i64 0, %2
  store i64 %5, ptr %4
  ret void

}


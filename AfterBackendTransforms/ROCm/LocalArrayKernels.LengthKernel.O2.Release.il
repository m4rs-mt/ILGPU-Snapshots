; stage: AfterBackendTransforms  backend: ROCm  opt: O2
; module: LengthKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @LengthKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  store i32 4, ptr %1
  ret void

}


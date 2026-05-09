; stage: AfterBackendTransforms  backend: ROCm  opt: O2
; module: LaunchClosure  [intptr: i64]

%struct.0 = type { ptr<i64> addrspace(global), i64, i64, i8 }

define void @LaunchClosure(i32 %p0, %struct.0 %p1, i32 %p2, i64 %p3) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i64, ptr %0, i32 %p0
  %2 = mul i32 %p2, %p0
  %3 = sext i32 %2 to i64
  %4 = add i64 %p3, %3
  store i64 %4, ptr %1
  ret void

}


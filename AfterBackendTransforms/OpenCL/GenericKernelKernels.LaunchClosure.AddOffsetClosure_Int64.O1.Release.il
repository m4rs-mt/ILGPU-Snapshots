; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: LaunchClosure  [intptr: i64]

define void @LaunchClosure(i32 %p0, i32 %p1, i64 %p2, ptr<i64> addrspace(global) %p3, i64 %p4, i64 %p5, i8 %p6) {
entry:
  %0 = getelementptr i64, ptr %p3, i32 %p0
  %1 = mul i32 %p1, %p0
  %2 = sext i32 %1 to i64
  %3 = add i64 %p2, %2
  store i64 %3, ptr %0
  ret void

}


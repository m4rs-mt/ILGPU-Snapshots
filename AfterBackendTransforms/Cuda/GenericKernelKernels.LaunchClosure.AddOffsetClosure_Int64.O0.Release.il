; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: LaunchClosure  [intptr: i64]

%struct.0 = type { ptr<i64> addrspace(global), i64 }
%struct.1 = type { ptr<i64> addrspace(global), i64, i64, i8 }

define void @LaunchClosure(i32 %p0, %struct.1 %p1, i32 %p2, i64 %p3) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i64, ptr %1, i32 %p0
  %3 = mul i32 %p2, %p0
  %4 = sext i32 %3 to i64
  %5 = add i64 %p3, %4
  store i64 %5, ptr %2
  ret void

}


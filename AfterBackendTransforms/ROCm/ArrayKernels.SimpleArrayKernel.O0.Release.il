; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: SimpleArrayKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @SimpleArrayKernel(i32 %p0, %struct.1 %p1, %struct.1 %p2) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = load i32, ptr %2
  %4 = extractvalue %struct.1 %p2, 0 [Span: 2]
  %5 = extractvalue %struct.0 %4, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  %7 = shl i32 %3, 1
  %8 = add i32 %7, 1
  store i32 %8, ptr %6
  ret void

}


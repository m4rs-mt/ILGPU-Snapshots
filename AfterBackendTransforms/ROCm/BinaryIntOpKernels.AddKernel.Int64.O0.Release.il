; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: AddKernel  [intptr: i64]

%struct.0 = type { ptr<i64> addrspace(global), i64 }
%struct.1 = type { ptr<i64> addrspace(global), i64, i64, i8 }

define void @AddKernel(i32 %p0, %struct.1 %p1, %struct.1 %p2, %struct.1 %p3) {
entry:
  %0 = extractvalue %struct.1 %p2, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i64, ptr %1, i32 %p0
  %3 = load i64, ptr %2
  %4 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %5 = extractvalue %struct.0 %4, 0
  %6 = getelementptr i64, ptr %5, i32 %p0
  %7 = load i64, ptr %6
  %8 = extractvalue %struct.1 %p3, 0 [Span: 2]
  %9 = extractvalue %struct.0 %8, 0
  %10 = getelementptr i64, ptr %9, i32 %p0
  %11 = add i64 %7, %3
  store i64 %11, ptr %10
  ret void

}


; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: StructFieldAccessKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.2 = type { i32, i64, i16, i32 }

define void @StructFieldAccessKernel(i32 %p0, %struct.1 %p1, %struct.2 %p2) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = extractvalue %struct.2 %p2, 0
  %4 = extractvalue %struct.2 %p2, 1
  %5 = trunc i64 %4 to i32
  %6 = add i32 %3, %5
  %7 = extractvalue %struct.2 %p2, 2
  %8 = sext i16 %7 to i32
  %9 = add i32 %6, %8
  %10 = extractvalue %struct.2 %p2, 3
  %11 = add i32 %9, %10
  store i32 %11, ptr %2
  ret void

}


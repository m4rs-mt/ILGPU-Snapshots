; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: AddKernel  [intptr: i64]

%struct.0 = type { ptr<i8> addrspace(global), i64 }
%struct.1 = type { ptr<i8> addrspace(global), i64, i64, i8 }

define void @AddKernel(i32 %p0, %struct.1 %p1, %struct.1 %p2, %struct.1 %p3) {
entry:
  %0 = extractvalue %struct.1 %p2, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i8, ptr %1, i32 %p0
  %3 = load i8, ptr %2
  %4 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %5 = extractvalue %struct.0 %4, 0
  %6 = getelementptr i8, ptr %5, i32 %p0
  %7 = load i8, ptr %6
  %8 = extractvalue %struct.1 %p3, 0 [Span: 2]
  %9 = extractvalue %struct.0 %8, 0
  %10 = getelementptr i8, ptr %9, i32 %p0
  %11 = zext i8 %7 to i32
  %12 = zext i8 %3 to i32
  %13 = add i32 %11, %12
  %14 = trunc i32 %13 to i8
  store i8 %14, ptr %10
  ret void

}


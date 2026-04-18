; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: StructFieldAccessKernel  [intptr: i64]

%struct.0 = type { i32, i64, i16, i32 }

define void @StructFieldAccessKernel(i32 %p0, %struct.0 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = getelementptr i32, ptr %p2, i32 %p0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = extractvalue %struct.0 %p1, 1
  %3 = trunc i64 %2 to i32
  %4 = add i32 %1, %3
  %5 = extractvalue %struct.0 %p1, 2
  %6 = sext i16 %5 to i32
  %7 = add i32 %4, %6
  %8 = extractvalue %struct.0 %p1, 3
  %9 = add i32 %7, %8
  store i32 %9, ptr %0
  ret void

}


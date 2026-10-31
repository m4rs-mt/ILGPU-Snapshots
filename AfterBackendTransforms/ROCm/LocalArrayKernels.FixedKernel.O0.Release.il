; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: FixedKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @FixedKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = addrspacecast ptr @g0 to ptr<i32>
  %1 = and i32 %p0, 3
  %2 = getelementptr i32, ptr %0, i32 %1
  %3 = mul i32 %p0, 10
  store i32 %3, ptr %2
  %4 = and i32 %p0, 3
  %5 = getelementptr i32, ptr @g0, i32 %4
  %6 = load i32, ptr %5
  %7 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %8 = extractvalue %struct.0 %7, 0
  %9 = getelementptr i32, ptr %8, i32 %p0
  store i32 %6, ptr %9
  ret void

}


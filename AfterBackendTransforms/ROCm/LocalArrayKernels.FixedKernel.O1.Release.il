; stage: AfterBackendTransforms  backend: ROCm  opt: O1
; module: FixedKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @FixedKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = and i32 %p0, 3
  %1 = getelementptr i32, ptr @g0, i32 %0
  %2 = mul i32 %p0, 10
  store i32 %2, ptr %1
  %3 = and i32 %p0, 3
  %4 = getelementptr i32, ptr @g0, i32 %3
  %5 = load i32, ptr %4
  %6 = extractvalue %struct.0 %p1, 0
  %7 = getelementptr i32, ptr %6, i32 %p0
  store i32 %5, ptr %7
  ret void

}


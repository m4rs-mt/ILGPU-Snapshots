; stage: AfterBackendTransforms  backend: ROCm  opt: O1
; module: ConditionalNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.1 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @ConditionalNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = and i32 %p0, 1
  %3 = icmp eq i32 %2, 0
  %4 = { ptr<i32> addrspace(local) @g0, i64 3 }  ; %struct.1
  %5 = select i1 %3, %struct.1 %4, %struct.1 null
  %6 = extractvalue %struct.1 %5, 0
  %7 = icmp eq ptr<i32> addrspace(local) %6, null
  %8 = extractvalue %struct.1 %5, 1
  %9 = trunc i64 %8 to i32
  %10 = select i1 %7, i32 -1, i32 %9
  store i32 %10, ptr %1
  ret void

}


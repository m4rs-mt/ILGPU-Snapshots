; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: ConditionalNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @ConditionalNullKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = getelementptr i32, ptr %p1, i32 %p0
  %1 = and i32 %p0, 1
  %2 = icmp eq i32 %1, 0
  %3 = { ptr<i32> addrspace(local) @g0, i64 3 }  ; %struct.0
  %4 = select i1 %2, %struct.0 %3, %struct.0 null
  %5 = extractvalue %struct.0 %4, 0
  %6 = icmp eq ptr<i32> addrspace(local) %5, null
  %7 = extractvalue %struct.0 %4, 1
  %8 = trunc i64 %7 to i32
  %9 = select i1 %6, i32 -1, i32 %8
  store i32 %9, ptr %0
  ret void

}


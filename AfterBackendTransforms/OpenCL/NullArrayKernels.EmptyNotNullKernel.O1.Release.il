; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: EmptyNotNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @EmptyNotNullKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = getelementptr i32, ptr %p1, i32 %p0
  %1 = icmp sgt i32 %p0, 1
  %2 = { ptr<i32> addrspace(local) @g0, i64 0 }  ; %struct.0
  %3 = select i1 %1, %struct.0 %2, %struct.0 null
  %4 = extractvalue %struct.0 %3, 0
  %5 = icmp eq ptr<i32> addrspace(local) %4, null
  %6 = extractvalue %struct.0 %3, 1
  %7 = trunc i64 %6 to i32
  %8 = select i1 %5, i32 -1, i32 %7
  store i32 %8, ptr %0
  ret void

}


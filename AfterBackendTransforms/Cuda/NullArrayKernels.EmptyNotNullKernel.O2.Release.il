; stage: AfterBackendTransforms  backend: Cuda  opt: O2
; module: EmptyNotNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.1 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @EmptyNotNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = icmp sgt i32 %p0, 1
  %3 = { ptr<i32> addrspace(local) @g0, i64 0 }  ; %struct.1
  %4 = select i1 %2, %struct.1 %3, %struct.1 null
  %5 = extractvalue %struct.1 %4, 0
  %6 = icmp eq ptr<i32> addrspace(local) %5, null
  %7 = extractvalue %struct.1 %4, 1
  %8 = trunc i64 %7 to i32
  %9 = select i1 %6, i32 -1, i32 %8
  store i32 %9, ptr %1
  ret void

}


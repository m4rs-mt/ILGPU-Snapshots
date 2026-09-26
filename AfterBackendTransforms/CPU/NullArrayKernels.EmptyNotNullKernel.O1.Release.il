; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: EmptyNotNullKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @EmptyNotNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = icmp sgt i32 %p0, 1
  %3 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 0)
  %4 = select i1 %2, %view.i32 %3, %view.i32 null
  %5 = getelementptr i32, ptr %4, i32 0
  %6 = icmp eq ptr<i32> addrspace(local) %5, null
  %7 = call i64 @ilgpu.view.length(%view.i32 %4)
  %8 = select i1 %6, i32 -1, i32 %7
  store i32 %8, ptr %1
  ret void

}


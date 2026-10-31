; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: ConditionalNullKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @ConditionalNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = and i32 %p0, 1
  %3 = icmp eq i32 %2, 0
  %4 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 3)
  %5 = select i1 %3, %view.i32 %4, %view.i32 null
  %6 = getelementptr i32, ptr %5, i32 0
  %7 = icmp eq ptr<i32> addrspace(local) %6, null
  %8 = call i64 @ilgpu.view.length(%view.i32 %5)
  %9 = select i1 %7, i32 -1, i32 %8
  store i32 %9, ptr %1
  ret void

}


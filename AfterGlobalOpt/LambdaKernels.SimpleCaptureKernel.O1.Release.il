; stage: AfterGlobalOpt  opt: O1
; module: SimpleCaptureKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @SimpleCaptureKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = call ptr<i32> addrspace(local) @ilgpu.gc_init(@g0)
  store i32 %p2, ptr %0
  %1 = load i32, ptr %0
  %2 = extractvalue %struct.0 %p1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  %4 = add i32 %p0, %1
  store i32 %4, ptr %3
  ret void

}


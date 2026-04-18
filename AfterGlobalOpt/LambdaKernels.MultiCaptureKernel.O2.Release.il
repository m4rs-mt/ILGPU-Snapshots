; stage: AfterGlobalOpt  opt: O2
; module: MultiCaptureKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i32 }

@g0 = internal global %struct.1 zeroinitializer ; local

define void @MultiCaptureKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = call ptr<%struct.1> addrspace(local) @ilgpu.gc_init(@g0)
  %1 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  store i32 %p2, ptr %1
  %2 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  store i32 %p3, ptr %2
  %3 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %4 = load i32, ptr %3
  %5 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %6 = load i32, ptr %5
  %7 = extractvalue %struct.0 %p1, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  %9 = mul i32 %p0, %4
  %10 = add i32 %9, %6
  store i32 %10, ptr %8
  ret void

}


; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: BarrierOrderingKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @BarrierOrderingKernel(i32 %p0, %struct.1 %p1, %struct.1 %p2) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = shl i32 %p0, 1
  store i32 %3, ptr %2
  call void @ilgpu.barrier.group()
  %4 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %5 = extractvalue %struct.0 %4, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  %7 = load i32, ptr %6
  %8 = extractvalue %struct.1 %p2, 0 [Span: 2]
  %9 = extractvalue %struct.0 %8, 0
  %10 = getelementptr i32, ptr %9, i32 %p0
  %11 = add i32 %7, 1
  store i32 %11, ptr %10
  ret void

}


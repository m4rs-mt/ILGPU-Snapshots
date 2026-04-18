; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: WarpAllReduceAddKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @WarpAllReduceAddKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = add i32 %p0, 1
  %1 = call i32 @ilgpu.shuffle.bfly(i32 %0, i32 16)
  %2 = add i32 %0, %1
  %3 = call i32 @ilgpu.shuffle.bfly(i32 %2, i32 8)
  %4 = add i32 %2, %3
  %5 = call i32 @ilgpu.shuffle.bfly(i32 %4, i32 4)
  %6 = add i32 %4, %5
  %7 = call i32 @ilgpu.shuffle.bfly(i32 %6, i32 2)
  %8 = add i32 %6, %7
  %9 = call i32 @ilgpu.shuffle.bfly(i32 %8, i32 1)
  %10 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %11 = extractvalue %struct.0 %10, 0
  %12 = getelementptr i32, ptr %11, i32 %p0
  %13 = add i32 %8, %9
  store i32 %13, ptr %12
  ret void

}


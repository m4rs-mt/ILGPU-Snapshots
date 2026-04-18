; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: BarrierOrderingKernel  [intptr: i64]

define void @BarrierOrderingKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i32> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = getelementptr i32, ptr %p1, i32 %p0
  %1 = shl i32 %p0, 1
  store i32 %1, ptr %0
  call void @ilgpu.barrier.group()
  %2 = getelementptr i32, ptr %p1, i32 %p0
  %3 = load i32, ptr %2
  %4 = getelementptr i32, ptr %p5, i32 %p0
  %5 = add i32 %3, 1
  store i32 %5, ptr %4
  ret void

}


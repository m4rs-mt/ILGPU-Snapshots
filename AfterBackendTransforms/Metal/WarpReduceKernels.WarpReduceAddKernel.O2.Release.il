; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: WarpReduceAddKernel  [intptr: i64]

define void @WarpReduceAddKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = call i32 @ilgpu.warp.reduce.Reduce.Add(i32 1)
  %1 = getelementptr i32, ptr %p1, i32 %p0
  store i32 %0, ptr %1
  ret void

}


; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: WarpAllReduceAddKernel  [intptr: i64]

define void @WarpAllReduceAddKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = add i32 %p0, 1
  %1 = call i32 @ilgpu.warp.reduce.AllReduce.Add(i32 %0)
  %2 = getelementptr i32, ptr %p1, i32 %p0
  store i32 %1, ptr %2
  ret void

}


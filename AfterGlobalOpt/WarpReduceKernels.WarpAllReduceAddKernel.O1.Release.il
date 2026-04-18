; stage: AfterGlobalOpt  opt: O1
; module: WarpAllReduceAddKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @WarpAllReduceAddKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = add i32 %p0, 1
  %1 = call i32 @ilgpu.warp.reduce.AllReduce.Add(i32 %0)
  %2 = extractvalue %struct.0 %p1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  store i32 %1, ptr %3
  ret void

}


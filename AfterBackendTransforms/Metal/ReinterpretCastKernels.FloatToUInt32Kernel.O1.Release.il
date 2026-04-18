; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: FloatToUInt32Kernel  [intptr: i64]

define void @FloatToUInt32Kernel(i32 %p0, ptr<float> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i32> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = alloca float, i32 1
  store float 0.0, ptr %0
  %1 = getelementptr float, ptr %p1, i32 %p0
  %2 = load float, ptr %1
  store float %2, ptr %0
  %3 = bitcast ptr %0 to ptr ; float -> i32
  %4 = load i32, ptr %3
  %5 = getelementptr i32, ptr %p5, i32 %p0
  store i32 %4, ptr %5
  ret void

}


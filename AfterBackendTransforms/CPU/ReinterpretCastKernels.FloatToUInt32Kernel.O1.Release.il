; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: FloatToUInt32Kernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @FloatToUInt32Kernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = alloca float, i32 1
  store float 0.0, ptr %0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr float, ptr %1, i32 %p0
  %3 = load float, ptr %2
  store float %3, ptr %0
  %4 = bitcast ptr %0 to ptr ; float -> i32
  %5 = load i32, ptr %4
  %6 = extractvalue %struct.1 %p2, 0
  %7 = getelementptr i32, ptr %6, i32 %p0
  store i32 %5, ptr %7
  ret void

}


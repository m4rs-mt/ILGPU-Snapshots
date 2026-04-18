; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: WarpSizeKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @WarpSizeKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  store i32 8, ptr %1
  ret void

}


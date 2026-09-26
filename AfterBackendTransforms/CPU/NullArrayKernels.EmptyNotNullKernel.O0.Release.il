; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: EmptyNotNullKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @EmptyNotNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = icmp sgt i32 %p0, 1
  %1 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 0)
  %2 = extractvalue %struct.0 %p1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %4 = phi %view.i32 [ null, %bb1 ], [ %1, %bb2 ]
  %5 = getelementptr i32, ptr %4, i32 0
  %6 = icmp eq ptr<i32> addrspace(local) %5, null
  %7 = call i64 @ilgpu.view.length(%view.i32 %4)
  br i1 %6, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %8 = phi i32 [ %7, %bb4 ], [ -1, %bb5 ]
  store i32 %8, ptr %3
  ret void

}


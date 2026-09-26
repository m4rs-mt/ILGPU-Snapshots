; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: ConditionalNullKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @ConditionalNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = and i32 %p0, 1
  %1 = icmp eq i32 %0, 0
  %2 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 3)
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %5 = phi %view.i32 [ null, %bb1 ], [ %2, %bb2 ]
  %6 = getelementptr i32, ptr %5, i32 0
  %7 = icmp eq ptr<i32> addrspace(local) %6, null
  %8 = call i64 @ilgpu.view.length(%view.i32 %5)
  br i1 %7, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %9 = phi i32 [ %8, %bb4 ], [ -1, %bb5 ]
  store i32 %9, ptr %4
  ret void

}


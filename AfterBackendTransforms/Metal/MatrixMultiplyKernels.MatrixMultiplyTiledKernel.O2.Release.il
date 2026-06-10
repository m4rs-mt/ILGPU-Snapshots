; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: MatrixMultiplyTiledKernel  [intptr: i64]

%struct.0 = type { i64, i32 }

@g0 = internal global float zeroinitializer ; shared
@g1 = internal global float zeroinitializer ; shared

define void @MatrixMultiplyTiledKernel(%struct.0 %p0, i32 %p1, ptr<float> addrspace(global) %p2, i64 %p3, i64 %p4, i64 %p5, i32 %p6, ptr<float> addrspace(global) %p7, i64 %p8, i64 %p9, i64 %p10, i32 %p11, ptr<float> addrspace(global) %p12, i64 %p13, i64 %p14, i64 %p15, i32 %p16) {
entry:
  %0 = trunc i64 %p5 to i32
  %1 = extractvalue %struct.0 %p0, 0
  %2 = sext i32 %p1 to i64
  %3 = extractvalue %struct.0 %p0, 1
  %4 = ashr i32 %3, 1
  %5 = trunc i64 %p14 to i32
  %6 = extractvalue %struct.0 %p0, 0
  %7 = sext i32 %p1 to i64
  %8 = extractvalue %struct.0 %p0, 1
  %9 = srem i32 %8, 2
  %10 = trunc i64 %p15 to i32
  %11 = shl i32 %9, 1
  %12 = add i32 %4, %11
  %13 = getelementptr float, ptr @g0, i32 %12
  %14 = shl i32 %9, 1
  %15 = add i32 %4, %14
  %16 = getelementptr float, ptr @g1, i32 %15
  %17 = getelementptr float, ptr @g0, i32 %4
  %18 = shl i32 %9, 1
  %19 = getelementptr float, ptr @g1, i32 %18
  %20 = add i32 %4, 2
  %21 = getelementptr float, ptr @g0, i32 %20
  %22 = shl i32 %9, 1
  %23 = add i32 %22, 1
  %24 = getelementptr float, ptr @g1, i32 %23
  br label %bb1

bb1:
  br label %bb2

bb2:
  %25 = phi i32 [ 0, %bb1 ], [ %27, %bb11 ]
  %26 = phi float [ 0.0, %bb1 ], [ %61, %bb11 ]
  %27 = add i32 %25, 2
  %28 = icmp slt i32 %25, %0
  %29 = sdiv i64 %1, %2
  %30 = trunc i64 %29 to i32
  %31 = shl i32 %30, 1
  %32 = add i32 %31, %4
  %33 = icmp sge i32 %32, %5
  %34 = srem i64 %6, %7
  %35 = trunc i64 %34 to i32
  %36 = shl i32 %35, 1
  %37 = add i32 %36, %9
  %38 = icmp slt i32 %37, %10
  %39 = mul i32 %37, %p16
  %40 = add i32 %32, %39
  %41 = getelementptr float, ptr %p12, i32 %40
  %42 = add i32 %9, %25
  %43 = mul i32 %42, %p6
  %44 = add i32 %32, %43
  %45 = getelementptr float, ptr %p2, i32 %44
  %46 = add i32 %4, %25
  %47 = mul i32 %37, %p11
  %48 = add i32 %46, %47
  %49 = getelementptr float, ptr %p7, i32 %48
  br i1 %28, label %bb10, label %bb3

bb3:
  br i1 %33, label %bb6, label %bb4

bb4:
  br label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %50 = phi i1 [ %38, %bb5 ], [ false, %bb6 ]
  %51 = xor i1 %50, -1
  br i1 %51, label %bb9, label %bb8

bb8:
  store float %26, ptr %41
  br label %bb9

bb9:
  ret void

bb10:
  %52 = load float, ptr %45
  store float %52, ptr %13
  %53 = load float, ptr %49
  store float %53, ptr %16
  call void @ilgpu.barrier.group()
  %54 = load float, ptr %17
  %55 = load float, ptr %19
  %56 = load float, ptr %21
  %57 = fmul float %54, %55
  %58 = fadd float %26, %57
  br label %bb11

bb11:
  %59 = load float, ptr %24
  call void @ilgpu.barrier.group()
  %60 = fmul float %56, %59
  %61 = fadd float %58, %60
  br label %bb2

}


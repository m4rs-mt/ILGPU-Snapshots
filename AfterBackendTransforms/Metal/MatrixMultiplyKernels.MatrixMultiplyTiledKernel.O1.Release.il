; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: MatrixMultiplyTiledKernel  [intptr: i64]

%struct.0 = type { i64, i32 }

@g0 = internal global float zeroinitializer ; shared
@g1 = internal global float zeroinitializer ; shared

define void @MatrixMultiplyTiledKernel(%struct.0 %p0, i32 %p1, ptr<float> addrspace(global) %p2, i64 %p3, i64 %p4, i64 %p5, i32 %p6, ptr<float> addrspace(global) %p7, i64 %p8, i64 %p9, i64 %p10, i32 %p11, ptr<float> addrspace(global) %p12, i64 %p13, i64 %p14, i64 %p15, i32 %p16) {
entry:
  %0 = trunc i64 %p5 to i32
  %1 = extractvalue %struct.0 %p0, 0
  %2 = sext i32 %p1 to i64
  %3 = sdiv i64 %1, %2
  %4 = trunc i64 %3 to i32
  %5 = shl i32 %4, 1
  %6 = extractvalue %struct.0 %p0, 1
  %7 = ashr i32 %6, 1
  %8 = add i32 %5, %7
  %9 = trunc i64 %p14 to i32
  %10 = icmp sge i32 %8, %9
  %11 = extractvalue %struct.0 %p0, 0
  %12 = sext i32 %p1 to i64
  %13 = srem i64 %11, %12
  %14 = trunc i64 %13 to i32
  %15 = shl i32 %14, 1
  %16 = extractvalue %struct.0 %p0, 1
  %17 = srem i32 %16, 2
  %18 = add i32 %15, %17
  %19 = trunc i64 %p15 to i32
  %20 = icmp sge i32 %18, %19
  %21 = or i1 %10, %20
  %22 = mul i32 %18, %p16
  %23 = add i32 %8, %22
  %24 = getelementptr float, ptr %p12, i32 %23
  %25 = shl i32 %17, 1
  %26 = add i32 %7, %25
  %27 = getelementptr float, ptr @g0, i32 %26
  %28 = mul i32 %18, %p11
  %29 = shl i32 %17, 1
  %30 = add i32 %7, %29
  %31 = getelementptr float, ptr @g1, i32 %30
  %32 = getelementptr float, ptr @g0, i32 %7
  %33 = shl i32 %17, 1
  %34 = getelementptr float, ptr @g1, i32 %33
  %35 = add i32 %7, 2
  %36 = getelementptr float, ptr @g0, i32 %35
  %37 = shl i32 %17, 1
  %38 = add i32 %37, 1
  %39 = getelementptr float, ptr @g1, i32 %38
  br label %bb1

bb1:
  br label %bb2

bb2:
  %40 = phi i32 [ 0, %bb1 ], [ %42, %bb7 ]
  %41 = phi float [ 0.0, %bb1 ], [ %60, %bb7 ]
  %42 = add i32 %40, 2
  %43 = icmp slt i32 %40, %0
  %44 = add i32 %17, %40
  %45 = mul i32 %44, %p6
  %46 = add i32 %8, %45
  %47 = getelementptr float, ptr %p2, i32 %46
  %48 = add i32 %7, %40
  %49 = add i32 %48, %28
  %50 = getelementptr float, ptr %p7, i32 %49
  br i1 %43, label %bb6, label %bb3

bb3:
  br i1 %21, label %bb5, label %bb4

bb4:
  store float %41, ptr %24
  br label %bb5

bb5:
  ret void

bb6:
  %51 = load float, ptr %47
  store float %51, ptr %27
  %52 = load float, ptr %50
  store float %52, ptr %31
  call void @ilgpu.barrier.group()
  %53 = load float, ptr %32
  %54 = load float, ptr %34
  %55 = load float, ptr %36
  %56 = fmul float %53, %54
  %57 = fadd float %41, %56
  br label %bb7

bb7:
  %58 = load float, ptr %39
  call void @ilgpu.barrier.group()
  %59 = fmul float %55, %58
  %60 = fadd float %57, %59
  br label %bb2

}


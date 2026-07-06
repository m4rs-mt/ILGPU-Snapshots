; stage: AfterBackendTransforms  backend: ROCm  opt: O2
; module: MatrixMultiplyTiledKernel  [intptr: i64]

%struct.0 = type { i64, i32 }
%struct.1 = type { ptr<float> addrspace(global), i64, i64, i64, i32 }
%struct.2 = type { i64, i64 }

@g0 = internal global float zeroinitializer ; shared
@g1 = internal global float zeroinitializer ; shared

define void @MatrixMultiplyTiledKernel(%struct.0 %p0, %struct.1 %p1, %struct.1 %p2, %struct.1 %p3, i32 %p4) {
entry:
  %0 = extractvalue %struct.1 %p1, 2 [Span: 2]
  %1 = extractvalue %struct.2 %0, 1
  %2 = trunc i64 %1 to i32
  %3 = extractvalue %struct.0 %p0, 0
  %4 = sext i32 %p4 to i64
  %5 = extractvalue %struct.0 %p0, 1
  %6 = sdiv i32 %5, 2
  %7 = extractvalue %struct.1 %p3, 2 [Span: 2]
  %8 = extractvalue %struct.2 %7, 0
  %9 = trunc i64 %8 to i32
  %10 = extractvalue %struct.0 %p0, 0
  %11 = sext i32 %p4 to i64
  %12 = extractvalue %struct.0 %p0, 1
  %13 = srem i32 %12, 2
  %14 = extractvalue %struct.1 %p3, 2 [Span: 2]
  %15 = extractvalue %struct.2 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = extractvalue %struct.1 %p3, 0
  %18 = extractvalue %struct.1 %p3, 4
  %19 = extractvalue %struct.1 %p1, 0
  %20 = extractvalue %struct.1 %p1, 4
  %21 = shl i32 %13, 1
  %22 = add i32 %6, %21
  %23 = getelementptr float, ptr @g0, i32 %22
  %24 = extractvalue %struct.1 %p2, 0
  %25 = extractvalue %struct.1 %p2, 4
  %26 = shl i32 %13, 1
  %27 = add i32 %6, %26
  %28 = getelementptr float, ptr @g1, i32 %27
  %29 = getelementptr float, ptr @g0, i32 %6
  %30 = shl i32 %13, 1
  %31 = getelementptr float, ptr @g1, i32 %30
  %32 = add i32 %6, 2
  %33 = getelementptr float, ptr @g0, i32 %32
  %34 = shl i32 %13, 1
  %35 = add i32 %34, 1
  %36 = getelementptr float, ptr @g1, i32 %35
  br label %bb1

bb1:
  br label %bb2

bb2:
  %37 = phi i32 [ 0, %bb1 ], [ %39, %bb11 ]
  %38 = phi float [ 0.0, %bb1 ], [ %73, %bb11 ]
  %39 = add i32 %37, 2
  %40 = icmp slt i32 %37, %2
  %41 = sdiv i64 %3, %4
  %42 = trunc i64 %41 to i32
  %43 = shl i32 %42, 1
  %44 = add i32 %43, %6
  %45 = icmp sge i32 %44, %9
  %46 = srem i64 %10, %11
  %47 = trunc i64 %46 to i32
  %48 = shl i32 %47, 1
  %49 = add i32 %48, %13
  %50 = icmp slt i32 %49, %16
  %51 = mul i32 %49, %18
  %52 = add i32 %44, %51
  %53 = getelementptr float, ptr %17, i32 %52
  %54 = add i32 %13, %37
  %55 = mul i32 %54, %20
  %56 = add i32 %44, %55
  %57 = getelementptr float, ptr %19, i32 %56
  %58 = add i32 %6, %37
  %59 = mul i32 %49, %25
  %60 = add i32 %58, %59
  %61 = getelementptr float, ptr %24, i32 %60
  br i1 %40, label %bb10, label %bb3

bb3:
  br i1 %45, label %bb6, label %bb4

bb4:
  br label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %62 = phi i1 [ %50, %bb5 ], [ false, %bb6 ]
  %63 = xor i1 %62, -1
  br i1 %63, label %bb9, label %bb8

bb8:
  store float %38, ptr %53
  br label %bb9

bb9:
  ret void

bb10:
  %64 = load float, ptr %57
  store float %64, ptr %23
  %65 = load float, ptr %61
  store float %65, ptr %28
  call void @ilgpu.barrier.group()
  %66 = load float, ptr %29
  %67 = load float, ptr %31
  %68 = load float, ptr %33
  %69 = fmul float %66, %67
  %70 = fadd float %38, %69
  br label %bb11

bb11:
  %71 = load float, ptr %36
  call void @ilgpu.barrier.group()
  %72 = fmul float %68, %71
  %73 = fadd float %70, %72
  br label %bb2

}


; stage: AfterGlobalOpt  opt: O2
; module: DeepChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DeepChainKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = and i32 %p2, 2
  %1 = icmp eq i32 %0, 0
  %2 = and i32 %p2, 1
  %3 = icmp eq i32 %2, 0
  %4 = or i1 %1, %3
  %5 = icmp ne i32 %2, 0
  %6 = icmp ne i32 %0, 0
  %7 = and i1 %5, %6
  %8 = and i32 %p2, 4
  %9 = icmp eq i32 %8, 0
  %10 = and i1 %7, %9
  %11 = or i1 %4, %10
  %12 = icmp ne i32 %2, 0
  %13 = icmp ne i32 %0, 0
  %14 = and i1 %12, %13
  %15 = icmp ne i32 %8, 0
  %16 = and i1 %14, %15
  %17 = and i32 %p2, 8
  %18 = icmp eq i32 %17, 0
  %19 = and i1 %16, %18
  %20 = or i1 %11, %19
  %21 = icmp ne i32 %2, 0
  %22 = icmp ne i32 %0, 0
  %23 = and i1 %21, %22
  %24 = icmp ne i32 %8, 0
  %25 = and i1 %23, %24
  %26 = icmp ne i32 %17, 0
  %27 = and i1 %25, %26
  %28 = and i32 %p2, 16
  %29 = icmp eq i32 %28, 0
  %30 = and i1 %27, %29
  %31 = or i1 %20, %30
  %32 = icmp ne i32 %2, 0
  %33 = icmp ne i32 %0, 0
  %34 = and i1 %32, %33
  %35 = icmp ne i32 %8, 0
  %36 = and i1 %34, %35
  %37 = icmp ne i32 %17, 0
  %38 = and i1 %36, %37
  %39 = icmp ne i32 %28, 0
  %40 = and i1 %38, %39
  %41 = and i32 %p2, 32
  %42 = icmp eq i32 %41, 0
  %43 = and i1 %40, %42
  %44 = or i1 %31, %43
  %45 = icmp ne i32 %2, 0
  %46 = icmp ne i32 %0, 0
  %47 = and i1 %45, %46
  %48 = icmp ne i32 %8, 0
  %49 = and i1 %47, %48
  %50 = icmp ne i32 %17, 0
  %51 = and i1 %49, %50
  %52 = icmp ne i32 %28, 0
  %53 = and i1 %51, %52
  %54 = icmp ne i32 %41, 0
  %55 = and i1 %53, %54
  %56 = and i32 %p2, 64
  %57 = icmp eq i32 %56, 0
  %58 = and i1 %55, %57
  %59 = or i1 %44, %58
  %60 = icmp ne i32 %2, 0
  %61 = icmp ne i32 %0, 0
  %62 = and i1 %60, %61
  %63 = icmp ne i32 %8, 0
  %64 = and i1 %62, %63
  %65 = icmp ne i32 %17, 0
  %66 = and i1 %64, %65
  %67 = icmp ne i32 %28, 0
  %68 = and i1 %66, %67
  %69 = icmp ne i32 %41, 0
  %70 = and i1 %68, %69
  %71 = icmp ne i32 %56, 0
  %72 = and i1 %70, %71
  %73 = and i32 %p2, 128
  %74 = icmp eq i32 %73, 0
  %75 = and i1 %72, %74
  %76 = or i1 %59, %75
  %77 = icmp ne i32 %2, 0
  %78 = icmp ne i32 %0, 0
  %79 = and i1 %77, %78
  %80 = icmp ne i32 %8, 0
  %81 = and i1 %79, %80
  %82 = icmp ne i32 %17, 0
  %83 = and i1 %81, %82
  %84 = icmp ne i32 %28, 0
  %85 = and i1 %83, %84
  %86 = icmp ne i32 %41, 0
  %87 = and i1 %85, %86
  %88 = icmp ne i32 %56, 0
  %89 = and i1 %87, %88
  %90 = icmp ne i32 %73, 0
  %91 = and i1 %89, %90
  %92 = and i32 %p2, 256
  %93 = icmp eq i32 %92, 0
  %94 = and i1 %91, %93
  %95 = or i1 %76, %94
  %96 = and i32 %p2, 512
  %97 = icmp ule i32 %96, 0
  %98 = or i1 %95, %97
  %99 = extractvalue %struct.0 %p1, 0
  %100 = getelementptr i32, ptr %99, i32 %p0
  %101 = extractvalue %struct.0 %p1, 0
  %102 = getelementptr i32, ptr %101, i32 %p0
  br i1 %98, label %bb2, label %bb1

bb1:
  store i32 1, ptr %100
  br label %bb3

bb2:
  store i32 0, ptr %102
  br label %bb3

bb3:
  ret void

}


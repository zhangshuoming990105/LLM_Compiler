; ModuleID = 'core_init_matrix.c'
source_filename = "core_init_matrix.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MAT_PARAMS_S = type { i32, ptr, ptr, ptr }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @core_init_matrix(i32 noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i16, align 2
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  store i32 0, ptr %9, align 4
  store i32 1, ptr %12, align 4
  store i32 0, ptr %14, align 4
  store i32 0, ptr %15, align 4
  %16 = load i32, ptr %7, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %4
  store i32 1, ptr %7, align 4
  br label %19

19:                                               ; preds = %18, %4
  br label %20

20:                                               ; preds = %24, %19
  %21 = load i32, ptr %15, align 4
  %22 = load i32, ptr %5, align 4
  %23 = icmp ult i32 %21, %22
  br i1 %23, label %24, label %32

24:                                               ; preds = %20
  %25 = load i32, ptr %14, align 4
  %26 = add i32 %25, 1
  store i32 %26, ptr %14, align 4
  %27 = load i32, ptr %14, align 4
  %28 = load i32, ptr %14, align 4
  %29 = mul i32 %27, %28
  %30 = mul i32 %29, 2
  %31 = mul i32 %30, 4
  store i32 %31, ptr %15, align 4
  br label %20, !llvm.loop !6

32:                                               ; preds = %20
  %33 = load i32, ptr %14, align 4
  %34 = sub i32 %33, 1
  store i32 %34, ptr %9, align 4
  %35 = load ptr, ptr %6, align 8
  %36 = ptrtoint ptr %35 to i64
  %37 = sub i64 %36, 1
  %38 = and i64 %37, -4
  %39 = add i64 4, %38
  %40 = inttoptr i64 %39 to ptr
  store ptr %40, ptr %10, align 8
  %41 = load ptr, ptr %10, align 8
  %42 = load i32, ptr %9, align 4
  %43 = load i32, ptr %9, align 4
  %44 = mul i32 %42, %43
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i16, ptr %41, i64 %45
  store ptr %46, ptr %11, align 8
  store i32 0, ptr %14, align 4
  br label %47

47:                                               ; preds = %102, %32
  %48 = load i32, ptr %14, align 4
  %49 = load i32, ptr %9, align 4
  %50 = icmp ult i32 %48, %49
  br i1 %50, label %51, label %105

51:                                               ; preds = %47
  store i32 0, ptr %15, align 4
  br label %52

52:                                               ; preds = %98, %51
  %53 = load i32, ptr %15, align 4
  %54 = load i32, ptr %9, align 4
  %55 = icmp ult i32 %53, %54
  br i1 %55, label %56, label %101

56:                                               ; preds = %52
  %57 = load i32, ptr %12, align 4
  %58 = load i32, ptr %7, align 4
  %59 = mul nsw i32 %57, %58
  %60 = srem i32 %59, 65536
  store i32 %60, ptr %7, align 4
  %61 = load i32, ptr %7, align 4
  %62 = load i32, ptr %12, align 4
  %63 = add nsw i32 %61, %62
  %64 = trunc i32 %63 to i16
  store i16 %64, ptr %13, align 2
  %65 = load i16, ptr %13, align 2
  %66 = sext i16 %65 to i32
  %67 = and i32 %66, 65535
  %68 = trunc i32 %67 to i16
  store i16 %68, ptr %13, align 2
  %69 = load i16, ptr %13, align 2
  %70 = load ptr, ptr %11, align 8
  %71 = load i32, ptr %14, align 4
  %72 = load i32, ptr %9, align 4
  %73 = mul i32 %71, %72
  %74 = load i32, ptr %15, align 4
  %75 = add i32 %73, %74
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i16, ptr %70, i64 %76
  store i16 %69, ptr %77, align 2
  %78 = load i16, ptr %13, align 2
  %79 = sext i16 %78 to i32
  %80 = load i32, ptr %12, align 4
  %81 = add nsw i32 %79, %80
  %82 = trunc i32 %81 to i16
  store i16 %82, ptr %13, align 2
  %83 = load i16, ptr %13, align 2
  %84 = sext i16 %83 to i32
  %85 = and i32 %84, 255
  %86 = trunc i32 %85 to i16
  store i16 %86, ptr %13, align 2
  %87 = load i16, ptr %13, align 2
  %88 = load ptr, ptr %10, align 8
  %89 = load i32, ptr %14, align 4
  %90 = load i32, ptr %9, align 4
  %91 = mul i32 %89, %90
  %92 = load i32, ptr %15, align 4
  %93 = add i32 %91, %92
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i16, ptr %88, i64 %94
  store i16 %87, ptr %95, align 2
  %96 = load i32, ptr %12, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %12, align 4
  br label %98

98:                                               ; preds = %56
  %99 = load i32, ptr %15, align 4
  %100 = add i32 %99, 1
  store i32 %100, ptr %15, align 4
  br label %52, !llvm.loop !8

101:                                              ; preds = %52
  br label %102

102:                                              ; preds = %101
  %103 = load i32, ptr %14, align 4
  %104 = add i32 %103, 1
  store i32 %104, ptr %14, align 4
  br label %47, !llvm.loop !9

105:                                              ; preds = %47
  %106 = load ptr, ptr %10, align 8
  %107 = load ptr, ptr %8, align 8
  %108 = getelementptr inbounds %struct.MAT_PARAMS_S, ptr %107, i32 0, i32 1
  store ptr %106, ptr %108, align 8
  %109 = load ptr, ptr %11, align 8
  %110 = load ptr, ptr %8, align 8
  %111 = getelementptr inbounds %struct.MAT_PARAMS_S, ptr %110, i32 0, i32 2
  store ptr %109, ptr %111, align 8
  %112 = load ptr, ptr %11, align 8
  %113 = load i32, ptr %9, align 4
  %114 = load i32, ptr %9, align 4
  %115 = mul i32 %113, %114
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds i16, ptr %112, i64 %116
  %118 = ptrtoint ptr %117 to i64
  %119 = sub i64 %118, 1
  %120 = and i64 %119, -4
  %121 = add i64 4, %120
  %122 = inttoptr i64 %121 to ptr
  %123 = load ptr, ptr %8, align 8
  %124 = getelementptr inbounds %struct.MAT_PARAMS_S, ptr %123, i32 0, i32 3
  store ptr %122, ptr %124, align 8
  %125 = load i32, ptr %9, align 4
  %126 = load ptr, ptr %8, align 8
  %127 = getelementptr inbounds %struct.MAT_PARAMS_S, ptr %126, i32 0, i32 0
  store i32 %125, ptr %127, align 8
  %128 = load i32, ptr %9, align 4
  ret i32 %128
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}

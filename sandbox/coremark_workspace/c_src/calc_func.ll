; ModuleID = 'calc_func.c'
source_filename = "calc_func.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.RESULTS_S = type { i16, i16, i16, [4 x ptr], i32, i32, i32, ptr, %struct.MAT_PARAMS_S, i16, i16, i16, i16, i16, %struct.CORE_PORTABLE_S }
%struct.MAT_PARAMS_S = type { i32, ptr, ptr, ptr }
%struct.CORE_PORTABLE_S = type { i8 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @calc_func(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i16, align 2
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i8, align 1
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = load i16, ptr %11, align 2
  store i16 %12, ptr %6, align 2
  %13 = load i16, ptr %6, align 2
  %14 = sext i16 %13 to i32
  %15 = ashr i32 %14, 7
  %16 = and i32 %15, 1
  %17 = trunc i32 %16 to i8
  store i8 %17, ptr %8, align 1
  %18 = load i8, ptr %8, align 1
  %19 = icmp ne i8 %18, 0
  br i1 %19, label %20, label %25

20:                                               ; preds = %2
  %21 = load i16, ptr %6, align 2
  %22 = sext i16 %21 to i32
  %23 = and i32 %22, 127
  %24 = trunc i32 %23 to i16
  store i16 %24, ptr %3, align 2
  br label %120

25:                                               ; preds = %2
  %26 = load i16, ptr %6, align 2
  %27 = sext i16 %26 to i32
  %28 = and i32 %27, 7
  %29 = trunc i32 %28 to i16
  store i16 %29, ptr %9, align 2
  %30 = load i16, ptr %6, align 2
  %31 = sext i16 %30 to i32
  %32 = ashr i32 %31, 3
  %33 = and i32 %32, 15
  %34 = trunc i32 %33 to i16
  store i16 %34, ptr %10, align 2
  %35 = load i16, ptr %10, align 2
  %36 = sext i16 %35 to i32
  %37 = shl i32 %36, 4
  %38 = load i16, ptr %10, align 2
  %39 = sext i16 %38 to i32
  %40 = or i32 %39, %37
  %41 = trunc i32 %40 to i16
  store i16 %41, ptr %10, align 2
  %42 = load i16, ptr %9, align 2
  %43 = sext i16 %42 to i32
  switch i32 %43, label %96 [
    i32 0, label %44
    i32 1, label %78
  ]

44:                                               ; preds = %25
  %45 = load i16, ptr %10, align 2
  %46 = sext i16 %45 to i32
  %47 = icmp slt i32 %46, 34
  br i1 %47, label %48, label %49

48:                                               ; preds = %44
  store i16 34, ptr %10, align 2
  br label %49

49:                                               ; preds = %48, %44
  %50 = load ptr, ptr %5, align 8
  %51 = getelementptr inbounds %struct.RESULTS_S, ptr %50, i32 0, i32 4
  %52 = load i32, ptr %51, align 8
  %53 = load ptr, ptr %5, align 8
  %54 = getelementptr inbounds %struct.RESULTS_S, ptr %53, i32 0, i32 3
  %55 = getelementptr inbounds [4 x ptr], ptr %54, i64 0, i64 3
  %56 = load ptr, ptr %55, align 8
  %57 = load ptr, ptr %5, align 8
  %58 = getelementptr inbounds %struct.RESULTS_S, ptr %57, i32 0, i32 0
  %59 = load i16, ptr %58, align 8
  %60 = load ptr, ptr %5, align 8
  %61 = getelementptr inbounds %struct.RESULTS_S, ptr %60, i32 0, i32 1
  %62 = load i16, ptr %61, align 2
  %63 = load i16, ptr %10, align 2
  %64 = load ptr, ptr %5, align 8
  %65 = getelementptr inbounds %struct.RESULTS_S, ptr %64, i32 0, i32 9
  %66 = load i16, ptr %65, align 8
  %67 = call zeroext i16 @core_bench_state(i32 noundef %52, ptr noundef %56, i16 noundef signext %59, i16 noundef signext %62, i16 noundef signext %63, i16 noundef zeroext %66)
  store i16 %67, ptr %7, align 2
  %68 = load ptr, ptr %5, align 8
  %69 = getelementptr inbounds %struct.RESULTS_S, ptr %68, i32 0, i32 12
  %70 = load i16, ptr %69, align 2
  %71 = zext i16 %70 to i32
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %77

73:                                               ; preds = %49
  %74 = load i16, ptr %7, align 2
  %75 = load ptr, ptr %5, align 8
  %76 = getelementptr inbounds %struct.RESULTS_S, ptr %75, i32 0, i32 12
  store i16 %74, ptr %76, align 2
  br label %77

77:                                               ; preds = %73, %49
  br label %98

78:                                               ; preds = %25
  %79 = load ptr, ptr %5, align 8
  %80 = getelementptr inbounds %struct.RESULTS_S, ptr %79, i32 0, i32 8
  %81 = load i16, ptr %10, align 2
  %82 = load ptr, ptr %5, align 8
  %83 = getelementptr inbounds %struct.RESULTS_S, ptr %82, i32 0, i32 9
  %84 = load i16, ptr %83, align 8
  %85 = call zeroext i16 @core_bench_matrix(ptr noundef %80, i16 noundef signext %81, i16 noundef zeroext %84)
  store i16 %85, ptr %7, align 2
  %86 = load ptr, ptr %5, align 8
  %87 = getelementptr inbounds %struct.RESULTS_S, ptr %86, i32 0, i32 11
  %88 = load i16, ptr %87, align 4
  %89 = zext i16 %88 to i32
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %91, label %95

91:                                               ; preds = %78
  %92 = load i16, ptr %7, align 2
  %93 = load ptr, ptr %5, align 8
  %94 = getelementptr inbounds %struct.RESULTS_S, ptr %93, i32 0, i32 11
  store i16 %92, ptr %94, align 4
  br label %95

95:                                               ; preds = %91, %78
  br label %98

96:                                               ; preds = %25
  %97 = load i16, ptr %6, align 2
  store i16 %97, ptr %7, align 2
  br label %98

98:                                               ; preds = %96, %95, %77
  %99 = load i16, ptr %7, align 2
  %100 = load ptr, ptr %5, align 8
  %101 = getelementptr inbounds %struct.RESULTS_S, ptr %100, i32 0, i32 9
  %102 = load i16, ptr %101, align 8
  %103 = call zeroext i16 @crcu16(i16 noundef zeroext %99, i16 noundef zeroext %102)
  %104 = load ptr, ptr %5, align 8
  %105 = getelementptr inbounds %struct.RESULTS_S, ptr %104, i32 0, i32 9
  store i16 %103, ptr %105, align 8
  %106 = load i16, ptr %7, align 2
  %107 = sext i16 %106 to i32
  %108 = and i32 %107, 127
  %109 = trunc i32 %108 to i16
  store i16 %109, ptr %7, align 2
  %110 = load i16, ptr %6, align 2
  %111 = sext i16 %110 to i32
  %112 = and i32 %111, 65280
  %113 = or i32 %112, 128
  %114 = load i16, ptr %7, align 2
  %115 = sext i16 %114 to i32
  %116 = or i32 %113, %115
  %117 = trunc i32 %116 to i16
  %118 = load ptr, ptr %4, align 8
  store i16 %117, ptr %118, align 2
  %119 = load i16, ptr %7, align 2
  store i16 %119, ptr %3, align 2
  br label %120

120:                                              ; preds = %98, %20
  %121 = load i16, ptr %3, align 2
  ret i16 %121
}

declare zeroext i16 @core_bench_state(i32 noundef, ptr noundef, i16 noundef signext, i16 noundef signext, i16 noundef signext, i16 noundef zeroext) #1

declare zeroext i16 @core_bench_matrix(ptr noundef, i16 noundef signext, i16 noundef zeroext) #1

declare zeroext i16 @crcu16(i16 noundef zeroext, i16 noundef zeroext) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}

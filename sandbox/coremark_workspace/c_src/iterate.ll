; ModuleID = 'iterate.c'
source_filename = "iterate.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.RESULTS_S = type { i16, i16, i16, [4 x ptr], i32, i32, i32, ptr, %struct.MAT_PARAMS_S, i16, i16, i16, i16, i16, %struct.CORE_PORTABLE_S }
%struct.MAT_PARAMS_S = type { i32, ptr, ptr, ptr }
%struct.CORE_PORTABLE_S = type { i8 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @iterate(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i16, align 2
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.RESULTS_S, ptr %8, i32 0, i32 5
  %10 = load i32, ptr %9, align 4
  store i32 %10, ptr %6, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.RESULTS_S, ptr %11, i32 0, i32 9
  store i16 0, ptr %12, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.RESULTS_S, ptr %13, i32 0, i32 10
  store i16 0, ptr %14, align 2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.RESULTS_S, ptr %15, i32 0, i32 11
  store i16 0, ptr %16, align 4
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.RESULTS_S, ptr %17, i32 0, i32 12
  store i16 0, ptr %18, align 2
  store i32 0, ptr %3, align 4
  br label %19

19:                                               ; preds = %51, %1
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %6, align 4
  %22 = icmp ult i32 %20, %21
  br i1 %22, label %23, label %54

23:                                               ; preds = %19
  %24 = load ptr, ptr %5, align 8
  %25 = call zeroext i16 @core_bench_list(ptr noundef %24, i16 noundef signext 1)
  store i16 %25, ptr %4, align 2
  %26 = load i16, ptr %4, align 2
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds %struct.RESULTS_S, ptr %27, i32 0, i32 9
  %29 = load i16, ptr %28, align 8
  %30 = call zeroext i16 @crcu16(i16 noundef zeroext %26, i16 noundef zeroext %29)
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds %struct.RESULTS_S, ptr %31, i32 0, i32 9
  store i16 %30, ptr %32, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = call zeroext i16 @core_bench_list(ptr noundef %33, i16 noundef signext -1)
  store i16 %34, ptr %4, align 2
  %35 = load i16, ptr %4, align 2
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds %struct.RESULTS_S, ptr %36, i32 0, i32 9
  %38 = load i16, ptr %37, align 8
  %39 = call zeroext i16 @crcu16(i16 noundef zeroext %35, i16 noundef zeroext %38)
  %40 = load ptr, ptr %5, align 8
  %41 = getelementptr inbounds %struct.RESULTS_S, ptr %40, i32 0, i32 9
  store i16 %39, ptr %41, align 8
  %42 = load i32, ptr %3, align 4
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %50

44:                                               ; preds = %23
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds %struct.RESULTS_S, ptr %45, i32 0, i32 9
  %47 = load i16, ptr %46, align 8
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds %struct.RESULTS_S, ptr %48, i32 0, i32 10
  store i16 %47, ptr %49, align 2
  br label %50

50:                                               ; preds = %44, %23
  br label %51

51:                                               ; preds = %50
  %52 = load i32, ptr %3, align 4
  %53 = add i32 %52, 1
  store i32 %53, ptr %3, align 4
  br label %19, !llvm.loop !6

54:                                               ; preds = %19
  ret ptr null
}

declare zeroext i16 @core_bench_list(ptr noundef, i16 noundef signext) #1

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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}

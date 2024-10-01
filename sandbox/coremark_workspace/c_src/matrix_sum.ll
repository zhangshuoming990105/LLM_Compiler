; ModuleID = 'matrix_sum.c'
source_filename = "matrix_sum.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @matrix_sum(i32 noundef %0, ptr noundef %1, i16 noundef signext %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i16, align 2
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i16, align 2
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i16 %2, ptr %6, align 2
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  store i16 0, ptr %10, align 2
  store i32 0, ptr %11, align 4
  br label %13

13:                                               ; preds = %60, %3
  %14 = load i32, ptr %11, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp ult i32 %14, %15
  br i1 %16, label %17, label %63

17:                                               ; preds = %13
  store i32 0, ptr %12, align 4
  br label %18

18:                                               ; preds = %56, %17
  %19 = load i32, ptr %12, align 4
  %20 = load i32, ptr %4, align 4
  %21 = icmp ult i32 %19, %20
  br i1 %21, label %22, label %59

22:                                               ; preds = %18
  %23 = load ptr, ptr %5, align 8
  %24 = load i32, ptr %11, align 4
  %25 = load i32, ptr %4, align 4
  %26 = mul i32 %24, %25
  %27 = load i32, ptr %12, align 4
  %28 = add i32 %26, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %23, i64 %29
  %31 = load i32, ptr %30, align 4
  store i32 %31, ptr %9, align 4
  %32 = load i32, ptr %9, align 4
  %33 = load i32, ptr %7, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, ptr %7, align 4
  %35 = load i32, ptr %7, align 4
  %36 = load i16, ptr %6, align 2
  %37 = sext i16 %36 to i32
  %38 = icmp sgt i32 %35, %37
  br i1 %38, label %39, label %44

39:                                               ; preds = %22
  %40 = load i16, ptr %10, align 2
  %41 = sext i16 %40 to i32
  %42 = add nsw i32 %41, 10
  %43 = trunc i32 %42 to i16
  store i16 %43, ptr %10, align 2
  store i32 0, ptr %7, align 4
  br label %54

44:                                               ; preds = %22
  %45 = load i32, ptr %9, align 4
  %46 = load i32, ptr %8, align 4
  %47 = icmp sgt i32 %45, %46
  %48 = zext i1 %47 to i64
  %49 = select i1 %47, i32 1, i32 0
  %50 = load i16, ptr %10, align 2
  %51 = sext i16 %50 to i32
  %52 = add nsw i32 %51, %49
  %53 = trunc i32 %52 to i16
  store i16 %53, ptr %10, align 2
  br label %54

54:                                               ; preds = %44, %39
  %55 = load i32, ptr %9, align 4
  store i32 %55, ptr %8, align 4
  br label %56

56:                                               ; preds = %54
  %57 = load i32, ptr %12, align 4
  %58 = add i32 %57, 1
  store i32 %58, ptr %12, align 4
  br label %18, !llvm.loop !6

59:                                               ; preds = %18
  br label %60

60:                                               ; preds = %59
  %61 = load i32, ptr %11, align 4
  %62 = add i32 %61, 1
  store i32 %62, ptr %11, align 4
  br label %13, !llvm.loop !8

63:                                               ; preds = %13
  %64 = load i16, ptr %10, align 2
  ret i16 %64
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

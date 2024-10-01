; ModuleID = 'matrix_mul_matrix_bitextract.c'
source_filename = "matrix_mul_matrix_bitextract.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @matrix_mul_matrix_bitextract(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %13

13:                                               ; preds = %82, %4
  %14 = load i32, ptr %9, align 4
  %15 = load i32, ptr %5, align 4
  %16 = icmp ult i32 %14, %15
  br i1 %16, label %17, label %85

17:                                               ; preds = %13
  store i32 0, ptr %10, align 4
  br label %18

18:                                               ; preds = %78, %17
  %19 = load i32, ptr %10, align 4
  %20 = load i32, ptr %5, align 4
  %21 = icmp ult i32 %19, %20
  br i1 %21, label %22, label %81

22:                                               ; preds = %18
  %23 = load ptr, ptr %6, align 8
  %24 = load i32, ptr %9, align 4
  %25 = load i32, ptr %5, align 4
  %26 = mul i32 %24, %25
  %27 = load i32, ptr %10, align 4
  %28 = add i32 %26, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %23, i64 %29
  store i32 0, ptr %30, align 4
  store i32 0, ptr %11, align 4
  br label %31

31:                                               ; preds = %74, %22
  %32 = load i32, ptr %11, align 4
  %33 = load i32, ptr %5, align 4
  %34 = icmp ult i32 %32, %33
  br i1 %34, label %35, label %77

35:                                               ; preds = %31
  %36 = load ptr, ptr %7, align 8
  %37 = load i32, ptr %9, align 4
  %38 = load i32, ptr %5, align 4
  %39 = mul i32 %37, %38
  %40 = load i32, ptr %11, align 4
  %41 = add i32 %39, %40
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i16, ptr %36, i64 %42
  %44 = load i16, ptr %43, align 2
  %45 = sext i16 %44 to i32
  %46 = load ptr, ptr %8, align 8
  %47 = load i32, ptr %11, align 4
  %48 = load i32, ptr %5, align 4
  %49 = mul i32 %47, %48
  %50 = load i32, ptr %10, align 4
  %51 = add i32 %49, %50
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i16, ptr %46, i64 %52
  %54 = load i16, ptr %53, align 2
  %55 = sext i16 %54 to i32
  %56 = mul nsw i32 %45, %55
  store i32 %56, ptr %12, align 4
  %57 = load i32, ptr %12, align 4
  %58 = ashr i32 %57, 2
  %59 = and i32 %58, 15
  %60 = load i32, ptr %12, align 4
  %61 = ashr i32 %60, 5
  %62 = and i32 %61, 127
  %63 = mul i32 %59, %62
  %64 = load ptr, ptr %6, align 8
  %65 = load i32, ptr %9, align 4
  %66 = load i32, ptr %5, align 4
  %67 = mul i32 %65, %66
  %68 = load i32, ptr %10, align 4
  %69 = add i32 %67, %68
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, ptr %64, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = add i32 %72, %63
  store i32 %73, ptr %71, align 4
  br label %74

74:                                               ; preds = %35
  %75 = load i32, ptr %11, align 4
  %76 = add i32 %75, 1
  store i32 %76, ptr %11, align 4
  br label %31, !llvm.loop !6

77:                                               ; preds = %31
  br label %78

78:                                               ; preds = %77
  %79 = load i32, ptr %10, align 4
  %80 = add i32 %79, 1
  store i32 %80, ptr %10, align 4
  br label %18, !llvm.loop !8

81:                                               ; preds = %18
  br label %82

82:                                               ; preds = %81
  %83 = load i32, ptr %9, align 4
  %84 = add i32 %83, 1
  store i32 %84, ptr %9, align 4
  br label %13, !llvm.loop !9

85:                                               ; preds = %13
  ret void
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

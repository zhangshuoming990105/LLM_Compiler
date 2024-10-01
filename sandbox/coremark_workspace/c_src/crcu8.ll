; ModuleID = 'crcu8.c'
source_filename = "crcu8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i16 @crcu8(i8 noundef zeroext %0, i16 noundef zeroext %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i16, align 2
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  store i8 %0, ptr %3, align 1
  store i16 %1, ptr %4, align 2
  store i8 0, ptr %5, align 1
  store i8 0, ptr %6, align 1
  store i8 0, ptr %7, align 1
  store i8 0, ptr %5, align 1
  br label %8

8:                                                ; preds = %53, %2
  %9 = load i8, ptr %5, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp slt i32 %10, 8
  br i1 %11, label %12, label %56

12:                                               ; preds = %8
  %13 = load i8, ptr %3, align 1
  %14 = zext i8 %13 to i32
  %15 = and i32 %14, 1
  %16 = load i16, ptr %4, align 2
  %17 = trunc i16 %16 to i8
  %18 = zext i8 %17 to i32
  %19 = and i32 %18, 1
  %20 = xor i32 %15, %19
  %21 = trunc i32 %20 to i8
  store i8 %21, ptr %6, align 1
  %22 = load i8, ptr %3, align 1
  %23 = zext i8 %22 to i32
  %24 = ashr i32 %23, 1
  %25 = trunc i32 %24 to i8
  store i8 %25, ptr %3, align 1
  %26 = load i8, ptr %6, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, 1
  br i1 %28, label %29, label %34

29:                                               ; preds = %12
  %30 = load i16, ptr %4, align 2
  %31 = zext i16 %30 to i32
  %32 = xor i32 %31, 16386
  %33 = trunc i32 %32 to i16
  store i16 %33, ptr %4, align 2
  store i8 1, ptr %7, align 1
  br label %35

34:                                               ; preds = %12
  store i8 0, ptr %7, align 1
  br label %35

35:                                               ; preds = %34, %29
  %36 = load i16, ptr %4, align 2
  %37 = zext i16 %36 to i32
  %38 = ashr i32 %37, 1
  %39 = trunc i32 %38 to i16
  store i16 %39, ptr %4, align 2
  %40 = load i8, ptr %7, align 1
  %41 = icmp ne i8 %40, 0
  br i1 %41, label %42, label %47

42:                                               ; preds = %35
  %43 = load i16, ptr %4, align 2
  %44 = zext i16 %43 to i32
  %45 = or i32 %44, 32768
  %46 = trunc i32 %45 to i16
  store i16 %46, ptr %4, align 2
  br label %52

47:                                               ; preds = %35
  %48 = load i16, ptr %4, align 2
  %49 = zext i16 %48 to i32
  %50 = and i32 %49, 32767
  %51 = trunc i32 %50 to i16
  store i16 %51, ptr %4, align 2
  br label %52

52:                                               ; preds = %47, %42
  br label %53

53:                                               ; preds = %52
  %54 = load i8, ptr %5, align 1
  %55 = add i8 %54, 1
  store i8 %55, ptr %5, align 1
  br label %8, !llvm.loop !6

56:                                               ; preds = %8
  %57 = load i16, ptr %4, align 2
  ret i16 %57
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

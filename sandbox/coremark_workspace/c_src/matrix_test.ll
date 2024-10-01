; ModuleID = 'matrix_test.c'
source_filename = "matrix_test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @matrix_test(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i16 noundef signext %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i16, align 2
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store i16 %4, ptr %10, align 2
  store i16 0, ptr %11, align 2
  %13 = load i16, ptr %10, align 2
  %14 = sext i16 %13 to i32
  %15 = or i32 61440, %14
  %16 = trunc i32 %15 to i16
  store i16 %16, ptr %12, align 2
  %17 = load i32, ptr %6, align 4
  %18 = load ptr, ptr %8, align 8
  %19 = load i16, ptr %10, align 2
  call void @matrix_add_const(i32 noundef %17, ptr noundef %18, i16 noundef signext %19)
  %20 = load i32, ptr %6, align 4
  %21 = load ptr, ptr %7, align 8
  %22 = load ptr, ptr %8, align 8
  %23 = load i16, ptr %10, align 2
  call void @matrix_mul_const(i32 noundef %20, ptr noundef %21, ptr noundef %22, i16 noundef signext %23)
  %24 = load i32, ptr %6, align 4
  %25 = load ptr, ptr %7, align 8
  %26 = load i16, ptr %12, align 2
  %27 = call signext i16 @matrix_sum(i32 noundef %24, ptr noundef %25, i16 noundef signext %26)
  %28 = load i16, ptr %11, align 2
  %29 = call zeroext i16 @crc16(i16 noundef signext %27, i16 noundef zeroext %28)
  store i16 %29, ptr %11, align 2
  %30 = load i32, ptr %6, align 4
  %31 = load ptr, ptr %7, align 8
  %32 = load ptr, ptr %8, align 8
  %33 = load ptr, ptr %9, align 8
  call void @matrix_mul_vect(i32 noundef %30, ptr noundef %31, ptr noundef %32, ptr noundef %33)
  %34 = load i32, ptr %6, align 4
  %35 = load ptr, ptr %7, align 8
  %36 = load i16, ptr %12, align 2
  %37 = call signext i16 @matrix_sum(i32 noundef %34, ptr noundef %35, i16 noundef signext %36)
  %38 = load i16, ptr %11, align 2
  %39 = call zeroext i16 @crc16(i16 noundef signext %37, i16 noundef zeroext %38)
  store i16 %39, ptr %11, align 2
  %40 = load i32, ptr %6, align 4
  %41 = load ptr, ptr %7, align 8
  %42 = load ptr, ptr %8, align 8
  %43 = load ptr, ptr %9, align 8
  call void @matrix_mul_matrix(i32 noundef %40, ptr noundef %41, ptr noundef %42, ptr noundef %43)
  %44 = load i32, ptr %6, align 4
  %45 = load ptr, ptr %7, align 8
  %46 = load i16, ptr %12, align 2
  %47 = call signext i16 @matrix_sum(i32 noundef %44, ptr noundef %45, i16 noundef signext %46)
  %48 = load i16, ptr %11, align 2
  %49 = call zeroext i16 @crc16(i16 noundef signext %47, i16 noundef zeroext %48)
  store i16 %49, ptr %11, align 2
  %50 = load i32, ptr %6, align 4
  %51 = load ptr, ptr %7, align 8
  %52 = load ptr, ptr %8, align 8
  %53 = load ptr, ptr %9, align 8
  call void @matrix_mul_matrix_bitextract(i32 noundef %50, ptr noundef %51, ptr noundef %52, ptr noundef %53)
  %54 = load i32, ptr %6, align 4
  %55 = load ptr, ptr %7, align 8
  %56 = load i16, ptr %12, align 2
  %57 = call signext i16 @matrix_sum(i32 noundef %54, ptr noundef %55, i16 noundef signext %56)
  %58 = load i16, ptr %11, align 2
  %59 = call zeroext i16 @crc16(i16 noundef signext %57, i16 noundef zeroext %58)
  store i16 %59, ptr %11, align 2
  %60 = load i32, ptr %6, align 4
  %61 = load ptr, ptr %8, align 8
  %62 = load i16, ptr %10, align 2
  %63 = sext i16 %62 to i32
  %64 = sub nsw i32 0, %63
  %65 = trunc i32 %64 to i16
  call void @matrix_add_const(i32 noundef %60, ptr noundef %61, i16 noundef signext %65)
  %66 = load i16, ptr %11, align 2
  ret i16 %66
}

declare void @matrix_add_const(i32 noundef, ptr noundef, i16 noundef signext) #1

declare void @matrix_mul_const(i32 noundef, ptr noundef, ptr noundef, i16 noundef signext) #1

declare zeroext i16 @crc16(i16 noundef signext, i16 noundef zeroext) #1

declare signext i16 @matrix_sum(i32 noundef, ptr noundef, i16 noundef signext) #1

declare void @matrix_mul_vect(i32 noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare void @matrix_mul_matrix(i32 noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare void @matrix_mul_matrix_bitextract(i32 noundef, ptr noundef, ptr noundef, ptr noundef) #1

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

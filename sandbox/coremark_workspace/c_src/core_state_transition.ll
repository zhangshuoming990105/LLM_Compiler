; ModuleID = 'core_state_transition.c'
source_filename = "core_state_transition.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @core_state_transition(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %5, align 8
  store i32 0, ptr %7, align 4
  br label %10

10:                                               ; preds = %177, %2
  %11 = load ptr, ptr %5, align 8
  %12 = load i8, ptr %11, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %18

15:                                               ; preds = %10
  %16 = load i32, ptr %7, align 4
  %17 = icmp ne i32 %16, 1
  br label %18

18:                                               ; preds = %15, %10
  %19 = phi i1 [ false, %10 ], [ %17, %15 ]
  br i1 %19, label %20, label %180

20:                                               ; preds = %18
  %21 = load ptr, ptr %5, align 8
  %22 = load i8, ptr %21, align 1
  store i8 %22, ptr %6, align 1
  %23 = load i8, ptr %6, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp eq i32 %24, 44
  br i1 %25, label %26, label %29

26:                                               ; preds = %20
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds i8, ptr %27, i32 1
  store ptr %28, ptr %5, align 8
  br label %180

29:                                               ; preds = %20
  %30 = load i32, ptr %7, align 4
  switch i32 %30, label %175 [
    i32 0, label %31
    i32 2, label %62
    i32 4, label %87
    i32 5, label %107
    i32 3, label %131
    i32 6, label %150
    i32 7, label %165
  ]

31:                                               ; preds = %29
  %32 = load i8, ptr %6, align 1
  %33 = call zeroext i8 @ee_isdigit(i8 noundef zeroext %32)
  %34 = icmp ne i8 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %31
  store i32 4, ptr %7, align 4
  br label %57

36:                                               ; preds = %31
  %37 = load i8, ptr %6, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp eq i32 %38, 43
  br i1 %39, label %44, label %40

40:                                               ; preds = %36
  %41 = load i8, ptr %6, align 1
  %42 = zext i8 %41 to i32
  %43 = icmp eq i32 %42, 45
  br i1 %43, label %44, label %45

44:                                               ; preds = %40, %36
  store i32 2, ptr %7, align 4
  br label %56

45:                                               ; preds = %40
  %46 = load i8, ptr %6, align 1
  %47 = zext i8 %46 to i32
  %48 = icmp eq i32 %47, 46
  br i1 %48, label %49, label %50

49:                                               ; preds = %45
  store i32 5, ptr %7, align 4
  br label %55

50:                                               ; preds = %45
  store i32 1, ptr %7, align 4
  %51 = load ptr, ptr %4, align 8
  %52 = getelementptr inbounds i32, ptr %51, i64 1
  %53 = load i32, ptr %52, align 4
  %54 = add i32 %53, 1
  store i32 %54, ptr %52, align 4
  br label %55

55:                                               ; preds = %50, %49
  br label %56

56:                                               ; preds = %55, %44
  br label %57

57:                                               ; preds = %56, %35
  %58 = load ptr, ptr %4, align 8
  %59 = getelementptr inbounds i32, ptr %58, i64 0
  %60 = load i32, ptr %59, align 4
  %61 = add i32 %60, 1
  store i32 %61, ptr %59, align 4
  br label %176

62:                                               ; preds = %29
  %63 = load i8, ptr %6, align 1
  %64 = call zeroext i8 @ee_isdigit(i8 noundef zeroext %63)
  %65 = icmp ne i8 %64, 0
  br i1 %65, label %66, label %71

66:                                               ; preds = %62
  store i32 4, ptr %7, align 4
  %67 = load ptr, ptr %4, align 8
  %68 = getelementptr inbounds i32, ptr %67, i64 2
  %69 = load i32, ptr %68, align 4
  %70 = add i32 %69, 1
  store i32 %70, ptr %68, align 4
  br label %86

71:                                               ; preds = %62
  %72 = load i8, ptr %6, align 1
  %73 = zext i8 %72 to i32
  %74 = icmp eq i32 %73, 46
  br i1 %74, label %75, label %80

75:                                               ; preds = %71
  store i32 5, ptr %7, align 4
  %76 = load ptr, ptr %4, align 8
  %77 = getelementptr inbounds i32, ptr %76, i64 2
  %78 = load i32, ptr %77, align 4
  %79 = add i32 %78, 1
  store i32 %79, ptr %77, align 4
  br label %85

80:                                               ; preds = %71
  store i32 1, ptr %7, align 4
  %81 = load ptr, ptr %4, align 8
  %82 = getelementptr inbounds i32, ptr %81, i64 2
  %83 = load i32, ptr %82, align 4
  %84 = add i32 %83, 1
  store i32 %84, ptr %82, align 4
  br label %85

85:                                               ; preds = %80, %75
  br label %86

86:                                               ; preds = %85, %66
  br label %176

87:                                               ; preds = %29
  %88 = load i8, ptr %6, align 1
  %89 = zext i8 %88 to i32
  %90 = icmp eq i32 %89, 46
  br i1 %90, label %91, label %96

91:                                               ; preds = %87
  store i32 5, ptr %7, align 4
  %92 = load ptr, ptr %4, align 8
  %93 = getelementptr inbounds i32, ptr %92, i64 4
  %94 = load i32, ptr %93, align 4
  %95 = add i32 %94, 1
  store i32 %95, ptr %93, align 4
  br label %106

96:                                               ; preds = %87
  %97 = load i8, ptr %6, align 1
  %98 = call zeroext i8 @ee_isdigit(i8 noundef zeroext %97)
  %99 = icmp ne i8 %98, 0
  br i1 %99, label %105, label %100

100:                                              ; preds = %96
  store i32 1, ptr %7, align 4
  %101 = load ptr, ptr %4, align 8
  %102 = getelementptr inbounds i32, ptr %101, i64 4
  %103 = load i32, ptr %102, align 4
  %104 = add i32 %103, 1
  store i32 %104, ptr %102, align 4
  br label %105

105:                                              ; preds = %100, %96
  br label %106

106:                                              ; preds = %105, %91
  br label %176

107:                                              ; preds = %29
  %108 = load i8, ptr %6, align 1
  %109 = zext i8 %108 to i32
  %110 = icmp eq i32 %109, 69
  br i1 %110, label %115, label %111

111:                                              ; preds = %107
  %112 = load i8, ptr %6, align 1
  %113 = zext i8 %112 to i32
  %114 = icmp eq i32 %113, 101
  br i1 %114, label %115, label %120

115:                                              ; preds = %111, %107
  store i32 3, ptr %7, align 4
  %116 = load ptr, ptr %4, align 8
  %117 = getelementptr inbounds i32, ptr %116, i64 5
  %118 = load i32, ptr %117, align 4
  %119 = add i32 %118, 1
  store i32 %119, ptr %117, align 4
  br label %130

120:                                              ; preds = %111
  %121 = load i8, ptr %6, align 1
  %122 = call zeroext i8 @ee_isdigit(i8 noundef zeroext %121)
  %123 = icmp ne i8 %122, 0
  br i1 %123, label %129, label %124

124:                                              ; preds = %120
  store i32 1, ptr %7, align 4
  %125 = load ptr, ptr %4, align 8
  %126 = getelementptr inbounds i32, ptr %125, i64 5
  %127 = load i32, ptr %126, align 4
  %128 = add i32 %127, 1
  store i32 %128, ptr %126, align 4
  br label %129

129:                                              ; preds = %124, %120
  br label %130

130:                                              ; preds = %129, %115
  br label %176

131:                                              ; preds = %29
  %132 = load i8, ptr %6, align 1
  %133 = zext i8 %132 to i32
  %134 = icmp eq i32 %133, 43
  br i1 %134, label %139, label %135

135:                                              ; preds = %131
  %136 = load i8, ptr %6, align 1
  %137 = zext i8 %136 to i32
  %138 = icmp eq i32 %137, 45
  br i1 %138, label %139, label %144

139:                                              ; preds = %135, %131
  store i32 6, ptr %7, align 4
  %140 = load ptr, ptr %4, align 8
  %141 = getelementptr inbounds i32, ptr %140, i64 3
  %142 = load i32, ptr %141, align 4
  %143 = add i32 %142, 1
  store i32 %143, ptr %141, align 4
  br label %149

144:                                              ; preds = %135
  store i32 1, ptr %7, align 4
  %145 = load ptr, ptr %4, align 8
  %146 = getelementptr inbounds i32, ptr %145, i64 3
  %147 = load i32, ptr %146, align 4
  %148 = add i32 %147, 1
  store i32 %148, ptr %146, align 4
  br label %149

149:                                              ; preds = %144, %139
  br label %176

150:                                              ; preds = %29
  %151 = load i8, ptr %6, align 1
  %152 = call zeroext i8 @ee_isdigit(i8 noundef zeroext %151)
  %153 = icmp ne i8 %152, 0
  br i1 %153, label %154, label %159

154:                                              ; preds = %150
  store i32 7, ptr %7, align 4
  %155 = load ptr, ptr %4, align 8
  %156 = getelementptr inbounds i32, ptr %155, i64 6
  %157 = load i32, ptr %156, align 4
  %158 = add i32 %157, 1
  store i32 %158, ptr %156, align 4
  br label %164

159:                                              ; preds = %150
  store i32 1, ptr %7, align 4
  %160 = load ptr, ptr %4, align 8
  %161 = getelementptr inbounds i32, ptr %160, i64 6
  %162 = load i32, ptr %161, align 4
  %163 = add i32 %162, 1
  store i32 %163, ptr %161, align 4
  br label %164

164:                                              ; preds = %159, %154
  br label %176

165:                                              ; preds = %29
  %166 = load i8, ptr %6, align 1
  %167 = call zeroext i8 @ee_isdigit(i8 noundef zeroext %166)
  %168 = icmp ne i8 %167, 0
  br i1 %168, label %174, label %169

169:                                              ; preds = %165
  store i32 1, ptr %7, align 4
  %170 = load ptr, ptr %4, align 8
  %171 = getelementptr inbounds i32, ptr %170, i64 1
  %172 = load i32, ptr %171, align 4
  %173 = add i32 %172, 1
  store i32 %173, ptr %171, align 4
  br label %174

174:                                              ; preds = %169, %165
  br label %176

175:                                              ; preds = %29
  br label %176

176:                                              ; preds = %175, %174, %164, %149, %130, %106, %86, %57
  br label %177

177:                                              ; preds = %176
  %178 = load ptr, ptr %5, align 8
  %179 = getelementptr inbounds i8, ptr %178, i32 1
  store ptr %179, ptr %5, align 8
  br label %10, !llvm.loop !6

180:                                              ; preds = %26, %18
  %181 = load ptr, ptr %5, align 8
  %182 = load ptr, ptr %3, align 8
  store ptr %181, ptr %182, align 8
  %183 = load i32, ptr %7, align 4
  ret i32 %183
}

declare zeroext i8 @ee_isdigit(i8 noundef zeroext) #1

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

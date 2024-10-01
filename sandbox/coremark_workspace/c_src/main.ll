; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timespec = type { i64, i64 }
%struct.RESULTS_S = type { i16, i16, i16, [4 x ptr], i32, i32, i32, ptr, %struct.MAT_PARAMS_S, i16, i16, i16, i16, i16, %struct.CORE_PORTABLE_S }
%struct.MAT_PARAMS_S = type { i32, ptr, ptr, ptr }
%struct.CORE_PORTABLE_S = type { i8 }

@.str = private unnamed_addr constant [45 x i8] c"2K performance run parameters for coremark.\0A\00", align 1
@list_known_crc = internal global [5 x i16] [i16 -11088, i16 13120, i16 27257, i16 -6380, i16 -7231], align 2
@.str.1 = private unnamed_addr constant [47 x i8] c"[%u]ERROR! list crc 0x%04x - should be 0x%04x\0A\00", align 1
@matrix_known_crc = internal global [5 x i16] [i16 -16814, i16 4505, i16 22024, i16 8151, i16 1863], align 2
@.str.2 = private unnamed_addr constant [49 x i8] c"[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\0A\00", align 1
@state_known_crc = internal global [5 x i16] [i16 24135, i16 14783, i16 -6748, i16 -29126, i16 -29308], align 2
@.str.3 = private unnamed_addr constant [48 x i8] c"[%u]ERROR! state crc 0x%04x - should be 0x%04x\0A\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"CoreMark Size    : %lu\0A\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"Total ticks      : %lu\0A\00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"Total time (secs): %f\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"Iterations/Sec   : %f\0A\00", align 1
@.str.8 = private unnamed_addr constant [62 x i8] c"ERROR! Must execute for at least 10 secs for a valid result!\0A\00", align 1
@.str.9 = private unnamed_addr constant [24 x i8] c"Iterations       : %lu\0A\00", align 1
@.str.10 = private unnamed_addr constant [29 x i8] c"Compiler version : AICC 1.0\0A\00", align 1
@.str.11 = private unnamed_addr constant [27 x i8] c"seedcrc          : 0x%04x\0A\00", align 1
@.str.12 = private unnamed_addr constant [28 x i8] c"[%d]crclist       : 0x%04x\0A\00", align 1
@.str.13 = private unnamed_addr constant [28 x i8] c"[%d]crcmatrix     : 0x%04x\0A\00", align 1
@.str.14 = private unnamed_addr constant [28 x i8] c"[%d]crcstate      : 0x%04x\0A\00", align 1
@.str.15 = private unnamed_addr constant [28 x i8] c"[%d]crcfinal      : 0x%04x\0A\00", align 1
@.str.16 = private unnamed_addr constant [73 x i8] c"Correct operation validated. See README.md for run and reporting rules.\0A\00", align 1
@.str.17 = private unnamed_addr constant [45 x i8] c"Function Level CoreMark 1.0 : %f by AICC 1.0\00", align 1
@.str.18 = private unnamed_addr constant [8 x i8] c" / Heap\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.20 = private unnamed_addr constant [17 x i8] c"Errors detected\0A\00", align 1
@.str.21 = private unnamed_addr constant [99 x i8] c"Cannot validate operation for these seed values, please compare with results on a known platform.\0A\00", align 1
@start_time_val = dso_local global %struct.timespec zeroinitializer, align 8
@stop_time_val = dso_local global %struct.timespec zeroinitializer, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i16, align 2
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i64, align 8
  %9 = alloca [1 x %struct.RESULTS_S], align 16
  %10 = alloca i32, align 4
  %11 = alloca double, align 8
  %12 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i16 0, ptr %3, align 2
  store i16 3, ptr %4, align 2
  store i16 -1, ptr %5, align 2
  store i16 0, ptr %6, align 2
  store i16 0, ptr %7, align 2
  %13 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %14 = getelementptr inbounds %struct.RESULTS_S, ptr %13, i32 0, i32 14
  call void @portable_init(ptr noundef %14)
  %15 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %16 = getelementptr inbounds %struct.RESULTS_S, ptr %15, i32 0, i32 0
  store i16 0, ptr %16, align 16
  %17 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %18 = getelementptr inbounds %struct.RESULTS_S, ptr %17, i32 0, i32 1
  store i16 0, ptr %18, align 2
  %19 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %20 = getelementptr inbounds %struct.RESULTS_S, ptr %19, i32 0, i32 2
  store i16 102, ptr %20, align 4
  %21 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %22 = getelementptr inbounds %struct.RESULTS_S, ptr %21, i32 0, i32 5
  store i32 0, ptr %22, align 4
  %23 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %24 = getelementptr inbounds %struct.RESULTS_S, ptr %23, i32 0, i32 6
  store i32 7, ptr %24, align 16
  %25 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %26 = getelementptr inbounds %struct.RESULTS_S, ptr %25, i32 0, i32 4
  store i32 2000, ptr %26, align 8
  %27 = load i16, ptr %2, align 2
  %28 = zext i16 %27 to i64
  %29 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.RESULTS_S, ptr %29, i32 0, i32 4
  %31 = load i32, ptr %30, align 8
  %32 = zext i32 %31 to i64
  %33 = call ptr @portable_malloc(i64 noundef %32)
  %34 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %35 = getelementptr inbounds %struct.RESULTS_S, ptr %34, i32 0, i32 3
  %36 = getelementptr inbounds [4 x ptr], ptr %35, i64 0, i64 0
  store ptr %33, ptr %36, align 8
  %37 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %38 = getelementptr inbounds %struct.RESULTS_S, ptr %37, i32 0, i32 13
  store i16 0, ptr %38, align 8
  %39 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %40 = getelementptr inbounds %struct.RESULTS_S, ptr %39, i32 0, i32 4
  %41 = load i32, ptr %40, align 8
  %42 = load i16, ptr %4, align 2
  %43 = zext i16 %42 to i32
  %44 = udiv i32 %41, %43
  %45 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %46 = getelementptr inbounds %struct.RESULTS_S, ptr %45, i32 0, i32 4
  store i32 %44, ptr %46, align 8
  store i16 0, ptr %2, align 2
  br label %47

47:                                               ; preds = %85, %0
  %48 = load i16, ptr %2, align 2
  %49 = zext i16 %48 to i32
  %50 = icmp slt i32 %49, 3
  br i1 %50, label %51, label %88

51:                                               ; preds = %47
  store i32 0, ptr %10, align 4
  br label %52

52:                                               ; preds = %79, %51
  %53 = load i32, ptr %10, align 4
  %54 = icmp ult i32 %53, 1
  br i1 %54, label %55, label %82

55:                                               ; preds = %52
  %56 = load i32, ptr %10, align 4
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %57
  %59 = getelementptr inbounds %struct.RESULTS_S, ptr %58, i32 0, i32 3
  %60 = getelementptr inbounds [4 x ptr], ptr %59, i64 0, i64 0
  %61 = load ptr, ptr %60, align 8
  %62 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %63 = getelementptr inbounds %struct.RESULTS_S, ptr %62, i32 0, i32 4
  %64 = load i32, ptr %63, align 8
  %65 = load i16, ptr %3, align 2
  %66 = zext i16 %65 to i32
  %67 = mul i32 %64, %66
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i8, ptr %61, i64 %68
  %70 = load i32, ptr %10, align 4
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %71
  %73 = getelementptr inbounds %struct.RESULTS_S, ptr %72, i32 0, i32 3
  %74 = load i16, ptr %2, align 2
  %75 = zext i16 %74 to i32
  %76 = add nsw i32 %75, 1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [4 x ptr], ptr %73, i64 0, i64 %77
  store ptr %69, ptr %78, align 8
  br label %79

79:                                               ; preds = %55
  %80 = load i32, ptr %10, align 4
  %81 = add i32 %80, 1
  store i32 %81, ptr %10, align 4
  br label %52, !llvm.loop !6

82:                                               ; preds = %52
  %83 = load i16, ptr %3, align 2
  %84 = add i16 %83, 1
  store i16 %84, ptr %3, align 2
  br label %85

85:                                               ; preds = %82
  %86 = load i16, ptr %2, align 2
  %87 = add i16 %86, 1
  store i16 %87, ptr %2, align 2
  br label %47, !llvm.loop !8

88:                                               ; preds = %47
  %89 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %90 = getelementptr inbounds %struct.RESULTS_S, ptr %89, i32 0, i32 4
  %91 = load i32, ptr %90, align 8
  %92 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %93 = getelementptr inbounds %struct.RESULTS_S, ptr %92, i32 0, i32 3
  %94 = getelementptr inbounds [4 x ptr], ptr %93, i64 0, i64 1
  %95 = load ptr, ptr %94, align 8
  %96 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %97 = getelementptr inbounds %struct.RESULTS_S, ptr %96, i32 0, i32 0
  %98 = load i16, ptr %97, align 16
  %99 = call ptr @core_list_init(i32 noundef %91, ptr noundef %95, i16 noundef signext %98)
  %100 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %101 = getelementptr inbounds %struct.RESULTS_S, ptr %100, i32 0, i32 7
  store ptr %99, ptr %101, align 8
  %102 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %103 = getelementptr inbounds %struct.RESULTS_S, ptr %102, i32 0, i32 4
  %104 = load i32, ptr %103, align 8
  %105 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %106 = getelementptr inbounds %struct.RESULTS_S, ptr %105, i32 0, i32 3
  %107 = getelementptr inbounds [4 x ptr], ptr %106, i64 0, i64 2
  %108 = load ptr, ptr %107, align 8
  %109 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %110 = getelementptr inbounds %struct.RESULTS_S, ptr %109, i32 0, i32 0
  %111 = load i16, ptr %110, align 16
  %112 = sext i16 %111 to i32
  %113 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %114 = getelementptr inbounds %struct.RESULTS_S, ptr %113, i32 0, i32 1
  %115 = load i16, ptr %114, align 2
  %116 = sext i16 %115 to i32
  %117 = shl i32 %116, 16
  %118 = or i32 %112, %117
  %119 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %120 = getelementptr inbounds %struct.RESULTS_S, ptr %119, i32 0, i32 8
  %121 = call i32 @core_init_matrix(i32 noundef %104, ptr noundef %108, i32 noundef %118, ptr noundef %120)
  %122 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %123 = getelementptr inbounds %struct.RESULTS_S, ptr %122, i32 0, i32 4
  %124 = load i32, ptr %123, align 8
  %125 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %126 = getelementptr inbounds %struct.RESULTS_S, ptr %125, i32 0, i32 0
  %127 = load i16, ptr %126, align 16
  %128 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %129 = getelementptr inbounds %struct.RESULTS_S, ptr %128, i32 0, i32 3
  %130 = getelementptr inbounds [4 x ptr], ptr %129, i64 0, i64 3
  %131 = load ptr, ptr %130, align 8
  call void @core_init_state(i32 noundef %124, i16 noundef signext %127, ptr noundef %131)
  %132 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %133 = getelementptr inbounds %struct.RESULTS_S, ptr %132, i32 0, i32 5
  %134 = load i32, ptr %133, align 4
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %136, label %165

136:                                              ; preds = %88
  store double 0.000000e+00, ptr %11, align 8
  %137 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %138 = getelementptr inbounds %struct.RESULTS_S, ptr %137, i32 0, i32 5
  store i32 1, ptr %138, align 4
  br label %139

139:                                              ; preds = %142, %136
  %140 = load double, ptr %11, align 8
  %141 = fcmp olt double %140, 1.000000e+00
  br i1 %141, label %142, label %151

142:                                              ; preds = %139
  %143 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %144 = getelementptr inbounds %struct.RESULTS_S, ptr %143, i32 0, i32 5
  %145 = load i32, ptr %144, align 4
  %146 = mul i32 %145, 10
  store i32 %146, ptr %144, align 4
  call void @start_time()
  %147 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %148 = call ptr @iterate(ptr noundef %147)
  call void @stop_time()
  %149 = call i64 @get_time()
  %150 = call double @time_in_secs(i64 noundef %149)
  store double %150, ptr %11, align 8
  br label %139, !llvm.loop !9

151:                                              ; preds = %139
  %152 = load double, ptr %11, align 8
  %153 = fptoui double %152 to i32
  store i32 %153, ptr %12, align 4
  %154 = load i32, ptr %12, align 4
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %156, label %157

156:                                              ; preds = %151
  store i32 1, ptr %12, align 4
  br label %157

157:                                              ; preds = %156, %151
  %158 = load i32, ptr %12, align 4
  %159 = udiv i32 10, %158
  %160 = add i32 1, %159
  %161 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %162 = getelementptr inbounds %struct.RESULTS_S, ptr %161, i32 0, i32 5
  %163 = load i32, ptr %162, align 4
  %164 = mul i32 %163, %160
  store i32 %164, ptr %162, align 4
  br label %165

165:                                              ; preds = %157, %88
  call void @start_time()
  %166 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %167 = call ptr @iterate(ptr noundef %166)
  call void @stop_time()
  %168 = call i64 @get_time()
  store i64 %168, ptr %8, align 8
  %169 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %170 = getelementptr inbounds %struct.RESULTS_S, ptr %169, i32 0, i32 0
  %171 = load i16, ptr %170, align 16
  %172 = load i16, ptr %7, align 2
  %173 = call zeroext i16 @crc16(i16 noundef signext %171, i16 noundef zeroext %172)
  store i16 %173, ptr %7, align 2
  %174 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %175 = getelementptr inbounds %struct.RESULTS_S, ptr %174, i32 0, i32 1
  %176 = load i16, ptr %175, align 2
  %177 = load i16, ptr %7, align 2
  %178 = call zeroext i16 @crc16(i16 noundef signext %176, i16 noundef zeroext %177)
  store i16 %178, ptr %7, align 2
  %179 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %180 = getelementptr inbounds %struct.RESULTS_S, ptr %179, i32 0, i32 2
  %181 = load i16, ptr %180, align 4
  %182 = load i16, ptr %7, align 2
  %183 = call zeroext i16 @crc16(i16 noundef signext %181, i16 noundef zeroext %182)
  store i16 %183, ptr %7, align 2
  %184 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %185 = getelementptr inbounds %struct.RESULTS_S, ptr %184, i32 0, i32 4
  %186 = load i32, ptr %185, align 8
  %187 = trunc i32 %186 to i16
  %188 = load i16, ptr %7, align 2
  %189 = call zeroext i16 @crc16(i16 noundef signext %187, i16 noundef zeroext %188)
  store i16 %189, ptr %7, align 2
  %190 = load i16, ptr %7, align 2
  %191 = zext i16 %190 to i32
  switch i32 %191, label %194 [
    i32 59893, label %192
  ]

192:                                              ; preds = %165
  store i16 3, ptr %5, align 2
  %193 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %195

194:                                              ; preds = %165
  store i16 -1, ptr %6, align 2
  br label %195

195:                                              ; preds = %194, %192
  %196 = load i16, ptr %5, align 2
  %197 = sext i16 %196 to i32
  %198 = icmp sge i32 %197, 0
  br i1 %198, label %199, label %340

199:                                              ; preds = %195
  %200 = load i16, ptr %2, align 2
  %201 = zext i16 %200 to i64
  %202 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %201
  %203 = getelementptr inbounds %struct.RESULTS_S, ptr %202, i32 0, i32 13
  store i16 0, ptr %203, align 8
  %204 = load i16, ptr %2, align 2
  %205 = zext i16 %204 to i64
  %206 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %205
  %207 = getelementptr inbounds %struct.RESULTS_S, ptr %206, i32 0, i32 6
  %208 = load i32, ptr %207, align 16
  %209 = and i32 %208, 1
  %210 = icmp ne i32 %209, 0
  br i1 %210, label %211, label %245

211:                                              ; preds = %199
  %212 = load i16, ptr %2, align 2
  %213 = zext i16 %212 to i64
  %214 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %213
  %215 = getelementptr inbounds %struct.RESULTS_S, ptr %214, i32 0, i32 10
  %216 = load i16, ptr %215, align 2
  %217 = zext i16 %216 to i32
  %218 = load i16, ptr %5, align 2
  %219 = sext i16 %218 to i64
  %220 = getelementptr inbounds [5 x i16], ptr @list_known_crc, i64 0, i64 %219
  %221 = load i16, ptr %220, align 2
  %222 = zext i16 %221 to i32
  %223 = icmp ne i32 %217, %222
  br i1 %223, label %224, label %245

224:                                              ; preds = %211
  %225 = load i16, ptr %2, align 2
  %226 = zext i16 %225 to i32
  %227 = load i16, ptr %2, align 2
  %228 = zext i16 %227 to i64
  %229 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %228
  %230 = getelementptr inbounds %struct.RESULTS_S, ptr %229, i32 0, i32 10
  %231 = load i16, ptr %230, align 2
  %232 = zext i16 %231 to i32
  %233 = load i16, ptr %5, align 2
  %234 = sext i16 %233 to i64
  %235 = getelementptr inbounds [5 x i16], ptr @list_known_crc, i64 0, i64 %234
  %236 = load i16, ptr %235, align 2
  %237 = zext i16 %236 to i32
  %238 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %226, i32 noundef %232, i32 noundef %237)
  %239 = load i16, ptr %2, align 2
  %240 = zext i16 %239 to i64
  %241 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %240
  %242 = getelementptr inbounds %struct.RESULTS_S, ptr %241, i32 0, i32 13
  %243 = load i16, ptr %242, align 8
  %244 = add i16 %243, 1
  store i16 %244, ptr %242, align 8
  br label %245

245:                                              ; preds = %224, %211, %199
  %246 = load i16, ptr %2, align 2
  %247 = zext i16 %246 to i64
  %248 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %247
  %249 = getelementptr inbounds %struct.RESULTS_S, ptr %248, i32 0, i32 6
  %250 = load i32, ptr %249, align 16
  %251 = and i32 %250, 2
  %252 = icmp ne i32 %251, 0
  br i1 %252, label %253, label %287

253:                                              ; preds = %245
  %254 = load i16, ptr %2, align 2
  %255 = zext i16 %254 to i64
  %256 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %255
  %257 = getelementptr inbounds %struct.RESULTS_S, ptr %256, i32 0, i32 11
  %258 = load i16, ptr %257, align 4
  %259 = zext i16 %258 to i32
  %260 = load i16, ptr %5, align 2
  %261 = sext i16 %260 to i64
  %262 = getelementptr inbounds [5 x i16], ptr @matrix_known_crc, i64 0, i64 %261
  %263 = load i16, ptr %262, align 2
  %264 = zext i16 %263 to i32
  %265 = icmp ne i32 %259, %264
  br i1 %265, label %266, label %287

266:                                              ; preds = %253
  %267 = load i16, ptr %2, align 2
  %268 = zext i16 %267 to i32
  %269 = load i16, ptr %2, align 2
  %270 = zext i16 %269 to i64
  %271 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %270
  %272 = getelementptr inbounds %struct.RESULTS_S, ptr %271, i32 0, i32 11
  %273 = load i16, ptr %272, align 4
  %274 = zext i16 %273 to i32
  %275 = load i16, ptr %5, align 2
  %276 = sext i16 %275 to i64
  %277 = getelementptr inbounds [5 x i16], ptr @matrix_known_crc, i64 0, i64 %276
  %278 = load i16, ptr %277, align 2
  %279 = zext i16 %278 to i32
  %280 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %268, i32 noundef %274, i32 noundef %279)
  %281 = load i16, ptr %2, align 2
  %282 = zext i16 %281 to i64
  %283 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %282
  %284 = getelementptr inbounds %struct.RESULTS_S, ptr %283, i32 0, i32 13
  %285 = load i16, ptr %284, align 8
  %286 = add i16 %285, 1
  store i16 %286, ptr %284, align 8
  br label %287

287:                                              ; preds = %266, %253, %245
  %288 = load i16, ptr %2, align 2
  %289 = zext i16 %288 to i64
  %290 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %289
  %291 = getelementptr inbounds %struct.RESULTS_S, ptr %290, i32 0, i32 6
  %292 = load i32, ptr %291, align 16
  %293 = and i32 %292, 4
  %294 = icmp ne i32 %293, 0
  br i1 %294, label %295, label %329

295:                                              ; preds = %287
  %296 = load i16, ptr %2, align 2
  %297 = zext i16 %296 to i64
  %298 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %297
  %299 = getelementptr inbounds %struct.RESULTS_S, ptr %298, i32 0, i32 12
  %300 = load i16, ptr %299, align 2
  %301 = zext i16 %300 to i32
  %302 = load i16, ptr %5, align 2
  %303 = sext i16 %302 to i64
  %304 = getelementptr inbounds [5 x i16], ptr @state_known_crc, i64 0, i64 %303
  %305 = load i16, ptr %304, align 2
  %306 = zext i16 %305 to i32
  %307 = icmp ne i32 %301, %306
  br i1 %307, label %308, label %329

308:                                              ; preds = %295
  %309 = load i16, ptr %2, align 2
  %310 = zext i16 %309 to i32
  %311 = load i16, ptr %2, align 2
  %312 = zext i16 %311 to i64
  %313 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %312
  %314 = getelementptr inbounds %struct.RESULTS_S, ptr %313, i32 0, i32 12
  %315 = load i16, ptr %314, align 2
  %316 = zext i16 %315 to i32
  %317 = load i16, ptr %5, align 2
  %318 = sext i16 %317 to i64
  %319 = getelementptr inbounds [5 x i16], ptr @state_known_crc, i64 0, i64 %318
  %320 = load i16, ptr %319, align 2
  %321 = zext i16 %320 to i32
  %322 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %310, i32 noundef %316, i32 noundef %321)
  %323 = load i16, ptr %2, align 2
  %324 = zext i16 %323 to i64
  %325 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %324
  %326 = getelementptr inbounds %struct.RESULTS_S, ptr %325, i32 0, i32 13
  %327 = load i16, ptr %326, align 8
  %328 = add i16 %327, 1
  store i16 %328, ptr %326, align 8
  br label %329

329:                                              ; preds = %308, %295, %287
  %330 = load i16, ptr %2, align 2
  %331 = zext i16 %330 to i64
  %332 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %331
  %333 = getelementptr inbounds %struct.RESULTS_S, ptr %332, i32 0, i32 13
  %334 = load i16, ptr %333, align 8
  %335 = sext i16 %334 to i32
  %336 = load i16, ptr %6, align 2
  %337 = sext i16 %336 to i32
  %338 = add nsw i32 %337, %335
  %339 = trunc i32 %338 to i16
  store i16 %339, ptr %6, align 2
  br label %340

340:                                              ; preds = %329, %195
  %341 = call zeroext i8 (...) @check_data_types()
  %342 = zext i8 %341 to i32
  %343 = load i16, ptr %6, align 2
  %344 = sext i16 %343 to i32
  %345 = add nsw i32 %344, %342
  %346 = trunc i32 %345 to i16
  store i16 %346, ptr %6, align 2
  %347 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %348 = getelementptr inbounds %struct.RESULTS_S, ptr %347, i32 0, i32 4
  %349 = load i32, ptr %348, align 8
  %350 = zext i32 %349 to i64
  %351 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i64 noundef %350)
  %352 = load i64, ptr %8, align 8
  %353 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i64 noundef %352)
  %354 = load i64, ptr %8, align 8
  %355 = call double @time_in_secs(i64 noundef %354)
  %356 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, double noundef %355)
  %357 = load i64, ptr %8, align 8
  %358 = call double @time_in_secs(i64 noundef %357)
  %359 = fcmp ogt double %358, 0.000000e+00
  br i1 %359, label %360, label %370

360:                                              ; preds = %340
  %361 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %362 = getelementptr inbounds %struct.RESULTS_S, ptr %361, i32 0, i32 5
  %363 = load i32, ptr %362, align 4
  %364 = mul i32 1, %363
  %365 = uitofp i32 %364 to double
  %366 = load i64, ptr %8, align 8
  %367 = call double @time_in_secs(i64 noundef %366)
  %368 = fdiv double %365, %367
  %369 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, double noundef %368)
  br label %370

370:                                              ; preds = %360, %340
  %371 = load i64, ptr %8, align 8
  %372 = call double @time_in_secs(i64 noundef %371)
  %373 = fcmp olt double %372, 1.000000e+01
  br i1 %373, label %374, label %378

374:                                              ; preds = %370
  %375 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %376 = load i16, ptr %6, align 2
  %377 = add i16 %376, 1
  store i16 %377, ptr %6, align 2
  br label %378

378:                                              ; preds = %374, %370
  %379 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %380 = getelementptr inbounds %struct.RESULTS_S, ptr %379, i32 0, i32 5
  %381 = load i32, ptr %380, align 4
  %382 = zext i32 %381 to i64
  %383 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i64 noundef %382)
  %384 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %385 = load i16, ptr %7, align 2
  %386 = zext i16 %385 to i32
  %387 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %386)
  %388 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %389 = getelementptr inbounds %struct.RESULTS_S, ptr %388, i32 0, i32 6
  %390 = load i32, ptr %389, align 16
  %391 = and i32 %390, 1
  %392 = icmp ne i32 %391, 0
  br i1 %392, label %393, label %403

393:                                              ; preds = %378
  %394 = load i16, ptr %2, align 2
  %395 = zext i16 %394 to i32
  %396 = load i16, ptr %2, align 2
  %397 = zext i16 %396 to i64
  %398 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %397
  %399 = getelementptr inbounds %struct.RESULTS_S, ptr %398, i32 0, i32 10
  %400 = load i16, ptr %399, align 2
  %401 = zext i16 %400 to i32
  %402 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %395, i32 noundef %401)
  br label %403

403:                                              ; preds = %393, %378
  %404 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %405 = getelementptr inbounds %struct.RESULTS_S, ptr %404, i32 0, i32 6
  %406 = load i32, ptr %405, align 16
  %407 = and i32 %406, 2
  %408 = icmp ne i32 %407, 0
  br i1 %408, label %409, label %419

409:                                              ; preds = %403
  %410 = load i16, ptr %2, align 2
  %411 = zext i16 %410 to i32
  %412 = load i16, ptr %2, align 2
  %413 = zext i16 %412 to i64
  %414 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %413
  %415 = getelementptr inbounds %struct.RESULTS_S, ptr %414, i32 0, i32 11
  %416 = load i16, ptr %415, align 4
  %417 = zext i16 %416 to i32
  %418 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %411, i32 noundef %417)
  br label %419

419:                                              ; preds = %409, %403
  %420 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %421 = getelementptr inbounds %struct.RESULTS_S, ptr %420, i32 0, i32 6
  %422 = load i32, ptr %421, align 16
  %423 = and i32 %422, 4
  %424 = icmp ne i32 %423, 0
  br i1 %424, label %425, label %435

425:                                              ; preds = %419
  %426 = load i16, ptr %2, align 2
  %427 = zext i16 %426 to i32
  %428 = load i16, ptr %2, align 2
  %429 = zext i16 %428 to i64
  %430 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %429
  %431 = getelementptr inbounds %struct.RESULTS_S, ptr %430, i32 0, i32 12
  %432 = load i16, ptr %431, align 2
  %433 = zext i16 %432 to i32
  %434 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %427, i32 noundef %433)
  br label %435

435:                                              ; preds = %425, %419
  %436 = load i16, ptr %2, align 2
  %437 = zext i16 %436 to i32
  %438 = load i16, ptr %2, align 2
  %439 = zext i16 %438 to i64
  %440 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 %439
  %441 = getelementptr inbounds %struct.RESULTS_S, ptr %440, i32 0, i32 9
  %442 = load i16, ptr %441, align 16
  %443 = zext i16 %442 to i32
  %444 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, i32 noundef %437, i32 noundef %443)
  %445 = load i16, ptr %6, align 2
  %446 = sext i16 %445 to i32
  %447 = icmp eq i32 %446, 0
  br i1 %447, label %448, label %465

448:                                              ; preds = %435
  %449 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %450 = load i16, ptr %5, align 2
  %451 = sext i16 %450 to i32
  %452 = icmp eq i32 %451, 3
  br i1 %452, label %453, label %464

453:                                              ; preds = %448
  %454 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %455 = getelementptr inbounds %struct.RESULTS_S, ptr %454, i32 0, i32 5
  %456 = load i32, ptr %455, align 4
  %457 = uitofp i32 %456 to double
  %458 = load i64, ptr %8, align 8
  %459 = call double @time_in_secs(i64 noundef %458)
  %460 = fdiv double %457, %459
  %461 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, double noundef %460)
  %462 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %463 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %464

464:                                              ; preds = %453, %448
  br label %465

465:                                              ; preds = %464, %435
  %466 = load i16, ptr %6, align 2
  %467 = sext i16 %466 to i32
  %468 = icmp sgt i32 %467, 0
  br i1 %468, label %469, label %471

469:                                              ; preds = %465
  %470 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  br label %471

471:                                              ; preds = %469, %465
  %472 = load i16, ptr %6, align 2
  %473 = sext i16 %472 to i32
  %474 = icmp slt i32 %473, 0
  br i1 %474, label %475, label %477

475:                                              ; preds = %471
  %476 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  br label %477

477:                                              ; preds = %475, %471
  %478 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %479 = getelementptr inbounds %struct.RESULTS_S, ptr %478, i32 0, i32 3
  %480 = getelementptr inbounds [4 x ptr], ptr %479, i64 0, i64 0
  %481 = load ptr, ptr %480, align 8
  call void @portable_free(ptr noundef %481)
  %482 = getelementptr inbounds [1 x %struct.RESULTS_S], ptr %9, i64 0, i64 0
  %483 = getelementptr inbounds %struct.RESULTS_S, ptr %482, i32 0, i32 14
  call void @portable_fini(ptr noundef %483)
  ret i32 0
}

declare void @portable_init(ptr noundef) #1

declare ptr @portable_malloc(i64 noundef) #1

declare ptr @core_list_init(i32 noundef, ptr noundef, i16 noundef signext) #1

declare i32 @core_init_matrix(i32 noundef, ptr noundef, i32 noundef, ptr noundef) #1

declare void @core_init_state(i32 noundef, i16 noundef signext, ptr noundef) #1

declare void @start_time() #1

declare ptr @iterate(ptr noundef) #1

declare void @stop_time() #1

declare double @time_in_secs(i64 noundef) #1

declare i64 @get_time() #1

declare zeroext i16 @crc16(i16 noundef signext, i16 noundef zeroext) #1

declare i32 @printf(ptr noundef, ...) #1

declare zeroext i8 @check_data_types(...) #1

declare void @portable_free(ptr noundef) #1

declare void @portable_fini(ptr noundef) #1

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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}

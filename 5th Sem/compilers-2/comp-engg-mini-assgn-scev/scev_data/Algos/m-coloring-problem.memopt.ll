; ModuleID = 'm-coloring-problem.ll'
source_filename = "m-coloring-problem.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [24 x i8] c"Solution does not exist\00", align 1
@.str.1 = private unnamed_addr constant [53 x i8] c"Solution Exists: Following are the assigned colors \0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c" %d \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__const.main.graph = private unnamed_addr constant [4 x [4 x i8]] [[4 x i8] c"\00\01\01\01", [4 x i8] c"\01\00\01\00", [4 x i8] c"\01\01\00\01", [4 x i8] c"\01\00\01\00"], align 16

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @_Z6isSafeiPA4_bPii(i32 %0, [4 x i8]* %1, i32* %2, i32 %3) #0 {
  br label %5

5:                                                ; preds = %21, %4
  %.01 = phi i32 [ 0, %4 ], [ %22, %21 ]
  %6 = icmp slt i32 %.01, 4
  br i1 %6, label %7, label %23

7:                                                ; preds = %5
  %8 = sext i32 %0 to i64
  %9 = getelementptr inbounds [4 x i8], [4 x i8]* %1, i64 %8
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds [4 x i8], [4 x i8]* %9, i64 0, i64 %10
  %12 = load i8, i8* %11, align 1
  %13 = trunc i8 %12 to i1
  br i1 %13, label %14, label %20

14:                                               ; preds = %7
  %15 = sext i32 %.01 to i64
  %16 = getelementptr inbounds i32, i32* %2, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = icmp eq i32 %3, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %14
  br label %24

20:                                               ; preds = %14, %7
  br label %21

21:                                               ; preds = %20
  %22 = add nsw i32 %.01, 1
  br label %5

23:                                               ; preds = %5
  br label %24

24:                                               ; preds = %23, %19
  %.0 = phi i1 [ false, %19 ], [ true, %23 ]
  ret i1 %.0
}

; Function Attrs: noinline sspstrong uwtable
define dso_local zeroext i1 @_Z17graphColoringUtilPA4_biPii([4 x i8]* %0, i32 %1, i32* %2, i32 %3) #1 {
  %5 = icmp eq i32 %3, 4
  br i1 %5, label %6, label %7

6:                                                ; preds = %4
  br label %27

7:                                                ; preds = %4
  br label %8

8:                                                ; preds = %24, %7
  %.01 = phi i32 [ 1, %7 ], [ %25, %24 ]
  %9 = icmp sle i32 %.01, %1
  br i1 %9, label %10, label %26

10:                                               ; preds = %8
  %11 = call zeroext i1 @_Z6isSafeiPA4_bPii(i32 %3, [4 x i8]* %0, i32* %2, i32 %.01)
  br i1 %11, label %12, label %23

12:                                               ; preds = %10
  %13 = sext i32 %3 to i64
  %14 = getelementptr inbounds i32, i32* %2, i64 %13
  store i32 %.01, i32* %14, align 4
  %15 = add nsw i32 %3, 1
  %16 = call zeroext i1 @_Z17graphColoringUtilPA4_biPii([4 x i8]* %0, i32 %1, i32* %2, i32 %15)
  %17 = zext i1 %16 to i32
  %18 = icmp eq i32 %17, 1
  br i1 %18, label %19, label %20

19:                                               ; preds = %12
  br label %27

20:                                               ; preds = %12
  %21 = sext i32 %3 to i64
  %22 = getelementptr inbounds i32, i32* %2, i64 %21
  store i32 0, i32* %22, align 4
  br label %23

23:                                               ; preds = %20, %10
  br label %24

24:                                               ; preds = %23
  %25 = add nsw i32 %.01, 1
  br label %8

26:                                               ; preds = %8
  br label %27

27:                                               ; preds = %26, %19, %6
  %.0 = phi i1 [ true, %6 ], [ true, %19 ], [ false, %26 ]
  ret i1 %.0
}

; Function Attrs: noinline sspstrong uwtable
define dso_local zeroext i1 @_Z13graphColoringPA4_bi([4 x i8]* %0, i32 %1) #1 {
  %3 = alloca [4 x i32], align 16
  br label %4

4:                                                ; preds = %9, %2
  %.01 = phi i32 [ 0, %2 ], [ %10, %9 ]
  %5 = icmp slt i32 %.01, 4
  br i1 %5, label %6, label %11

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 %7
  store i32 0, i32* %8, align 4
  br label %9

9:                                                ; preds = %6
  %10 = add nsw i32 %.01, 1
  br label %4

11:                                               ; preds = %4
  %12 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i32 0, i32 0
  %13 = call zeroext i1 @_Z17graphColoringUtilPA4_biPii([4 x i8]* %0, i32 %1, i32* %12, i32 0)
  %14 = zext i1 %13 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %11
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0))
  br label %20

18:                                               ; preds = %11
  %19 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i32 0, i32 0
  call void @_Z13printSolutionPi(i32* %19)
  br label %20

20:                                               ; preds = %18, %16
  %.0 = phi i1 [ false, %16 ], [ true, %18 ]
  ret i1 %.0
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline sspstrong uwtable
define dso_local void @_Z13printSolutionPi(i32* %0) #1 {
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.1, i32 0, i32 0))
  br label %3

3:                                                ; preds = %10, %1
  %.0 = phi i32 [ 0, %1 ], [ %11, %10 ]
  %4 = icmp slt i32 %.0, 4
  br i1 %4, label %5, label %12

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds i32, i32* %0, i64 %6
  %8 = load i32, i32* %7, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i32 %8)
  br label %10

10:                                               ; preds = %5
  %11 = add nsw i32 %.0, 1
  br label %3

12:                                               ; preds = %3
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local i32 @main() #3 {
  %1 = alloca [4 x [4 x i8]], align 16
  %2 = bitcast [4 x [4 x i8]]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 getelementptr inbounds ([4 x [4 x i8]], [4 x [4 x i8]]* @__const.main.graph, i32 0, i32 0, i32 0), i64 16, i1 false)
  %3 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %1, i32 0, i32 0
  %4 = call zeroext i1 @_Z13graphColoringPA4_bi([4 x i8]* %3, i32 3)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}

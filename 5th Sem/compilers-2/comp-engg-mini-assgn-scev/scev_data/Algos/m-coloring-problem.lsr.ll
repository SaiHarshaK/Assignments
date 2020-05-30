; ModuleID = 'm-coloring-problem.memopt.ll'
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
  %5 = sext i32 %0 to i64
  %scevgep1 = getelementptr [4 x i8], [4 x i8]* %1, i64 %5, i64 0
  br label %6

6:                                                ; preds = %16, %4
  %lsr.iv = phi i64 [ %lsr.iv.next, %16 ], [ 0, %4 ]
  %tmp = trunc i64 %lsr.iv to i32
  %7 = icmp slt i32 %tmp, 4
  br i1 %7, label %8, label %17

8:                                                ; preds = %6
  %scevgep2 = getelementptr i8, i8* %scevgep1, i64 %lsr.iv
  %9 = load i8, i8* %scevgep2, align 1
  %10 = trunc i8 %9 to i1
  br i1 %10, label %11, label %15

11:                                               ; preds = %8
  %scevgep = getelementptr i32, i32* %2, i64 %lsr.iv
  %12 = load i32, i32* %scevgep, align 4
  %13 = icmp eq i32 %3, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  br label %18

15:                                               ; preds = %11, %8
  br label %16

16:                                               ; preds = %15
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 1
  br label %6

17:                                               ; preds = %6
  br label %18

18:                                               ; preds = %17, %14
  %.0 = phi i1 [ false, %14 ], [ true, %17 ]
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

4:                                                ; preds = %7, %2
  %lsr.iv = phi i64 [ %lsr.iv.next, %7 ], [ 0, %2 ]
  %tmp = trunc i64 %lsr.iv to i32
  %5 = icmp slt i32 %tmp, 4
  br i1 %5, label %6, label %8

6:                                                ; preds = %4
  %scevgep = getelementptr [4 x i32], [4 x i32]* %3, i64 0, i64 %lsr.iv
  store i32 0, i32* %scevgep, align 4
  br label %7

7:                                                ; preds = %6
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 1
  br label %4

8:                                                ; preds = %4
  %9 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i32 0, i32 0
  %10 = call zeroext i1 @_Z17graphColoringUtilPA4_biPii([4 x i8]* %0, i32 %1, i32* %9, i32 0)
  %11 = zext i1 %10 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %8
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0))
  br label %17

15:                                               ; preds = %8
  %16 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i32 0, i32 0
  call void @_Z13printSolutionPi(i32* %16)
  br label %17

17:                                               ; preds = %15, %13
  %.0 = phi i1 [ false, %13 ], [ true, %15 ]
  ret i1 %.0
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline sspstrong uwtable
define dso_local void @_Z13printSolutionPi(i32* %0) #1 {
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.1, i32 0, i32 0))
  br label %3

3:                                                ; preds = %8, %1
  %lsr.iv = phi i64 [ %lsr.iv.next, %8 ], [ 0, %1 ]
  %tmp = trunc i64 %lsr.iv to i32
  %4 = icmp slt i32 %tmp, 4
  br i1 %4, label %5, label %9

5:                                                ; preds = %3
  %scevgep = getelementptr i32, i32* %0, i64 %lsr.iv
  %6 = load i32, i32* %scevgep, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i32 %6)
  br label %8

8:                                                ; preds = %5
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 1
  br label %3

9:                                                ; preds = %3
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
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

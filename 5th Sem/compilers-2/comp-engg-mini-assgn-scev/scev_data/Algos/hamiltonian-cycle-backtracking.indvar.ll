; ModuleID = 'hamiltonian-cycle-backtracking.memopt.ll'
source_filename = "hamiltonian-cycle-backtracking.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [25 x i8] c"\0ASolution does not exist\00", align 1
@.str.1 = private unnamed_addr constant [54 x i8] c"Solution Exists: Following is one Hamiltonian Cycle \0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@__const.main.graph1 = private unnamed_addr constant [5 x [5 x i8]] [[5 x i8] c"\00\01\00\01\00", [5 x i8] c"\01\00\01\01\01", [5 x i8] c"\00\01\00\00\01", [5 x i8] c"\01\01\00\00\01", [5 x i8] c"\00\01\01\01\00"], align 16
@__const.main.graph2 = private unnamed_addr constant [5 x [5 x i8]] [[5 x i8] c"\00\01\00\01\00", [5 x i8] c"\01\00\01\01\01", [5 x i8] c"\00\01\00\00\01", [5 x i8] c"\01\01\00\00\00", [5 x i8] c"\00\01\01\00\00"], align 16
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_hamiltonian_cycle_backtracking.cpp, i8* null }]

; Function Attrs: noinline sspstrong uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @_Z6isSafeiPA5_bPii(i32 %0, [5 x i8]* %1, i32* %2, i32 %3) #4 {
  %5 = sub nsw i32 %3, 1
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i32, i32* %2, i64 %6
  %8 = load i32, i32* %7, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [5 x i8], [5 x i8]* %1, i64 %9
  %11 = sext i32 %0 to i64
  %12 = getelementptr inbounds [5 x i8], [5 x i8]* %10, i64 0, i64 %11
  %13 = load i8, i8* %12, align 1
  %14 = trunc i8 %13 to i1
  %15 = zext i1 %14 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %4
  br label %30

18:                                               ; preds = %4
  %19 = sext i32 %3 to i64
  br label %20

20:                                               ; preds = %28, %18
  %indvars.iv = phi i64 [ %indvars.iv.next, %28 ], [ 0, %18 ]
  %21 = icmp slt i64 %indvars.iv, %19
  br i1 %21, label %22, label %29

22:                                               ; preds = %20
  %23 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv
  %24 = load i32, i32* %23, align 4
  %25 = icmp eq i32 %24, %0
  br i1 %25, label %26, label %27

26:                                               ; preds = %22
  br label %30

27:                                               ; preds = %22
  br label %28

28:                                               ; preds = %27
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %20

29:                                               ; preds = %20
  br label %30

30:                                               ; preds = %29, %26, %17
  %.0 = phi i1 [ false, %17 ], [ false, %26 ], [ true, %29 ]
  ret i1 %.0
}

; Function Attrs: noinline sspstrong uwtable
define dso_local zeroext i1 @_Z12hamCycleUtilPA5_bPii([5 x i8]* %0, i32* %1, i32 %2) #0 {
  %4 = icmp eq i32 %2, 5
  br i1 %4, label %5, label %22

5:                                                ; preds = %3
  %6 = sub nsw i32 %2, 1
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i32, i32* %1, i64 %7
  %9 = load i32, i32* %8, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [5 x i8], [5 x i8]* %0, i64 %10
  %12 = getelementptr inbounds i32, i32* %1, i64 0
  %13 = load i32, i32* %12, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [5 x i8], [5 x i8]* %11, i64 0, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = trunc i8 %16 to i1
  %18 = zext i1 %17 to i32
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %20, label %21

20:                                               ; preds = %5
  br label %41

21:                                               ; preds = %5
  br label %41

22:                                               ; preds = %3
  br label %23

23:                                               ; preds = %38, %22
  %.01 = phi i32 [ 1, %22 ], [ %39, %38 ]
  %exitcond = icmp ne i32 %.01, 5
  br i1 %exitcond, label %24, label %40

24:                                               ; preds = %23
  %25 = call zeroext i1 @_Z6isSafeiPA5_bPii(i32 %.01, [5 x i8]* %0, i32* %1, i32 %2)
  br i1 %25, label %26, label %37

26:                                               ; preds = %24
  %27 = sext i32 %2 to i64
  %28 = getelementptr inbounds i32, i32* %1, i64 %27
  store i32 %.01, i32* %28, align 4
  %29 = add nsw i32 %2, 1
  %30 = call zeroext i1 @_Z12hamCycleUtilPA5_bPii([5 x i8]* %0, i32* %1, i32 %29)
  %31 = zext i1 %30 to i32
  %32 = icmp eq i32 %31, 1
  br i1 %32, label %33, label %34

33:                                               ; preds = %26
  br label %41

34:                                               ; preds = %26
  %35 = sext i32 %2 to i64
  %36 = getelementptr inbounds i32, i32* %1, i64 %35
  store i32 -1, i32* %36, align 4
  br label %37

37:                                               ; preds = %34, %24
  br label %38

38:                                               ; preds = %37
  %39 = add nuw nsw i32 %.01, 1
  br label %23

40:                                               ; preds = %23
  br label %41

41:                                               ; preds = %40, %33, %21, %20
  %.0 = phi i1 [ true, %20 ], [ false, %21 ], [ true, %33 ], [ false, %40 ]
  ret i1 %.0
}

; Function Attrs: noinline sspstrong uwtable
define dso_local zeroext i1 @_Z8hamCyclePA5_b([5 x i8]* %0) #0 {
  %2 = call i8* @_Znam(i64 20) #8
  %3 = bitcast i8* %2 to i32*
  br label %4

4:                                                ; preds = %7, %1
  %indvars.iv = phi i64 [ %indvars.iv.next, %7 ], [ 0, %1 ]
  %exitcond = icmp ne i64 %indvars.iv, 5
  br i1 %exitcond, label %5, label %8

5:                                                ; preds = %4
  %6 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv
  store i32 -1, i32* %6, align 4
  br label %7

7:                                                ; preds = %5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %4

8:                                                ; preds = %4
  %9 = getelementptr inbounds i32, i32* %3, i64 0
  store i32 0, i32* %9, align 4
  %10 = call zeroext i1 @_Z12hamCycleUtilPA5_bPii([5 x i8]* %0, i32* %3, i32 1)
  %11 = zext i1 %10 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %8
  %14 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i32 0, i32 0))
  br label %16

15:                                               ; preds = %8
  call void @_Z13printSolutionPi(i32* %3)
  br label %16

16:                                               ; preds = %15, %13
  %.0 = phi i1 [ false, %13 ], [ true, %15 ]
  ret i1 %.0
}

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #5

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

; Function Attrs: noinline sspstrong uwtable
define dso_local void @_Z13printSolutionPi(i32* %0) #0 {
  %2 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.1, i32 0, i32 0))
  br label %3

3:                                                ; preds = %9, %1
  %indvars.iv = phi i64 [ %indvars.iv.next, %9 ], [ 0, %1 ]
  %exitcond = icmp ne i64 %indvars.iv, 5
  br i1 %exitcond, label %4, label %10

4:                                                ; preds = %3
  %5 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %6 = load i32, i32* %5, align 4
  %7 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 %6)
  %8 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  br label %9

9:                                                ; preds = %4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %3

10:                                               ; preds = %3
  %11 = getelementptr inbounds i32, i32* %0, i64 0
  %12 = load i32, i32* %11, align 4
  %13 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 %12)
  %14 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %13, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %15 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  ret void
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #1

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local i32 @main() #6 {
  %1 = alloca [5 x [5 x i8]], align 16
  %2 = alloca [5 x [5 x i8]], align 16
  %3 = bitcast [5 x [5 x i8]]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 getelementptr inbounds ([5 x [5 x i8]], [5 x [5 x i8]]* @__const.main.graph1, i32 0, i32 0, i32 0), i64 25, i1 false)
  %4 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* %1, i32 0, i32 0
  %5 = call zeroext i1 @_Z8hamCyclePA5_b([5 x i8]* %4)
  %6 = bitcast [5 x [5 x i8]]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 getelementptr inbounds ([5 x [5 x i8]], [5 x [5 x i8]]* @__const.main.graph2, i32 0, i32 0, i32 0), i64 25, i1 false)
  %7 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* %2, i32 0, i32 0
  %8 = call zeroext i1 @_Z8hamCyclePA5_b([5 x i8]* %7)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #7

; Function Attrs: noinline sspstrong uwtable
define internal void @_GLOBAL__sub_I_hamiltonian_cycle_backtracking.cpp() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline norecurse sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nounwind willreturn }
attributes #8 = { builtin }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}

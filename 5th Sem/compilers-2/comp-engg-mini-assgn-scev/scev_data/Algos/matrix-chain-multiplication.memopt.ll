; ModuleID = 'matrix-chain-multiplication.ll'
source_filename = "matrix-chain-multiplication.cpp"
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
@__const.main.arr = private unnamed_addr constant [4 x i32] [i32 1, i32 2, i32 3, i32 4], align 16
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [38 x i8] c"Minimum number of multiplications is \00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_matrix_chain_multiplication.cpp, i8* null }]

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
define dso_local i32 @_Z16MatrixChainOrderPii(i32* %0, i32 %1) #4 {
  %3 = zext i32 %1 to i64
  %4 = zext i32 %1 to i64
  %5 = call i8* @llvm.stacksave()
  %6 = mul nuw i64 %3, %4
  %7 = alloca i32, i64 %6, align 16
  br label %8

8:                                                ; preds = %16, %2
  %.02 = phi i32 [ 1, %2 ], [ %17, %16 ]
  %9 = icmp slt i32 %.02, %1
  br i1 %9, label %10, label %18

10:                                               ; preds = %8
  %11 = sext i32 %.02 to i64
  %12 = mul nsw i64 %11, %4
  %13 = getelementptr inbounds i32, i32* %7, i64 %12
  %14 = sext i32 %.02 to i64
  %15 = getelementptr inbounds i32, i32* %13, i64 %14
  store i32 0, i32* %15, align 4
  br label %16

16:                                               ; preds = %10
  %17 = add nsw i32 %.02, 1
  br label %8

18:                                               ; preds = %8
  br label %19

19:                                               ; preds = %85, %18
  %.0 = phi i32 [ 2, %18 ], [ %86, %85 ]
  %20 = icmp slt i32 %.0, %1
  br i1 %20, label %21, label %87

21:                                               ; preds = %19
  br label %22

22:                                               ; preds = %82, %21
  %.1 = phi i32 [ 1, %21 ], [ %83, %82 ]
  %23 = sub nsw i32 %1, %.0
  %24 = add nsw i32 %23, 1
  %25 = icmp slt i32 %.1, %24
  br i1 %25, label %26, label %84

26:                                               ; preds = %22
  %27 = add nsw i32 %.1, %.0
  %28 = sub nsw i32 %27, 1
  %29 = sext i32 %.1 to i64
  %30 = mul nsw i64 %29, %4
  %31 = getelementptr inbounds i32, i32* %7, i64 %30
  %32 = sext i32 %28 to i64
  %33 = getelementptr inbounds i32, i32* %31, i64 %32
  store i32 2147483647, i32* %33, align 4
  br label %34

34:                                               ; preds = %79, %26
  %.01 = phi i32 [ %.1, %26 ], [ %80, %79 ]
  %35 = sub nsw i32 %28, 1
  %36 = icmp sle i32 %.01, %35
  br i1 %36, label %37, label %81

37:                                               ; preds = %34
  %38 = sext i32 %.1 to i64
  %39 = mul nsw i64 %38, %4
  %40 = getelementptr inbounds i32, i32* %7, i64 %39
  %41 = sext i32 %.01 to i64
  %42 = getelementptr inbounds i32, i32* %40, i64 %41
  %43 = load i32, i32* %42, align 4
  %44 = add nsw i32 %.01, 1
  %45 = sext i32 %44 to i64
  %46 = mul nsw i64 %45, %4
  %47 = getelementptr inbounds i32, i32* %7, i64 %46
  %48 = sext i32 %28 to i64
  %49 = getelementptr inbounds i32, i32* %47, i64 %48
  %50 = load i32, i32* %49, align 4
  %51 = add nsw i32 %43, %50
  %52 = sub nsw i32 %.1, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32* %0, i64 %53
  %55 = load i32, i32* %54, align 4
  %56 = sext i32 %.01 to i64
  %57 = getelementptr inbounds i32, i32* %0, i64 %56
  %58 = load i32, i32* %57, align 4
  %59 = mul nsw i32 %55, %58
  %60 = sext i32 %28 to i64
  %61 = getelementptr inbounds i32, i32* %0, i64 %60
  %62 = load i32, i32* %61, align 4
  %63 = mul nsw i32 %59, %62
  %64 = add nsw i32 %51, %63
  %65 = sext i32 %.1 to i64
  %66 = mul nsw i64 %65, %4
  %67 = getelementptr inbounds i32, i32* %7, i64 %66
  %68 = sext i32 %28 to i64
  %69 = getelementptr inbounds i32, i32* %67, i64 %68
  %70 = load i32, i32* %69, align 4
  %71 = icmp slt i32 %64, %70
  br i1 %71, label %72, label %78

72:                                               ; preds = %37
  %73 = sext i32 %.1 to i64
  %74 = mul nsw i64 %73, %4
  %75 = getelementptr inbounds i32, i32* %7, i64 %74
  %76 = sext i32 %28 to i64
  %77 = getelementptr inbounds i32, i32* %75, i64 %76
  store i32 %64, i32* %77, align 4
  br label %78

78:                                               ; preds = %72, %37
  br label %79

79:                                               ; preds = %78
  %80 = add nsw i32 %.01, 1
  br label %34

81:                                               ; preds = %34
  br label %82

82:                                               ; preds = %81
  %83 = add nsw i32 %.1, 1
  br label %22

84:                                               ; preds = %22
  br label %85

85:                                               ; preds = %84
  %86 = add nsw i32 %.0, 1
  br label %19

87:                                               ; preds = %19
  %88 = mul nsw i64 1, %4
  %89 = getelementptr inbounds i32, i32* %7, i64 %88
  %90 = sub nsw i32 %1, 1
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32* %89, i64 %91
  %93 = load i32, i32* %92, align 4
  call void @llvm.stackrestore(i8* %5)
  ret i32 %93
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local i32 @main() #5 {
  %1 = alloca [4 x i32], align 16
  %2 = bitcast [4 x i32]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([4 x i32]* @__const.main.arr to i8*), i64 16, i1 false)
  %3 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0))
  %4 = getelementptr inbounds [4 x i32], [4 x i32]* %1, i32 0, i32 0
  %5 = call i32 @_Z16MatrixChainOrderPii(i32* %4, i32 4)
  %6 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %3, i32 %5)
  %7 = call i32 @getchar()
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #1

declare i32 @getchar() #1

; Function Attrs: noinline sspstrong uwtable
define internal void @_GLOBAL__sub_I_matrix_chain_multiplication.cpp() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}

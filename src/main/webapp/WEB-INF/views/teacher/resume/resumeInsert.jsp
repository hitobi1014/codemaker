<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이력서 작성📄</title>
</head>
<body>
    <div class="area_title">
        <h3 class="title">기본정보</h3>
    </div>

    <div class="resume_write resume_basic">
        <div class="resume_row">
            <div class="input_title">이름 <span class="point">필수</span></div>
            <div class="resume_input focus">
                <label for="user_nm" class="bar_title">이름<span class="valid_hidden"> 입력</span></label>
                <input type="text" id="user_nm" name="user_nm" class="box_input" value="" maxlength="20" data-only-word="true">
                <p class="txt_error"></p>
            </div>

            <div class="sri_select resume_select resume_right">
                <label for="jobhunting_st" class="bar_title">구직상태<span class="valid_hidden"> 선택</span></label>
                <button type="button" class="ico_arr selected size_type3">구직상태 선택</button>
                <input type="hidden" name="jobhunting_st" id="jobhunting_st" value="">
                <ul class="list_opt">
                    <li class=""><a href="##" class="link_opt" data-value="1">구직준비중(재학생)</a></li><li class=""><a href="##" class="link_opt" data-value="2">구직중</a></li><li class=""><a href="##" class="link_opt" data-value="5">재직중</a></li>                </ul>
                <p class="txt_error"></p>
            </div>
        </div>

        <div class="resume_row">
            <div class="input_title">생년월일 <span class="point">필수</span></div>
            <div class="resume_input focus">
                <label for="birth_dt" class="bar_title"><span class="valid_hidden">YYYYMMDD</span><span class="blind">생년월일</span></label>
                <input type="text" id="birth_dt" name="birth_dt" value="19960130" class="box_input expect_date" data-dateformat="yymmdd" data-only-number="true" autocomplete="off">
                <input type="hidden" id="birth_year" name="birth_year" value="1996">
                <input type="hidden" id="birth_month" name="birth_month" value="01">
                <input type="hidden" id="birth_day" name="birth_day" value="30">
                <p class="txt_error"></p>
            </div>

            <div class="inpRdoSw sizeXL resume_right">
                <span class="inOption">
                    <input name="sex" id="male" type="radio" value="male">
                    <label for="male" class="lbl">남</label>
                </span>
                <span class="inOption">
                    <input name="sex" id="female" type="radio" value="female" checked="">
                    <label for="female" class="lbl">여</label>
                </span>
                <p class="txt_error"></p>
            </div>
        </div>

        <div class="resume_row">
            <div class="input_title">이메일 <span class="point">필수</span></div>
            <div class="resume_input focus">
                <label for="email" class="bar_title">이메일 주소<span class="valid_hidden"> 입력</span></label>
                <input type="text" id="email" name="email" class="box_input max_length" value="qwedmswl@naver.com" readonly="" data-api_type="layer" data-api_id="basic_confirm_email">
                <span id="email_confirm_icon" class="certify">미인증</span>                <p class="txt_error"></p>
            </div>
            <a href="##" class="link_text">인증하기</a>        </div>

        <div class="resume_row">
            <div class="area_check_top">
                <label class="sri_check" for="living_overseas_fl">
                    <input type="checkbox" name="living_overseas_fl" value="1" id="living_overseas_fl" class="inp_check living_overseas_fl">
                    <span class="txt_check">해외거주</span>
                </label>

            </div>

            <div class="input_title">휴대폰 <span class="point">필수</span></div>
            <div class="resume_input focus">
                <label for="user_cell" class="bar_title">휴대폰 번호<span class="valid_hidden"> 입력</span></label>
                <input type="text" id="user_cell" name="user_cell" class="box_input max_length" value="01082670130" maxlength="11" data-only-number="true" data-api_type="layer" data-api_id="basic_confirm_cell" readonly="">
                <span id="cell_confirm_icon" class="identified" style="display:">인증</span>                <p class="txt_error"></p>
            </div>
            <a href="##" class="link_text link_modifie" style="display:">수정하기</a>        </div>

        <div class="resume_row">
            <div class="area_check_top">
                <label class="sri_check" for="same_cell">
                    <input type="checkbox" name="same_cell" id="same_cell" class="inp_check">
                    <span class="txt_check">휴대폰과 동일</span>
                </label>

            </div>
            <div class="input_title">전화번호</div>
            <div class="resume_input">
                <label for="user_tel" class="bar_title">전화번호<span class="valid_hidden"> 입력</span></label>
                <input type="text" id="user_tel" name="user_tel" class="box_input" value="" maxlength="11" data-only-number="true">
                <p class="txt_error"></p>
            </div>
        </div>



        <div class="resume_row">
            <div class="area_check_top domestic_check">
                <label class="sri_check" for="btn_oversea">
                    <input type="checkbox" id="btn_oversea" name="btn_oversea" class="inp_check">
                    <span class="txt_check">해외 지역</span>
                </label>
            </div>
            <div class="input_title">주소 <span class="point">필수</span></div>
            <input type="hidden" name="user_selected_type" id="user_selected_type" value="R">
            <input type="hidden" id="sido" name="sido" value="">
            <input type="hidden" id="sigungu" name="sigungu" value="">
            <input type="hidden" id="latitude" name="latitude" value="" class="_areaPosition">
            <input type="hidden" id="longitude" name="longitude" value="" class="_areaPosition">
            <input type="hidden" id="old_zipcode" name="old_zipcode" value="" class="_searchArea _oldAddress">
            <input type="hidden" id="new_zipcode" name="new_zipcode" value="30126" class="_searchArea _newAddress">

            <div class="resume_address">
                <div class="resume_input focus" style="display:">
                    <label for="new_address" class="bar_title"><span class="valid_hidden blind">도로명</span>주소<span class="valid_hidden"> 입력</span></label>
                    <input type="text" id="new_address" name="new_address" value="세종 새롬남로" maxlength="40" readonly="" class="box_input old_address _searchArea">
                    <p class="txt_error"></p>
                </div>

                <div class="resume_input focus" style="display:none;">
                    <label for="old_address" class="bar_title"><span class="valid_hidden blind">지번</span>주소<span class="valid_hidden"> 입력</span></label>
                    <input type="text" id="old_address" name="old_address" value="세종 새롬동" maxlength="40" readonly="" class="box_input old_address _searchArea">
                    <p class="txt_error"></p>
                </div>

                <div class="sri_select resume_select" style="display:none;">
                    <label for="overseas" class="bar_title" id="country">국가<span class="valid_hidden"> 선택</span></label>
                    <button type="button" class="ico_arr selected">국가 선택</button>
                    <input type="hidden" name="overseas" id="overseas" value="">
                    <ul class="list_opt">
                        <li class=""><a href="##" class="link_opt" data-value="260-100">가나</a></li><li class=""><a href="##" class="link_opt" data-value="260-200">가봉</a></li><li class=""><a href="##" class="link_opt" data-value="231-300">가이아나</a></li><li class=""><a href="##" class="link_opt" data-value="261-500">감비아</a></li><li class=""><a href="##" class="link_opt" data-value="231-400">과델루프</a></li><li class=""><a href="##" class="link_opt" data-value="230-100">과테말라</a></li><li class=""><a href="##" class="link_opt" data-value="250-100">괌</a></li><li class=""><a href="##" class="link_opt" data-value="242-000">그라나다</a></li><li class=""><a href="##" class="link_opt" data-value="211-700">그루지아</a></li><li class=""><a href="##" class="link_opt" data-value="240-100">그리스</a></li><li class=""><a href="##" class="link_opt" data-value="220-400">그린란드</a></li><li class=""><a href="##" class="link_opt" data-value="261-600">기니</a></li><li class=""><a href="##" class="link_opt" data-value="261-700">기니비소우</a></li><li class=""><a href="##" class="link_opt" data-value="231-500">기아나(프랑스령)</a></li><li class=""><a href="##" class="link_opt" data-value="261-800">나미비아</a></li><li class=""><a href="##" class="link_opt" data-value="252-200">나우루공화국</a></li><li class=""><a href="##" class="link_opt" data-value="260-300">나이지리아</a></li><li class=""><a href="##" class="link_opt" data-value="239-900">남미기타</a></li><li class=""><a href="##" class="link_opt" data-value="260-400">남아프리카공화국</a></li><li class=""><a href="##" class="link_opt" data-value="240-200">네덜란드</a></li><li class=""><a href="##" class="link_opt" data-value="221-200">네덜란드령 안틸레스제도</a></li><li class=""><a href="##" class="link_opt" data-value="211-800">네팔</a></li><li class=""><a href="##" class="link_opt" data-value="240-300">노르웨이</a></li><li class=""><a href="##" class="link_opt" data-value="250-200">뉴질랜드</a></li><li class=""><a href="##" class="link_opt" data-value="250-600">뉴칼레도니아섬</a></li><li class=""><a href="##" class="link_opt" data-value="261-900">니제르</a></li><li class=""><a href="##" class="link_opt" data-value="231-600">니카라과</a></li><li class=""><a href="##" class="link_opt" data-value="210-100">대만</a></li><li class=""><a href="##" class="link_opt" data-value="240-400">덴마크</a></li><li class=""><a href="##" class="link_opt" data-value="220-500">도미니카공화국</a></li><li class=""><a href="##" class="link_opt" data-value="231-700">도미니카연방</a></li><li class=""><a href="##" class="link_opt" data-value="240-500">독일</a></li><li class=""><a href="##" class="link_opt" data-value="214-400">동티모르</a></li><li class=""><a href="##" class="link_opt" data-value="212-000">라오스</a></li><li class=""><a href="##" class="link_opt" data-value="262-000">라이베리아</a></li><li class=""><a href="##" class="link_opt" data-value="242-100">라트비아</a></li><li class=""><a href="##" class="link_opt" data-value="240-600">러시아</a></li><li class=""><a href="##" class="link_opt" data-value="262-200">레뉴니용</a></li><li class=""><a href="##" class="link_opt" data-value="212-100">레바논</a></li><li class=""><a href="##" class="link_opt" data-value="242-200">루마니아</a></li><li class=""><a href="##" class="link_opt" data-value="242-300">룩셈부르크</a></li><li class=""><a href="##" class="link_opt" data-value="262-100">르완다</a></li><li class=""><a href="##" class="link_opt" data-value="260-500">리비아</a></li><li class=""><a href="##" class="link_opt" data-value="242-400">리투아니아</a></li><li class=""><a href="##" class="link_opt" data-value="245-500">리히텐슈타인</a></li><li class=""><a href="##" class="link_opt" data-value="262-300">마다가스카르</a></li><li class=""><a href="##" class="link_opt" data-value="231-800">마르티니크섬</a></li><li class=""><a href="##" class="link_opt" data-value="250-700">마샬군도</a></li><li class=""><a href="##" class="link_opt" data-value="242-500">마케도니아</a></li><li class=""><a href="##" class="link_opt" data-value="262-400">말라위</a></li><li class=""><a href="##" class="link_opt" data-value="210-200">말레이시아</a></li><li class=""><a href="##" class="link_opt" data-value="262-500">말리</a></li><li class=""><a href="##" class="link_opt" data-value="220-100">멕시코</a></li><li class=""><a href="##" class="link_opt" data-value="242-600">모나코</a></li><li class=""><a href="##" class="link_opt" data-value="260-600">모로코</a></li><li class=""><a href="##" class="link_opt" data-value="265-500">모리셔스</a></li><li class=""><a href="##" class="link_opt" data-value="262-600">모리타니아</a></li><li class=""><a href="##" class="link_opt" data-value="262-700">모잠비크</a></li><li class=""><a href="##" class="link_opt" data-value="245-300">몬테네그로</a></li><li class=""><a href="##" class="link_opt" data-value="245-400">몰도바</a></li><li class=""><a href="##" class="link_opt" data-value="212-300">몰디브</a></li><li class=""><a href="##" class="link_opt" data-value="242-700">몰타</a></li><li class=""><a href="##" class="link_opt" data-value="210-300">몽골</a></li><li class=""><a href="##" class="link_opt" data-value="242-800">몽트세라</a></li><li class=""><a href="##" class="link_opt" data-value="220-200">미국</a></li><li class=""><a href="##" class="link_opt" data-value="210-400">미얀마</a></li><li class=""><a href="##" class="link_opt" data-value="252-000">미크로네시아</a></li><li class=""><a href="##" class="link_opt" data-value="250-800">바누아투</a></li><li class=""><a href="##" class="link_opt" data-value="212-400">바레인</a></li><li class=""><a href="##" class="link_opt" data-value="220-600">바베이도스</a></li><li class=""><a href="##" class="link_opt" data-value="245-200">바티칸시국</a></li><li class=""><a href="##" class="link_opt" data-value="220-700">바하마</a></li><li class=""><a href="##" class="link_opt" data-value="210-500">방글라데시</a></li><li class=""><a href="##" class="link_opt" data-value="220-800">버뮤다</a></li><li class=""><a href="##" class="link_opt" data-value="232-000">버진제도</a></li><li class=""><a href="##" class="link_opt" data-value="262-800">베냉</a></li><li class=""><a href="##" class="link_opt" data-value="230-200">베네수엘라</a></li><li class=""><a href="##" class="link_opt" data-value="210-600">베트남</a></li><li class=""><a href="##" class="link_opt" data-value="240-700">벨기에</a></li><li class=""><a href="##" class="link_opt" data-value="242-900">벨로루시</a></li><li class=""><a href="##" class="link_opt" data-value="232-100">벨리즈</a></li><li class=""><a href="##" class="link_opt" data-value="243-000">보스니아헤르체고비나</a></li><li class=""><a href="##" class="link_opt" data-value="262-900">보츠와나</a></li><li class=""><a href="##" class="link_opt" data-value="232-200">볼리비아</a></li><li class=""><a href="##" class="link_opt" data-value="263-000">부룬디</a></li><li class=""><a href="##" class="link_opt" data-value="263-100">부르키나파소</a></li><li class=""><a href="##" class="link_opt" data-value="212-600">부탄</a></li><li class=""><a href="##" class="link_opt" data-value="229-900">북·중미기타</a></li><li class=""><a href="##" class="link_opt" data-value="252-100">북마리아나군도</a></li><li class=""><a href="##" class="link_opt" data-value="212-700">북한</a></li><li class=""><a href="##" class="link_opt" data-value="243-100">불가리아</a></li><li class=""><a href="##" class="link_opt" data-value="230-300">브라질</a></li><li class=""><a href="##" class="link_opt" data-value="212-800">브루나이</a></li><li class=""><a href="##" class="link_opt" data-value="250-900">사모아</a></li><li class=""><a href="##" class="link_opt" data-value="210-700">사우디아라비아</a></li><li class=""><a href="##" class="link_opt" data-value="221-000">사이판</a></li><li class=""><a href="##" class="link_opt" data-value="245-100">산마리노</a></li><li class=""><a href="##" class="link_opt" data-value="265-400">상투메프린시페</a></li><li class=""><a href="##" class="link_opt" data-value="263-200">세네갈</a></li><li class=""><a href="##" class="link_opt" data-value="263-300">세이셀제도</a></li><li class=""><a href="##" class="link_opt" data-value="221-300">세인트루시아</a></li><li class=""><a href="##" class="link_opt" data-value="221-400">세인트빈센트그레나딘즈</a></li><li class=""><a href="##" class="link_opt" data-value="221-100">세인트키츠네비스</a></li><li class=""><a href="##" class="link_opt" data-value="220-900">세인트피에르미그온</a></li><li class=""><a href="##" class="link_opt" data-value="263-400">세인트헬레나섬</a></li><li class=""><a href="##" class="link_opt" data-value="263-500">소말리아</a></li><li class=""><a href="##" class="link_opt" data-value="251-900">솔로몬제도</a></li><li class=""><a href="##" class="link_opt" data-value="260-700">수단</a></li><li class=""><a href="##" class="link_opt" data-value="232-500">수리남</a></li><li class=""><a href="##" class="link_opt" data-value="210-800">스리랑카</a></li><li class=""><a href="##" class="link_opt" data-value="263-600">스와질랜드</a></li><li class=""><a href="##" class="link_opt" data-value="240-800">스웨덴</a></li><li class=""><a href="##" class="link_opt" data-value="240-900">스위스</a></li><li class=""><a href="##" class="link_opt" data-value="241-000">스페인</a></li><li class=""><a href="##" class="link_opt" data-value="243-300">슬로바키아</a></li><li class=""><a href="##" class="link_opt" data-value="243-200">슬로베니아</a></li><li class=""><a href="##" class="link_opt" data-value="212-900">시리아</a></li><li class=""><a href="##" class="link_opt" data-value="263-700">시에라리온</a></li><li class=""><a href="##" class="link_opt" data-value="244-300">신유고연방</a></li><li class=""><a href="##" class="link_opt" data-value="210-900">싱가포르</a></li><li class=""><a href="##" class="link_opt" data-value="213-000">아랍에미레이트연합국</a></li><li class=""><a href="##" class="link_opt" data-value="243-400">아루바</a></li><li class=""><a href="##" class="link_opt" data-value="214-700">아르메니아</a></li><li class=""><a href="##" class="link_opt" data-value="230-400">아르헨티나</a></li><li class=""><a href="##" class="link_opt" data-value="219-900">아시아·중동기타</a></li><li class=""><a href="##" class="link_opt" data-value="243-600">아이슬란드</a></li><li class=""><a href="##" class="link_opt" data-value="232-600">아이티</a></li><li class=""><a href="##" class="link_opt" data-value="243-700">아일랜드</a></li><li class=""><a href="##" class="link_opt" data-value="214-800">아제르바이잔</a></li><li class=""><a href="##" class="link_opt" data-value="213-100">아프가니스탄</a></li><li class=""><a href="##" class="link_opt" data-value="269-900">아프리카기타</a></li><li class=""><a href="##" class="link_opt" data-value="232-700">안길라</a></li><li class=""><a href="##" class="link_opt" data-value="243-900">알바니아</a></li><li class=""><a href="##" class="link_opt" data-value="263-900">알제리</a></li><li class=""><a href="##" class="link_opt" data-value="264-000">앙골라</a></li><li class=""><a href="##" class="link_opt" data-value="265-300">에리트레아</a></li><li class=""><a href="##" class="link_opt" data-value="244-000">에스토니아</a></li><li class=""><a href="##" class="link_opt" data-value="230-500">에콰도르</a></li><li class=""><a href="##" class="link_opt" data-value="260-900">에티오피아</a></li><li class=""><a href="##" class="link_opt" data-value="232-800">엔티가바부다</a></li><li class=""><a href="##" class="link_opt" data-value="232-900">엘살바도르</a></li><li class=""><a href="##" class="link_opt" data-value="241-100">영국</a></li><li class=""><a href="##" class="link_opt" data-value="213-200">영국령 인도양식민지</a></li><li class=""><a href="##" class="link_opt" data-value="213-300">예멘</a></li><li class=""><a href="##" class="link_opt" data-value="213-400">오만</a></li><li class=""><a href="##" class="link_opt" data-value="259-900">오세아니아기타</a></li><li class=""><a href="##" class="link_opt" data-value="244-100">오스트리아</a></li><li class=""><a href="##" class="link_opt" data-value="230-600">온두라스</a></li><li class=""><a href="##" class="link_opt" data-value="213-500">요르단</a></li><li class=""><a href="##" class="link_opt" data-value="261-000">우간다</a></li><li class=""><a href="##" class="link_opt" data-value="230-700">우루과이</a></li><li class=""><a href="##" class="link_opt" data-value="213-600">우즈베키스탄</a></li><li class=""><a href="##" class="link_opt" data-value="244-200">우크라이나</a></li><li class=""><a href="##" class="link_opt" data-value="249-900">유럽기타</a></li><li class=""><a href="##" class="link_opt" data-value="213-700">이라크</a></li><li class=""><a href="##" class="link_opt" data-value="213-800">이란</a></li><li class=""><a href="##" class="link_opt" data-value="244-400">이스라엘</a></li><li class=""><a href="##" class="link_opt" data-value="261-100">이집트</a></li><li class=""><a href="##" class="link_opt" data-value="241-200">이탈리아</a></li><li class=""><a href="##" class="link_opt" data-value="211-000">인도</a></li><li class=""><a href="##" class="link_opt" data-value="211-100">인도네시아</a></li><li class=""><a href="##" class="link_opt" data-value="211-200">일본</a></li><li class=""><a href="##" class="link_opt" data-value="264-100">자마이카</a></li><li class=""><a href="##" class="link_opt" data-value="264-200">자이르</a></li><li class=""><a href="##" class="link_opt" data-value="264-300">잠비아</a></li><li class=""><a href="##" class="link_opt" data-value="264-400">적도기니</a></li><li class=""><a href="##" class="link_opt" data-value="211-300">중국.홍콩</a></li><li class=""><a href="##" class="link_opt" data-value="264-500">중앙아프리카공화국</a></li><li class=""><a href="##" class="link_opt" data-value="264-600">지부티</a></li><li class=""><a href="##" class="link_opt" data-value="244-500">지브롤터</a></li><li class=""><a href="##" class="link_opt" data-value="264-700">짐바브웨</a></li><li class=""><a href="##" class="link_opt" data-value="264-800">차드</a></li><li class=""><a href="##" class="link_opt" data-value="241-300">체코</a></li><li class=""><a href="##" class="link_opt" data-value="230-800">칠레</a></li><li class=""><a href="##" class="link_opt" data-value="264-900">카메룬</a></li><li class=""><a href="##" class="link_opt" data-value="265-800">카보베르데</a></li><li class=""><a href="##" class="link_opt" data-value="213-900">카자흐스탄</a></li><li class=""><a href="##" class="link_opt" data-value="214-000">카타르</a></li><li class=""><a href="##" class="link_opt" data-value="211-400">캄보디아</a></li><li class=""><a href="##" class="link_opt" data-value="220-300">캐나다</a></li><li class=""><a href="##" class="link_opt" data-value="261-200">케냐</a></li><li class=""><a href="##" class="link_opt" data-value="233-000">케이만제도</a></li><li class=""><a href="##" class="link_opt" data-value="265-000">케이프버드</a></li><li class=""><a href="##" class="link_opt" data-value="265-700">코모로</a></li><li class=""><a href="##" class="link_opt" data-value="221-500">코스타리카</a></li><li class=""><a href="##" class="link_opt" data-value="263-800">코트디브아르</a></li><li class=""><a href="##" class="link_opt" data-value="230-900">콜롬비아</a></li><li class=""><a href="##" class="link_opt" data-value="265-100">콩고</a></li><li class=""><a href="##" class="link_opt" data-value="265-600">콩고민주공화국</a></li><li class=""><a href="##" class="link_opt" data-value="231-000">쿠바</a></li><li class=""><a href="##" class="link_opt" data-value="214-100">쿠웨이트</a></li><li class=""><a href="##" class="link_opt" data-value="251-000">쿠크 군도</a></li><li class=""><a href="##" class="link_opt" data-value="244-600">크로아티아</a></li><li class=""><a href="##" class="link_opt" data-value="214-600">키르기즈스탄</a></li><li class=""><a href="##" class="link_opt" data-value="251-100">키리바시</a></li><li class=""><a href="##" class="link_opt" data-value="244-700">키프로스</a></li><li class=""><a href="##" class="link_opt" data-value="214-200">타지키스탄</a></li><li class=""><a href="##" class="link_opt" data-value="261-300">탄자니아</a></li><li class=""><a href="##" class="link_opt" data-value="211-500">태국</a></li><li class=""><a href="##" class="link_opt" data-value="233-200">터크스앤카이코스제도</a></li><li class=""><a href="##" class="link_opt" data-value="241-400">터키</a></li><li class=""><a href="##" class="link_opt" data-value="265-200">토고</a></li><li class=""><a href="##" class="link_opt" data-value="251-800">토켈라우제도</a></li><li class=""><a href="##" class="link_opt" data-value="251-200">통가</a></li><li class=""><a href="##" class="link_opt" data-value="214-300">투르크메니스탄</a></li><li class=""><a href="##" class="link_opt" data-value="251-300">투발루</a></li><li class=""><a href="##" class="link_opt" data-value="261-400">튀니지</a></li><li class=""><a href="##" class="link_opt" data-value="233-300">트리니나드토바고</a></li><li class=""><a href="##" class="link_opt" data-value="231-100">파나마</a></li><li class=""><a href="##" class="link_opt" data-value="233-400">파라과이</a></li><li class=""><a href="##" class="link_opt" data-value="214-500">파키스탄</a></li><li class=""><a href="##" class="link_opt" data-value="250-300">파푸아뉴기니</a></li><li class=""><a href="##" class="link_opt" data-value="251-600">팔라우</a></li><li class=""><a href="##" class="link_opt" data-value="244-800">페로제도</a></li><li class=""><a href="##" class="link_opt" data-value="231-200">페루</a></li><li class=""><a href="##" class="link_opt" data-value="241-500">포르투갈</a></li><li class=""><a href="##" class="link_opt" data-value="233-500">포클랜드제도</a></li><li class=""><a href="##" class="link_opt" data-value="241-600">폴란드</a></li><li class=""><a href="##" class="link_opt" data-value="251-500">폴리네시아제도</a></li><li class=""><a href="##" class="link_opt" data-value="233-600">푸에르토리코</a></li><li class=""><a href="##" class="link_opt" data-value="241-700">프랑스</a></li><li class=""><a href="##" class="link_opt" data-value="250-400">피지</a></li><li class=""><a href="##" class="link_opt" data-value="241-800">핀란드</a></li><li class=""><a href="##" class="link_opt" data-value="211-600">필리핀</a></li><li class=""><a href="##" class="link_opt" data-value="251-700">핏케언제도</a></li><li class=""><a href="##" class="link_opt" data-value="241-900">헝가리</a></li><li class=""><a href="##" class="link_opt" data-value="250-500">호주</a></li>                    </ul>
                    <p class="txt_error"></p>
                </div>

                <div class="resume_input resume_bottom focus" style="display:;">
                    <label for="new_address_details" class="bar_title"><span class="valid_hidden blind">도로명</span>상세주소<span class="valid_hidden"> 입력</span></label>
                    <input type="text" id="new_address_details" name="new_address_details" value="18 새뜸마을1단지 110동 1503호" maxlength="50" class="box_input size_type5 _newAddress">
                    <input type="hidden" id="new_address_extra" name="new_address_extra" value="">
                    <p class="txt_error"></p>
                </div>
                <div class="resume_input resume_bottom resume_input_type6 focus" style="display:none;">
                    <label for="old_address_details" class="bar_title"><span class="valid_hidden blind">지번</span>상세주소<span class="valid_hidden"> 입력</span></label>
                    <input type="text" id="old_address_details" name="old_address_details" value="산 78 새뜸마을1단지" maxlength="50" class="box_input size_type5 _oldAddress">
                    <p class="txt_error"></p>
                </div>
            </div>

        </div>



        <div class="resume_photo">
            <a href="##" class="box_photo" data-api_type="layer" data-api_id="basic_photo">
                <img alt="" src="https://pds.saramin.co.kr/person/photo/2020/03/q6ymhq_idyf-1me7mbo_q6ymhp8uoh1me7mboq6ymgpnrtp1me7mboP201605311111510005A1C8728CD024BB98CF36D9161595664.JPG" border="0" width="100" height="140" class="user_image">            </a>
            <a class="photo_delete" href="##" style=""><span class="blind">사진 삭제</span></a>
        </div>
    </div>


</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/include/header.jsp" />

<style type="text/css">
.unfold{
	float: right;
	cursor: pointer;
}
.answer{
	display: none;
}
.pagenum {
    text-align: center;
    padding: 0.5em;
}

/*새로 추가   */
div#container {
	max-width: 750px;
}
button.btn.btn-primary {
    height: 44px;
    background-color: #5e87f1;
    border-color: #5e87f1;
}
button.btn.btn-primary_write {
    height: 44px;
    background-color: #5e87f1;
    border-color: #5e87f1;
}
h1#list_title {
    margin-top: -12px;
    position: relative;
    top: 47px;
    font-size: 30px;
    font-weight: bold;
    letter-spacing: -1px;
    margin-bottom: 61px;
}

.faqlist {
    margin-top: 37px;
    margin-bottom: -16px;
}
h5.mb-0 {
    font-size: 17px;
    font-weight: 500;
    color: black;
}
img#searchimg {
    resize: both;
    height: 31px;
}
.card-body {
    background: #f3f3f3;
}
hr.hr_bottom {
    border: 1.5px solid #5e87f1;;
    margin-bottom: 32px;
}
span.Q {
    color: #5e87f1;
    font-size: 21px;
    margin-right: 11px;
}
span.A {
    color: #5e87f1;
    font-size: 21px;
    font-weight: 500;
}
img.open_down {
    background-color: #5e87f1;
    resize: both;
    width: 16px;
    height: 15px;
}
table.box2 {
    width: 100%;
}
th {
    color: #7b7b7b;
}
div#freelist_part {
	border-top: 3px solid #5e87f1;
	border-bottom: 3px solid #5e87f1;
    padding: 11px 11px;
}
div#freelist_part2 {
    border-bottom: 1.3px solid #d0d0d0;
    padding: 19px 11px;
}
span.num {
    margin-right: 35px;
    font-weight: 600;
    color: #7b7a91;
}
span.title {
    margin-right: 277px;
    font-weight: 600;
    color: #7b7a91;
}
span.member {
    margin-right: 88px;
    font-weight: 600;
    color: #7b7a91;
}
span.regdate {
    margin-right: 52px;
    font-weight: 600;
    color: #7b7a91;
}
span.hits {
	font-weight: 600;
    color: #7b7a91;
}
span.num2 {
    font-weight: 600;
    color:#5e87f1;
    position: relative;
    left: 12px;; 
}
span.title2 {
    font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 62px; 
}
span.member2 {
    font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 285px; 
}
span.regdate2 {
    font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 365px; 
     
}
span.hits2 {
	font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 416px;
}
div#card-header {
    border-bottom: 0.5px solid #bdbdbd;
    padding: 16px 0px;
}
button.btn.btn-primary_write {
    height: 42px;
    background-color: #5e87f1;
    border-color: #5e87f1;
    margin-top: 0px;
    color: white;
    position: relative;
    left: 650px;
    width: 71px;
}
div.btn.btn-primary_list {
    height: 42px;
    background-color: #5e87f1;
    border-color: #5e87f1;
    margin-top: 0px;
    color: white;
    position: relative;
    left: 569px;
    width: 71px;
    padding: 8px 0px;
}
div.btn.btn-primary_reply {
    height: 42px;
    background-color: #5e87f1;
    border-color: #5e87f1;
    margin-top: 0px;
    color: white;
    position: relative;
    left: 576px;
    width: 71px;
    padding: 8px 0px;
}
input#input_1 {/*  */
    height: calc(1.5em + .75rem + 6px);
    width: 81.8%;
    margin-bottom: 7px;
    border-radius: 0;
}
div.write_menu_div11 {
    font-size: 17px;
    color: white;
}
.write_menu_div2 {
    background-color: #5e87f1;
    width: 183px;
    height: 51px;
    text-align: center;
    float: left;
    padding: 12px 0;
    margin-right: 14px;
}
input#input_2 {
    height: calc(1.5em + .75rem + 6px);
    width: 81.8%;
    margin-bottom: 11px;
    border-radius: 0;
}
input#input_5 {
    height: calc(1.5em + .75rem + 6px);
    width: 72%;
    margin-bottom: 11px;
}
div.write_menu_div22 {
    font-size: 17px;
    color: white;
}

.write_menu2 {
    margin-bottom: 12px;
}
.write_menu_div3 {
    background-color: #5e87f1;
    width: 183px;
    height: 315px;
    text-align: center;
    float: left;
    padding: 136px 0;
    margin-right: 14px;
}
div.write_menu_div33 {
    font-size: 18px;
    color: white;
    margin-top: 163px;
}
div.write_menu_div44 {
    font-size: 18px;
    color: white;
    margin-top: 168px;
}
hr.line1 {
    margin: 0;
    position: relative;
    top: 13px;
    color: white;
    border: 1px solid white;
}
hr.line2 {
    margin: 0;
    position: relative;
    top: 15px;
    color: white;
    border: 1px solid white;
}
hr.line3 {
    margin: 0;
    position: relative;
    top: 152px;
    color: white;
    border: 1px solid white;
}
.write_menu_div1 {/*  */
    background-color: #5e87f1;
    width: 124px;
    height: 42px;
    float: left;
    text-align: center;
    padding: 9px 0;
    margin-right: 7px;
}
.write_menu_div2 {/*  */
    background-color: #5e87f1;
    width: 124px;
    height: 42px;
    float: left;
    text-align: center;
    padding: 9px 0;
    margin-right: 7px;
}
.write_menu_div3 {/*  */
    background-color: #5e87f1;
    width: 124px;
    height: 42px;
    float: left;
    text-align: center;
    padding: 9px 0;
    margin-right: 7px;
}
span.top_regt {
    position: relative;
    left: 30.4em;
    top: -1.8em;
    font-size: 17px;
    color: #5e87f1;
    font-weight: bold;
}
span.top_reg {
    position: relative;
    left: 29em;
    top: -1.75em;
    font-size: 18px;
    font-weight: bold;
    color: #b9b9b9;
}
.FreeTitle {
    margin-bottom: 8px;
    margin-top: 120px;
}
span.Jobsearch {
    font-size: 32px;
    letter-spacing: -1px;
    font-weight: 500;
    color: #4876ef;
    font-weight: bold;
    letter-spacing: -2px;
}
span.text_span1 {
    font-size: 23px;
    margin-left: 8px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
span.text_span2 {
    font-size: 23px;
    margin-left: 1px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
span.text_span3 {
    font-size: 26px;
    margin-left: 1px;
    color: #8e8e8e;
}
hr.title_hr {
    border: 1px solid #4876ef;
    margin: 0px 0 -3px 0;
}
a.tag_a {
    color: white;
    text-decoration: none;
}
img.menu {
    resize: both;
    height: 28px;
    position: relative;
    top: -2px;
    width: 45px;
}
/*수정한 부분   */
.freeEdit_box {
    border-bottom: 2px solid #4876ef;
    margin-top: -25px;
    padding: 14px 16px;
    display: flex;
}
.detail_title {
    width: 34em;
}
.detail_writer {
    margin-left: 12px;
}
span.detail_title_span {
    color: #b1b1b1;
    font-weight: bold;
    margin-right: 6px;
}
span.detail_writer_span {
    color: #b1b1b1;
    font-weight: bold;
    margin-right: 6px;
}
div#floatMenu2 {
    position: absolute;
    top: 289px;
    left: 1335px;
}
div.btn_top {
    background-color: #4876ef;
    border-color: #5e87f1;
    color: white;
    border: 1px solid #dadada;
    width: 75px;
    text-align: center;
    height: 36px;
    padding: 5px 0;
    border-radius: 7px 7px 0 0;
}
div.btn_bottom {
    background-color: #4876ef;
    border-color: #5e87f1;
    color: white;
    border: 1px solid #dadada;
    width: 75px;
    text-align: center;
    height: 36px;
    padding: 5px 0;
    border-radius: 0 0 7px 7px;
}
button.btn_write {/* 네비게이션 */
    background-color: #4876ef;
    border-color: #5e87f1;
    color: white;
    border: 1px solid #dadada;
    width: 75px;
    text-align: center;
    height: 36px;
    padding: 5px 0;
}
div.btn_list {
    background-color: #4876ef;
    border-color: #5e87f1;
    color: white;
    border: 1px solid #dadada;
    width: 75px;
    text-align: center;
    height: 36px;
    padding: 5px 0;
}
img.Totop {
    resize: both;
    height: 14px;
    position: relative;
    top: -2px;
    width: 40px;
}
img.Tobottom {
    resize: both;
    height: 14px;
    position: relative;
    top: -2px;
    width: 40px;
}
img.write {
    resize: both;
    height: 29px;
    position: relative;
    top: -2px;
    width: 48px;
}
img.menu {
    resize: both;
    height: 22px;
    position: relative;
    top: -2px;
    width: 40px;
}
hr#bottom_line {
    margin-top: 0;
    margin-bottom: 23px;
    border-color: white;
}
.btn_reply {
    background-color: #4876ef;
    border-color: #5e87f1;
    color: white;
    border: 1px solid #dadada;
    width: 75px;
    text-align: center;
    height: 36px;
    padding: 5px 0;
}
.reply_layout {
    border-bottom: 1px solid #dadada;
    padding: 50px 10px;
    text-align: center;
    height: 8em;
    margin-bottom: -24px;
}
.reply_menu {
    border-bottom: 1px solid #dadada;
    padding: 22px 0px;
    display: flex;
}
img.photo_hole {
    resize: both;
    height: 70px;
}
img.photoname {
    resize: both;
    height: 59px;
    position: relative;
    top: -64px;
    left: -1px;
    z-index: -1;
}
img.base_photo {
    resize: both;
    height: 54px;
    position: relative;
    top: -63px;
    left: -1.95px;
    z-index: -1;
}
.inner {/*  */
    width: 609px;
}
.re_cont {/*  */
    margin-bottom: 3px;
    line-height: 1.3;
}
.delete {
    border: 1px solid #d0d0d0;
    width: 18px;
    height: 18px;
    border-radius: 50%;
    background-color: #e8e8e8;
    position: relative;
    left: 38em;
    text-align: center;
}
span.delete_span {
    position: relative;
    top: -4px;
    font-size: 14px;
}
a.delete_a {
    text-decoration: none;
    color: #b1b1b1;
}
.re_writer {/*  */
    font-size: 15px;
    font-weight: 700;
    margin-bottom: 4px;
    color: #4876ef;
    margin-top: -21px
}
.re_cont {/*  */
    margin-bottom: 3px;
    line-height: 1.3;
}
.re_reg {
    font-size: 14px;
    color: #989898;
    text-align: right;
    position: relative;
    top: 9px;
}
.photo {
    height: 47px;
    width: 93px;
    margin-right: -7px;
    text-align: center;
    position: relative;
    top: -6px;
}
a.tag_a_reply {
    text-decoration: none;
}
.empty_dbt {
	height: 18px;
}

.select_box {
    position: relative;
    left: 18em;
    top: -12px;
    margin-bottom: -30px;
    height: 31px;
    border: none;
    opacity: 0.3;
	background: url("${pageContext.request.contextPath}/resources/images/selectbox.png") center no-repeat;
}

.select_box select {
    position: absolute;
    left: 298px;
    top: -1px;
    width: 74px;
    height: 28px;
    font-size: 15px;
    color: #7b7b7b;
    text-align: center;
    background: #fff;
    opacity: 0;
    border: 1px solid black;
}
/* 댓글 */
.reply_count {
    font-size: 17px;
}
textarea#input_3 {
    height: calc(1.5em + .75rem + 280px);
    width: 100%;
    margin-bottom: 13px;
    border-radius: 0;
}
img.reply_bar_img {
    resize: both;
    width: 24px;
    position: relative;
    top: -2px;
    margin-left: 3px;
}
span.re_span {
    margin-left: 7px;
}
nav.nav_side {
    position: fixed;
    top: 36px;
    height: 100%;
}
</style>
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 

	

<c:import url="/WEB-INF/views/include/headend.jsp" />

<div class="container" id="container">
	<div class="FreeTitle">
	    <span class="Jobsearch">게시글</span>
	    <span class="text_span1">상세보기</span>
    </div>
     <hr class="title_hr">
    
		<form name="frmEdit" method="post" action="<c:url value='/board/chkPwd.do'/>">	
			<input type="password" id="input_5" class="form-control" name="memberPwd" placeholder="비밀번호확인">
			<button type="submit" class="btn_write">확인</button>
		</form>
	</div>
	
		
	
	<hr id="bottom_line">
	 
</div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
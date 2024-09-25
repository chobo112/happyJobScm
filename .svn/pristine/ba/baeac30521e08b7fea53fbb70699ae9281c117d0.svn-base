<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Job Korea</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script src="https://unpkg.com/axios@0.12.0/dist/axios.min.js"></script>
<script src="https://unpkg.com/lodash@4.13.1/lodash.min.js"></script>
<!-- D3 -->
<style>
//
click-able rows
	.clickable-rows {tbody tr td { cursor:pointer;
	
}

.el-table__expanded-cell {
	cursor: default;
}
}
</style>
<script type="text/javascript">
        
		/* onload 이벤트  */
		$(document).ready(function() {
			
		
	    });
		
		
</script>

</head>
<body>
<form id="myForm" action=""  method="">

<input type="hidden" id="currentPage" value="1">
<input type="hidden" id="selectedInfNo" value="">
	<!-- 모달 배경 -->
	<div id="mask"></div>

	<div id="wrap_area">

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> <jsp:include
						page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
	               
					<div class="content" style="margin-bottom:20px;">
                       
						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">메인</span> <a href="../dashboard/dashboard.do"
								class="btn_set refresh">새로고침</a>
						</p>
                         <div >
						        <p class="conTitle" style="margin-bottom: 1%;">
									<span>React.JS 개요</span> 
									<span class="fr"> 
										 관련 자료 
									</span>
								</p>	
								<div>
                                        <table>
										    <tbody>
										          <tr>
										               <td><b><h6>시작</h6></b></td>
										               <td>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://ko.legacy.reactjs.org/docs/getting-started.html" target="_blank">OverView</a>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://ko.legacy.reactjs.org/docs/introducing-jsx.html" target="_blank">JSX</a>
										               </td>
										          <tr>
										          <tr>
										               <td><b><h6>공식 사이트</h6></b></td>
										               <td>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://reactjs-kr.firebaseapp.com/" target="_blank">공식 한국 reAct</a>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://ykss.netlify.app/translation/react_libraries_for_2024/" target="_blank">블로그</a>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://aglowiditsolutions.com/blog/best-react-ui-framework/" target="_blank">reAct UI Framework</a> 
										               </td>
										          <tr>
										          <tr>
										               <td><b><h6>reAct 설치</h6></b></td>
										               <td>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://reactjs-kr.firebaseapp.com/docs/installation.html" target="_blank">설치</a>
										               </td>
										          <tr>		
										          <tr>
										               <td><b><h6>Life Cycle</h6></b></td>
										               <td>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://www.zerocho.com/category/React/post/579b5ec26958781500ed9955" target="_blank">Life Cycle</a>
										               </td>
										          <tr>		
										          
										          <tr>
										               <td><b><h6>자바스크립트</h6></b></td>
										               <td>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://joshua1988.github.io/web-development/translation/essential-es6-features-for-vuejs/" target="_blank">ES6</a>
										               </td>
										          <tr>	
										          <tr>
										               <td style="vertical-align: top;"><b><h6>테스트 사이트</h6></b></td>
										               <td>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://jsfiddle.net/boilerplate/react-jsx" target="_blank">jsfiddle</a><br>
										               </td>
										          <tr>		
                                                  <tr>
										               <td style="vertical-align: top;"><b><h6>참고자료</h6></b></td>
										               <td>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://velog.io/@lky5697/react-starter" target="_blank">   2024년에 리액트 프로젝트를 시작하는 방법</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://www.youtube.com/watch?v=mNj5_8k1zVk" target="_blank">   Zod로 데이터 유효성 검증 + 타입 추론</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://velog.io/@rgfdds98/Route-pathmovieId-%EB%8A%94-%EB%AC%B4%EC%8A%A8-%EC%9D%98%EB%AF%B8" target="_blank">Route 1</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://blog.sooli.com/?p=1326&referrer-analytics=1" target="_blank">Route 2</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://tcpschool.com/react/react_router_nested" target="_blank">Route(전체 강의 강추) 3</a> <br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://www.youtube.com/watch?v=mC5N3NZcxFU" target="_blank">Re Randering 1</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://www.youtube.com/watch?v=1YAWshEGU6g" target="_blank">Re Randering 2</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://www.youtube.com/watch?v=HYgKBvLr49c" target="_blank">Component</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://youtu.be/aAs36UeLnTg?si=7yh8oA_meOy_lNxO" target="_blank">Component</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://www.youtube.com/watch?v=kyodvzc5GHU" target="_blank">Hook 1</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://www.youtube.com/watch?v=y0vhpilNSKo" target="_blank">Hook 2</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://www.youtube.com/watch?v=n-ddI9Lt7Xs" target="_blank">Tanstack Query</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://www.youtube.com/watch?v=zNHZJ_iEMPA" target="_blank">Zustand  (시리즈 강추)</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://www.youtube.com/watch?v=nkXIpGjVxWU" target="_blank">React Query & Zustand </a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://www.youtube.com/watch?v=7mkQi0TlJQo" target="_blank">React 18 버전</a><br>
										                       &nbsp&nbsp&nbsp&nbsp&nbsp<a  href="https://www.youtube.com/watch?v=SQPLPPb_LuE" target="_blank">ChatGPT를 VSCode안으로 데리고 오자</a>
										               </td>
										          <tr>											          	    
										    </tbody>
										 
										 
										 </table>
								
								
								</div>
						</div>  						
						<br>
						
                                <p class="conTitle" style="margin-bottom: 1%;">
									<span>1. nodeJs  설치     </span> 
									<span class="fr"> 
										  NodeJS
									</span>
							    </p>
			                    <table width="100%" class="col" border=0>
	                                    <colgroup>
										    <col width="100%">
										</colgroup>
										<tbody>
										     <tr>
										         <td style="text-align:left" >
										                  <a  href="https://ojava.tistory.com/185" target="_blank">참조</a> <br>
										                   node-v14.16.0-x64.exe   실행
										         </td>
										     </tr>								
							           </tbody>
							     </table> 		
							     <br>
                                 <p class="conTitle" style="margin-bottom: 1%;">
									<span>2. nodeJs  설치  (Command)   </span> 
									<span class="fr"> 
										  NodeJS
									</span>
							    </p>
			                    <table width="100%" class="col" border=0>
	                                    <colgroup>
										    <col width="100%">
										</colgroup>
										<tbody>
										     <tr>
										         <td style="text-align:left" >
										                  CMD 창에서  C:\nodejs>npm install   실행
										         </td>
										     </tr>								
							           </tbody>
							     </table> 	
							     <br>
                                 
                                 <p class="conTitle" style="margin-bottom: 1%;">
									<span>3. reAct 설치  (Command)   </span> 
									<span class="fr"> 
										  reActJS
									</span>
							    </p>
			                    <table width="100%" class="col" border=0>
	                                    <colgroup>
										    <col width="100%">
										</colgroup>
										<tbody>
										     <tr>
										         <td style="text-align:left" >
										                  npm install --save react react-dom 실행
										         </td>
										     </tr>								
							           </tbody>
							     </table> 		
							     <br>
                                 <p class="conTitle" style="margin-bottom: 1%;">
									<span>4. 프로젝트 생성  (Command)   </span>
									
							    </p>
			                    <table width="100%" class="col" border=0>
	                                    <colgroup>
										    <col width="100%">
										</colgroup>
										<tbody>
										     <tr>
										         <td style="text-align:left" >
										                  14.1 workspace 폴더 생성<br>
                                                          14.2 worksapce 폴더 cmd 에서 프로젝트 생성 <br>
                                                                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp14.2.1 npx create-react-app (프로젝트 이름) <br>       
                                                              
										         </td>
										     </tr>								
							           </tbody>
							     </table> 		
							     <br>
							      <p class="conTitle" style="margin-bottom: 1%;">
									<span>5. Server Run  (Command)   </span>
									<span class="fr"> 
									Server 실행
								    </span> 
							    </p>
			                    <table width="100%" class="col" border=0>
	                                    <colgroup>
										    <col width="100%">
										</colgroup>
										<tbody>
										     <tr>
										         <td style="text-align:left" >
										                 생성 프로젝트 폴더로 이동 후 실행  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp npm start<br>
                                                              <a  href="http://localhost:3000/"  target="_blank">확인</a>
										         </td>
										     </tr>								
							           </tbody>
							     </table> 	
							     <br>
							      <p class="conTitle" style="margin-bottom: 1%;">
									<span>6. Vsc   설치</span>
									<span class="fr"> 
									Visual Studio Code
								    </span> 
							    </p>
			                    <table width="100%" class="col" border=0>
	                                    <colgroup>
										    <col width="100%">
										</colgroup>
										<tbody>
										     <tr>
										         <td style="text-align:left" >
										                 VSCodeUserSetup-x64-1.61.0.exe 실행
										         </td>
										     </tr>								
							           </tbody>
							     </table> 
							      <br>
							      <p class="conTitle" style="margin-bottom: 1%;">
									<span>7. vsc 환경 설정</span>
									<span class="fr"> 
									Visual Studio Code
								    </span> 
							    </p>
			                    <table width="100%" class="col" border=0>
	                                    <colgroup>
										    <col width="100%">
										</colgroup>
										<tbody>
										     <tr>
										         <td style="text-align:left" >
                                                              <a  href="https://hashdork.com/ko/best-react-extensions-for-visual-studio-code/"  target="_blank">참조</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										         </td>
										     </tr>								
							           </tbody>
							     </table> 
							     <br>
							      <p class="conTitle" style="margin-bottom: 1%;">
									<span>8. 프로젝트 열기</span>
									<span class="fr"> 
									Visual Studio Code
								    </span> 
							    </p>
			                    <table width="100%" class="col" border=0>
	                                    <colgroup>
										    <col width="100%">
										</colgroup>
										<tbody>
										     <tr>
										         <td style="text-align:left" >
                                                     VSC 메뉴 : 파일-폴더열기   선택후     해당 프로젝트 폴더 열기
										         </td>
										     </tr>								
							           </tbody>
							     </table> 
							     <br>
							      <p class="conTitle" style="margin-bottom: 1%;">
									<span>9. 샘플소스 만들기</span>
									<span class="fr"> 
									Visual Studio Code
								    </span> 
							    </p>
			                    <table width="100%" class="col" border=0>
	                                    <colgroup>
										    <col width="100%">
										</colgroup>
										<tbody>
										     <tr>
										         <td style="text-align:left" >
                                                     샘플소스 만들기
										         </td>
										     </tr>								
							           </tbody>
							     </table> 
							     
							     
				        </div>  
					</li>
			</ul>
		</div>
		
		
		
		
		
	</div>
					

				
				
		
</form>
</body>
</html>
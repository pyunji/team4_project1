<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css"/>
<%--구현 후 jstl 삭제하기--%>

<%@ page contentType="text/html; charset=UTF-8"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font/category.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font/home.css"/>
	</head>
	<body>
		
	         
		<%-- headerWrap 시작 --%>
		<div id="headerWrap">
			<div class="header header_fixed header_main1903"> 
				<div class="top_nav topnav1903">
					<div class="top_nav_wrap clearfix">
			            <div class="brand_menu brand_menu1903">
				            <ul class="clearfix">
				                <!-- 선호 브랜드 없음 -->
			                        <li>
				                        <span class="on">
				                        	<a href="/">HOME</a>
				                        </span>
			                        </li>
				               <!-- 로그인 상태 -->
								<!-- 비로그인 상태 -->
				              <p class="brand_menu_guide_text">패션의 완성 THE HANDSOME</p>
							</ul>
			       		</div>
			    		<div class="gnb_sh_wrap" style="display:none;">
							<div class="gnb_sh_box">
								<input type="text" class="input" id="gnbsearchwords" title="검색어 입력" value="" onkeypress="if(event.keyCode==13) {EnterSearchHeader(); return false;}">
								<a href="" id="gnbsearch">검색</a>
							</div>
						</div>				
		                <div class="util_menu" style="display:block;">
							<ul class="clearfix">
								<sec:authorize access="isAnonymous()">
									<li>
										<a href="${pageContext.request.contextPath}/member/loginform">로그인</a>
									</li>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
									<li>
										<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
									</li>
								</sec:authorize>
								<li>
									<a href="${pageContext.request.contextPath}/member/orderlist">마이페이지</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
		
				<div class="gnbwarp com clearfix">
			        <h1 class="logo logo1903">
			            <a href="/" onclick="GA_Event('공통', '로고', '상단');">thehandsome.com</a>
			        </h1>
			        
			        <!-- category start -->
			        <div class="gnb_nav gnb_nav1903 hscene1906 hscene1910">
			            <h2 class="invisible">주메뉴</h2>
			            
			            <%-- 카테고리1 시작 --%>
			            <ul class="cate_m cate_banner gnbul1" id="cate_m_main">
			            	<li>
					           <a class="gnb_brand dropbtn dropbtn" id="cat1_k" onclick="dropBtnMouseover(this);" ondblclick="cat1DoubleClick(this);">KIDS</a>
					        </li> 
					        <li>
					           <a class="gnb_brand dropbtn dropbtn" id="cat1_l" onclick="dropBtnMouseover(this);" ondblclick="cat1DoubleClick(this);">LIFESTYLE</a>
					        </li> 
					        <li>
					           <a class="gnb_brand dropbtn dropbtn" id="cat1_w" onclick="dropBtnMouseover(this);" ondblclick="cat1DoubleClick(this);">WOMEN</a>
					        </li> 
					        <li>
					           <a class="gnb_brand dropbtn dropbtn" id="cat1_m" onclick="dropBtnMouseover(this);" ondblclick="cat1DoubleClick(this);">MEN</a>
					        </li> 
			            </ul>
			            <%-- 카테고리1 끝 --%>
				        
				        <ul class="cate_m cate_banner gnbul2" id="cate_m_main" style="float:right;">
				            <li><a href="" class="">기타1</a></li>
				            <li><a href="" class="">기타2</a></li>
				            <li><a href="" class="">기타3</a></li>
				            <li><a href="" class="">기타4</a></li>
				            <li><a href="" class="">기타5</a></li>
				            <li><a href="" class="">기타6</a></li>
				        </ul>
			        </div>
			        <!-- category end -->
			        
			        <script>
						function dropBtnMouseover(cat){
					        	  $(cat).css("color","gray");
					        	  let depth1 = $(cat).text();
					        	  
					        	  let kidC = true;
					        	  let lifeC = true;
					        	  let womenC = true;
					        	  let menC = true;
					        	  
					        	  //카테고리가 띄워져 있을 경우 제거
					        	  //보이지 않을경우 
					        	  //클릭한 요소가 본인일 경우 카테고리 사라지게
					        	  if($('#kidsCategory').css('display')==='block'){$('#kidsCategory').css("display", "none"); $('#cat1_k').css("color","black"); if(depth1 === "KIDS"){return;}}
					        	  if($('#lifestyleCategory').css('display')==='block'){$('#lifestyleCategory').css("display", "none"); $('#cat1_l').css("color","black"); if(depth1 === "LIFESTYLE"){return;}}
					        	  if($('#womenCategory').css('display')==='block'){$('#womenCategory').css("display", "none"); $('#cat1_w').css("color","black"); if(depth1 === "WOMEN"){return;}}
					        	  if($('#menCategory').css('display')==='block'){$('#menCategory').css("display", "none"); $('#cat1_m').css("color","black"); if(depth1 === "MEN"){return;}}
					        	  
					        	  
					        	  //아무 하위 카테고리도 띄워져있지 않은 경우
					        	  if(depth1 === "KIDS"){
					        		  if($('#kidsCategory').css('display')==='none'){
					        			  $('#kidsCategory').css("display", "block");
					        		  }else{
					        			  $('#kidsCategory').css("display", "none");
					        		  }
					        	  }else if(depth1 ==="LIFESTYLE"){
					        		  if($('#lifestyleCategory').css("display")==="none"){
					        			  $('#lifestyleCategory').css("display", "block");
					        		  }else{
					        			  $('#lifestyleCategory').css("display", "none");
					        		  }
					        	  }else if(depth1 ==="WOMEN"){
					        		  if($('#womenCategory').css("display")==="none"){
					        			  $('#womenCategory').css("display", "block");
					        		  }else{
					        			  $('#womenCategory').css("display", "none");
					        		  }
					        	  }else if(depth1 ==="MEN"){
					        		if($('#menCategory').css("display")==="none"){
					        			  $('#menCategory').css("display", "block");
					        		  }else{
					        			  $('#menCategory').css("display", "none");
					        		  }
					        	  }
					          }
						
						//카테고리1 더블클릭 처리
						//encoding Test :  > LONG/MAXI SKIRT
						function cat1DoubleClick(cat1){
							let depth1 = $(cat1).text();
							location.href = '${pageContext.request.contextPath}/product/'+depth1;
							
							//SLASH TEST
							//let depth3 = encodeURIComponent('LONG-MAXI SKIRT');
							//let loc = '${pageContext.request.contextPath}/product/WOMEN'+depth3;
							//location.href = '${pageContext.request.contextPath}/product/WOMEN/'+depth3;
						}
						
						
				         </script>

				    <div class="util_menu util_menu1803">
				        <ul class="clearfix">
				            <li>
				            	<a href="">
				            		<span class="ico_sh">search</span>
				            	</a>
				            </li>
				            <li>
				            	<a href="">
				            		<span class="ico wishlist">wish list</span>
				            		<span class="count" style="display:inline;">(<span id="wishlistCount">0</span>)</span>
				            	</a>
				            </li>
				            <li>
				            	<a href="${pageContext.request.contextPath}/cart/cartlist">
				            		<span class="ico cart">장바구니</span>
				            		<span class="count">(<span id="cartCount">0</span>)</span>
				            	</a>
				            </li>
				        </ul>
				    </div>
				</div>  
				
				<%-- 카테고리2,3 시작 --%>
				<%-- dropDown Menu start --%>
	           	<%-- <div class="" style="display: none;"> --%>
	           	<%-- KIDS 카테고리 --%>
	           	<div id="kidsCategory" class="drop_down_menu" style="display:none;">	           	   
	               <ul class="list-group list-group-horizontal drop_down_inner">                        
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/KIDS/CLOTHING">CLOTHING</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/KIDS/CLOTHING/TOP">TOP</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/KIDS/CLOTHING/BOTTOM">BOTTOM</a></li>
		                       </ul>
		                </li>
		                
		                <li class="drop_down_list"><strong><a  href="${pageContext.request.contextPath}/product/KIDS/KIDS ACC.">KIDS ACC.</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/KIDS/KIDS ACC./OTHER ACCESSORIES">OTHER ACCESSORIES</a></li>
		                       </ul>
		                </li>
	               </ul>
	           </div>
	           
	           <%-- LIFESTYLE 카테고리 --%>
	           	<div id="lifestyleCategory" class="drop_down_menu" style="display:none;">	           	   
	               <ul class="list-group list-group-horizontal drop_down_inner">                        
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/LIFESTYLE/HOME">HOME</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/LIFESTYLE/HOME/FABRIC">FABRIC</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/LIFESTYLE/HOME/OTHER ACCESSORIES">OTHER ACCESSORIES</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/LIFESTYLE/HOME/FRAGRANCE">FRAGRANCE</a></li>
		                       </ul>
		                </li>
		                
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/LIFESTYLE/BATH">BATH</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/LIFESTYLE/BATH/OTHER ACCESSORIES">OTHER ACCESSORIES</a></li>
		                       </ul>
		                </li>
	               </ul>
	           </div>
	           
	           	<%-- WOMEN 카테고리 --%>
	           	<div id="womenCategory" class="drop_down_menu" style="display:none;">	           	   
	               <ul class="list-group list-group-horizontal drop_down_inner">                        
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/WOMEN/PANTS">PANTS</a></strong>
		                       <ul class="depth3_wrap">
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/PANTS/SHORTS">SHORTS</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/PANTS/CASUAL">CASUAL</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/PANTS/FORMAL">FORMAL</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/PANTS/DENIM">DENIM</a></li>
		                       </ul>
		                </li>
		                
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/WOMEN/SKIRT">SKIRT</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SKIRT/MINI SKIRT" >MINI SKIRT</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SKIRT/PENCIL SKIRT" >PENCIL SKIRT</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SKIRT/FLARE SKIRT" >FLARE SKIRT</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SKIRT%20LONG FMAXI SKIRT" >LONG/MAXI SKIRT</a></li>
		                       </ul>
		                </li>
		                
		                <li class="drop_down_list"><strong><a href=""><a href="${pageContext.request.contextPath}/product/WOMEN/FASHION ACC.">FASHION ACC.</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/FASHION ACC./BAGS">BAGS</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/FASHION ACC./ETC">ETC</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/FASHION ACC./SCARF%20MUFFLER">SCARF/MUFFLER</a></li>
		                       </ul>
		                </li>
		                
		                <li class="drop_down_list"><strong><a href=""><a href="${pageContext.request.contextPath}/product/WOMEN/DRESS">DRESS</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/DRESS/MINI DRESS">MINI DRESS</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/DRESS/MIDI DRESS">MIDI DRESS</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/DRESS/LONG%20MAXI DRESS">LONG/MAXI DRESS</a></li>
		                       </ul>
		                </li>
		                
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/WOMEN/Top">Top</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/Top/Blouse">Blouse</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/Top/T-Shirts">T-Shirts</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/Top/Knit">Knit</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/Top/Shirts">Shirts</a></li>
		                       </ul>
		                </li>
		                
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/WOMEN/OUTER">OUTER</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/OUTER/JUMPER">JUMPER</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/OUTER/Cardigan%20Vest">Cardigan/Vest</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/OUTER/JACKET">JACKET</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/OUTER/TRENCH COAT">TRENCH COAT</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/OUTER/COAT">COAT</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/OUTER/DOWN JUMPER">DOWN JUMPER</a></li>
		                       </ul>
		                </li>
		                
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP">SPECIAL SHOP</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/LANVIN COLLECTION : IT. 1">LANVIN COLLECTION : IT. 1</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/LANVIN COLLECTION : IT. 1">LANVIN COLLECTION : IT. 1</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/SJSJ : piknic collection">SJSJ : piknic collection</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/SYSTEM : MONOCROME">SYSTEM : MONOCROME</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/O'2nd : M%20M (PARIS)">O'2nd : M/M (PARIS)</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/O'2nd : WE">O'2nd : WE</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/OBZEE : ICONIC OBZEE">OBZEE : ICONIC OBZEE</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/SYSTEM : PARIS PT">SYSTEM : PARIS PT</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/the CASHMERE : WELLNESS LINE">the CASHMERE : WELLNESS LINE</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/LATT : FW 온라인 단독">LATT : FW 온라인 단독</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/CODE MINE M (ME)">CODE MINE M (ME)</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/TIME : ONLINE EXCLUSIVE">TIME : ONLINE EXCLUSIVE</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/TIME SIGNATURE SUIT">TIME SIGNATURE SUIT</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/SYSTEM : SYSTEM X 노상호">SYSTEM : SYSTEM X 노상호</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/MINE : CODE MINE A (ATELIER)">MINE : CODE MINE A (ATELIER)</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/SYSTEM : A TOUCH OF ELEGANCE">SYSTEM : A TOUCH OF ELEGANCE</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/FOURM STUDIO : RE:STUDIO">FOURM STUDIO : RE:STUDIO</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/FOURM THE STORE : PALETTE">FOURM THE STORE : PALETTE</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/LATT : New Leisure Essential">LATT : New Leisure Essential</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/OBZEE : ESSENTIAL">OBZEE : ESSENTIAL</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/TIME : 1993 CLUB">TIME : 1993 CLUB</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/WOMEN/SPECIAL SHOP/tomgreyhound: THE GREY">tomgreyhound: THE GREY</a></li>
		                       </ul>
		                </li>
	               </ul>
	           </div>
	           
	           <%-- MEN 카테고리 --%>
	           	<div id="menCategory" class="drop_down_menu" style="display:none;">	           	   
	               <ul class="list-group list-group-horizontal drop_down_inner">                        
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/MEN/TOP">TOP</a></strong>
		                       <ul class="depth3_wrap">
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/TOP/KNIT">KNIT</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/TOP/SHIRTS">SHIRTS</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/TOP/T-SHIRTS">T-SHIRTS</a></li>
		                       </ul>
		                </li>
		                
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/MEN/PANTS">PANTS</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/PANTS/쇼츠" >쇼츠</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/PANTS/루즈%20테이퍼드" >루즈/테이퍼드</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/PANTS/데님" >데님</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/PANTS/조거%20트랙" >조거/트랙</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/PANTS/스트레이트" >스트레이트</a></li>
		                       </ul>
		                </li>
		                
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/MEN/Suit">Suit</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/Suit/SUIT PANTS">SUIT PANTS</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/Suit/DRESS SHIRTS">DRESS SHIRTS</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/Suit/SUIT JACKET">SUIT JACKET</a></li>
		                       </ul>
		                </li>
		                
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/MEN/OUTER">OUTER</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/OUTER/JUMPER">JUMPER</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/OUTER/JACKET">JACKET</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/OUTER/CARDIGAN%20VEST">CARDIGAN/VEST</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/OUTER/TRENCH COAT">TRENCH COAT</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/OUTER/COAT">COAT</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/OUTER/DOWN JUMPER">DOWN JUMPER</a></li>
		                       </ul>
		                </li>
		                
		                <li class="drop_down_list"><strong><a href="${pageContext.request.contextPath}/product/MEN/SPECIAL SHOP">SPECIAL SHOP</a></strong>
		                       <ul class="depth3_wrap">
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/SPECIAL SHOP/SYSTEM HOMME : TYPE 2">SYSTEM HOMME : TYPE 2</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/SPECIAL SHOP/TIME HOMME : ONLINE EXCLUSIVE">TIME HOMME : ONLINE EXCLUSIVE</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/SPECIAL SHOP/CLUB MONACO : COATS FOR MEN">CLUB MONACO : COATS FOR MEN</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/SPECIAL SHOP/CLUB MONACO : 폴로 한잔의 여유">CLUB MONACO : 폴로 한잔의 여유</a></li>
				                 	<li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/SPECIAL SHOP/SYSTEM HOMME : PARIS PT">SYSTEM HOMME : PARIS PT</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/SPECIAL SHOP/SYSTEM HOMME : SYSTEM X 275C">SYSTEM HOMME : SYSTEM X 275C</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/SPECIAL SHOP/THEHANDSOME 5TH : %23 WITH US">THEHANDSOME 5TH : # WITH US</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/SPECIAL SHOP/SYSTEM HOMME : (NEW) SWEATS">SYSTEM HOMME : (NEW) SWEATS</a></li>
				                    <li class="depth3_element"><a class="depth3" href="${pageContext.request.contextPath}/product/MEN/SPECIAL SHOP/TIME HOMME THE GENTLE%20">TIME HOMME THE GENTLE</a></li>
		                       </ul>
		                </li>
	               </ul>
	           </div>
	           
	          <%-- dropDown Menu end --%>
	          <%-- 카테고리2,3 끝 --%>
		    </div>
		</div>
		<%-- headerWrap 끝 --%>
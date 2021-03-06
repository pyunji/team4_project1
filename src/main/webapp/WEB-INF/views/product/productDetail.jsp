<%@page import="com.mycompany.webapp.dto.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/headerAboveLinks.jsp"%>
<%@ include file="/WEB-INF/views/special/productDetailLinks.jsp"%>
<%@ include file="/WEB-INF/views/common/headerBelowLinks.jsp"%>

<%
Product p = (Product) request.getAttribute("product");
int initPrice = p.getProductColor().getPrice();
%>
<script>
	//DOM구조 로딩된 이후 실행
	$(document).ready(function() {
		$("#sumPrice").text("₩" + (<%=initPrice%>).toLocaleString());
		let quantity = $('#quantity').val();
		$("#cartQuantity").attr("value", quantity);
		//hidden 전달 값 반영
		let stockId = $("#pstockId").text();
		let commonId = stockId.split("_")[0];
		$("#productCommonId").attr("value", commonId);
		
		//author : 채연
		//stock 0 이하시 alert창 띄우기
		/*재고가 0 이하인 상품이 있을경우 input의 hidden타입인 emptyStock을 생성하여 
		그 값을 기준으로 alert창 여부를 확인한다.*/
		let isEmtyStock = $("#emptyStock").val();
		console.log("isEmpty",isEmtyStock);
		if(isEmtyStock ==="emptyStock"){//재고가 0이하인 상품이 존재할 경우. alert창을  사용자화면에 띄운다.)
			$("#alertStock").css("display", "block");
		}
	});
	
	//form submit
	//장바구니 버튼 클릭시 실행
	function submitCart() {
		//사이즈의 체크 여부 점검
		let size = $("input[name=size]:checked").val();
		console.log("size =", size);
		if(size === undefined){//사이즈가 체크되어있지 않을 경우
			alert("사이즈를 선택해주세요.");
			//location.reload();//값이 변경되는게 아니기 때문에 reload 제외
		}else{//사이즈가 체크되어있을 경우 submit()한다.
			$("#addToCartForm")[0].submit();
		}	
	}
	// 사이즈 선택 시 품번에 반영되게 함
	function changePstockId(pcId, sizeCode) {
		console.log("pcId : ", pcId);
		console.log("sizeCode: ", sizeCode);
		$("#pstockId").text(pcId + '_' + sizeCode);
		
		//hidden productStockId, sizeode 전달 값 반영
		$("#productStockId").attr("value", pcId + '_' + sizeCode);
		$("#sizeCode").attr("value", sizeCode);
	}
	function quantity_control(e, operator) {
		let obj = $(e).siblings("input")[0];
		let value = Number($(obj).val());
		if (operator === 'minus') {
			if (value > 1) {
				console.log("실행");
				$(obj).attr("value", value - 1);
				$("#hiddenQuantity").attr("value",Number(value-1));//hidden의 Quantity값 변경
			}
		} else if (operator === 'plus') {
			console.log("실행");
			$(obj).attr("value", value + 1);
			$("#hiddenQuantity").attr("value",Number(value+1));//hidden의 Quantity값 변경
		}
	}
	
	function priceByQuantity(price) {
		var productQuantity = $("#quantity").val();
		var productPrice = Number(price);
		$("#sumPrice").text('₩' + (productQuantity * productPrice).toLocaleString());
	}
	
	
	
</script>

<body oncontextmenu="return false" style="">
	<!-- csrf 토큰 -->
	<form id="CSRFForm" action="csrfToken" method="post">
		<div></div>
	</form>

	<div id="bodyWrap" class="item_detail">

		<div class="adaptive_wrap">
			<div class="clearfix prd_detail1905" id="clearfix">
				<div class="clearfix image_view3">
					<div class="image_view1" id="image_view1">
						<div class="detailimg" id="detailimg">
							<ul style="display: inline;">
								<li>
									<img src="${product.productColor.img1}" class="respon_image">
								</li>
								<li>
									<img src="${product.productColor.img2}" class="respon_image">
								</li>
								<li>
									<img src="${product.productColor.img3}" class="respon_image">
								</li>
							</ul>
						</div>
					</div>
				</div>


				<div class="item_detail_info float_right" id="contentDiv" style="margin-top: 20px; top: 0px; left: 638px;">
					<div class="info">
						<div class="info_sect">
							<h4 class="item_name">
								<div class="brand-name">
									<a href="javascript:fn_goCategori('br31')" onclick="GA_Detail('brand',$(this))">${product.brand.name}</a>
								</div>
								<span class="name ko_fir_spel">
									${product.productCommon.name}
									<input type="hidden" id="brandName" value="LÄTT">
								</span>
							</h4>

							<p class="price">
								<span>
									₩
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.productColor.price}" />
								</span>
							</p>
							<div class="prod-detail-con-box">
								<strong class="number-code">
									상품품번 :
									<span id="pstockId">${product.productColor.id}</span>
								</strong>
								<div class="round-style">
									<p>${product.productCommon.note}</p>
								</div>
							</div>
						</div>

						<div class="info_sect">
							<ul class="point_delivery">
								<li>
									<span class="title">배송비</span>
									<span class="txt">30,000원 이상 무료배송 (실결제 기준)</span>
								</li>
							</ul>
						</div>

						<div class="info_sect">
							<ul class="color_size_qty">
								<li>
									<span class="title">색상</span>
									<div class="btn-group btn-group-toggle color-buttons" data-toggle="buttons">
										<ul class="color_chip clearfix">
											<c:forEach var="color" items="${colors}">
												<li>
													<label class="btn btn-outline-secondary btn-sm" style="content: url('${color.colorImg}');">
														<!-- 현재 색상과 일치할 경우 디폴트로 체크되어있게 함 -->
														<input type="radio" style="display: none;" name="color" value="${color.colorCode}" onclick="location.href='${product.productCommon.id}_${color.colorCode}'" <c:if test="${color.colorCode eq product.productColor.colorCode}">checked</c:if> />
													</label>
												</li>
											</c:forEach>
										</ul>
									</div>
									<span class="cl_name" id="colorNameContent"></span>
								</li>
								<li>
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<span class="title">사이즈</span>
										<ul class="size_chip clearfix sizeChipKo1901">
											<c:forEach var="stock" items="${stocks}">
												<li id="${product.productColor.id}_${stock.sizeCode}">
													<!-- 재고 0개 이하일 경우 disabled 처리 및 경고창 띄우기 -->
													<c:if test="${stock.stock <= 0}">
														<label style="background-color: #dddddd;" class="btn btn-outline-secondary btn-lg">
															<input type="radio" style="display: none;" name="size" value="${stock.sizeCode}" disabled="disabled"/>${stock.sizeCode}
															<!-- 작은따옴표 안붙여주면 에러남 -->
														</label>
														<!-- stock의 재고가 0개 이하인 경우 hidden 값으로 체크한다. -->
														<input type="hidden" id="emptyStock" value="emptyStock">
													</c:if>
													<c:if test="${stock.stock > 0}">
														<label class="btn btn-outline-secondary btn-lg">
															<input type="radio" style="display: none;" name="size" value="${stock.sizeCode}" onclick="changePstockId('${product.productColor.id}', '${stock.sizeCode}')" />${stock.sizeCode}
															<!-- 작은따옴표 안붙여주면 에러남 -->
														</label>
													</c:if>
												</li>
											</c:forEach>
											<!-- DOM구조가 로드되었을 때 hidden의 재고가 존재하지 않는 상품이 있으면 경고창을 띄워준다. -->
											<li style="display: block;">
												<a id="alertStock">일부 상품의 재고가 존재하지 않습니다.</a>
											</li>
										</ul>
									</div>
								</li>
								<li>
									<span class="title" >수량</span>
									<span class="txt">
										<span>
											<button onclick="quantity_control(this, 'minus'); priceByQuantity(${product.productColor.price})" style="margin: 0px;" type="button" class="btn btn-light left1">-</button>
											<input id="quantity" name="quantity" type="text"  class="mr0" value="1" size="1" maxlength="3" readonly="readonly"/>
											<button onclick="quantity_control(this, 'plus'); priceByQuantity('${product.productColor.price}')" style="margin: 0px;" type="button" class="btn btn-light right1">+</button>
										</span>
									</span>
								</li>
							</ul>
						</div>
						<div class="total_price clearfix">
							<div class="title float_left" style="width: auto;">총 합계</div>
							<div class="pirce">
								<span id="sumPrice">₩${product.productColor.price}</span>
							</div>
						</div>


						<div class="btnwrap clearfix" style="position: absolute; width: 473px; margin-top: 0px; margin-bottom: 0px;">

							<form id="addToCartForm"  name="addToCartForm" action="${pageContext.request.contextPath}/cart" method="post">
								<!-- 장바구니 추가 및 리스트 확인을 위한 데이터 담기 시작 -->
								<input type="hidden" id="productStockId" name="productStockId" value="${product.productStock.id}">
								<input type="hidden" id="sizeCode" name="sizeCode" value="${product.productStock.sizeCode}">
								<input type="hidden" name="productColorId" value="${product.productColor.id}">
								<input type="hidden" name="img1" value="${product.productColor.img1}">
								<input type="hidden" name="img2" value="${product.productColor.img2}">
								<input type="hidden" name="img3" value="${product.productColor.img3}">
								<input type="hidden" id="productCommonId" name="productCommonId" value="${product.productColor.productCommonId}">
								<input type="hidden" name="colorCode" value="${product.productColor.colorCode}">
								<input type="hidden" name="price" value="${product.productColor.price}">
								<input type="hidden" name="name" value="${product.productCommon.name}">
								<input type="hidden" name="brandNo" value="${product.productCommon.brandNo}">
								<input type="hidden" name="brandName" value="${product.brand.name}">
								<input type="hidden" id="hiddenQuantity" name="quantity" value="1">
								<!-- 장바구니 추가 및 리스트 확인을 위한 데이터 담기 끝 -->
								<input type="button" value="장바구니 담기" class="cartbtn" id="addToCartButton" onclick="submitCart()">
								<%-- <input type="button" value="쇼핑백 담기" class="cartbtn" id="addToCartButton" onclick="location.href='${pageContext.request.contextPath}/cart/cartlist';"> --%>
								<!-- csrf 토큰 -->
								<div>
									<input type="hidden" name="CSRFToken" value="">
								</div>
							</form>
						</div>
						</br>

						<div class="related_evt" style="margin-bottom: 75px;">
							<div class="cd-n-lb-tab" id="codi_lookbook_tab" style="">
								<ul>
									<li class="on">
										<a href="" onclick="">함께 코디한 상품</a>
									</li>
								</ul>
							</div>

							<!-- box1 -->
							<div class="cd-n-lb-content-box" id="cd-n-lb-tab-01" style="display: block;">
								<div class="matches_list together-codi-list" id="referencesListContent">
									<!-- 										<ul class="clearfix slides"> -->
									<c:forEach var="withItem" items="${withItems}">
										<li id="prod_YN2B8KCD922W_YN" style="margin-right: 10px;">
											<div class="together-codi-pic">
												<a href="/product/set/${withItem.productColor.id}" onclick="" class="pic">
													<img src="${withItem.productColor.img1}" alt="코디상품" class="respon_image">
												</a>
											</div>
											<span class="info_wrap item_info2">
												<span class="brand BR35">${withItem.brand.name}</span>
												<span class="title">${withItem.productCommon.name}</span>
												<span class="price">
													₩
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${withItem.productColor.price}" />
												</span>
											</span>
										</li>

									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;"></iframe>
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
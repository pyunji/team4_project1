package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Color;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Size;
import com.mycompany.webapp.service.CartService;
import com.mycompany.webapp.vo.Cart;
import com.mycompany.webapp.vo.Category;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Resource private CartService cartService;
	
	@GetMapping("")
	public String cartList(Model model, Principal principal) {
		logger.info("실행");
		String mid = principal.getName();
		List<Product> cartItems = cartService.getList(mid);
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("cartSize", cartItems.size());
		
		return "cart/cartList";
	}
	
	@PostMapping("/update/quantity")
	public String updateQuantity(@RequestParam int quantity, @RequestParam String pstockId, 
			Principal principal) {
		String mid = principal.getName();
		cartService.updateQuantity(quantity, pstockId, mid);
		return "redirect:/cart";
	}
	
	@PostMapping("/update/options")
	public String updateOptions(@RequestParam String color, @RequestParam String size,
			@RequestParam String pcommonId, @RequestParam String pstockId,
			Principal principal) {
		String mid = principal.getName();
		cartService.updateOptions(color, size, pcommonId, pstockId, mid);
		return "redirect:/cart";
	}
	
	@RequestMapping("/selectOptions")
	public String selectOptions(Model model, String pcommonId){
		logger.info("실행");
		List<Color> colors = cartService.getColors(pcommonId);
		model.addAttribute("colors", colors);
		List<Size> sizes = cartService.getSizes(pcommonId);
		model.addAttribute("sizes", sizes);
		return "cart/options";
	}
	
	@RequestMapping("/selectColors")
	public String selectColors(Model model, String pcommonId){
		logger.info("실행");
		List<Color> colors = cartService.getColors(pcommonId);
		model.addAttribute("colors", colors);
		return "cart/colors";
	}
	
	@RequestMapping("/selectSizes")
	public String selectSizes(Model model, String pcommonId ) {
		List<Size> sizes = cartService.getSizes(pcommonId);
		model.addAttribute("sizes", sizes);
		return "cart/sizes";
	}
	
	@RequestMapping("/set/{pcolorId}")
	public String setCategoryAndReturn(@PathVariable String pcolorId) {
		Category category = cartService.setCategories(pcolorId);
		String depth1Name = category.getDepth1Name();
		String depth2Name = category.getDepth2Name();
		String depth3Name = category.getDepth3Name();
		String redirect = "redirect:/product/"+depth1Name+"/"+depth2Name+"/"+depth3Name+"/"+pcolorId;
		return redirect;
	}
	
	@PostMapping("/delete")
	public String deleteCartItem(Principal principal, @RequestParam("hidden_pcolorId") String pcolorId,
			@RequestParam("hidden_size_code") String sizeCode) {
		String mid = principal.getName();
		String pstockId = pcolorId + "_" + sizeCode;
		Cart cart = new Cart();
		cart.setMemberId(mid);
		cart.setProductStockId(pstockId);
		cartService.deleteCart(cart);
		logger.info("pcolorId: "+ pcolorId);
		logger.info("sizeCode: "+ sizeCode);
		return "redirect:/cart";
	}
}

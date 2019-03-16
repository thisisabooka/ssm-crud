package com.baizhi.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.baizhi.ssm.bean.Product;
import com.baizhi.ssm.service.ProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
//	reseful风格uri
/*	GetMapping()
	PostMapping()
	PutMapping()
	DeleteMapping()*/
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
//		pageNum页码,pageSize每页记录数
		PageHelper.startPage(pn, 10);
//		这就是一个分页查询了
		List<Product> productList = productService.getAll();
//		里面包含了详细的分页信息；传入连续显示的页数5
		PageInfo pageInfo = new PageInfo(productList,5);
//		返回数据给前端页面
		model.addAttribute("pageInfo", pageInfo);
		return "list";
	}
	
	
//	来到添加页面
	@RequestMapping(value="/product",method=RequestMethod.GET)
	public String toAddPage() {
		return "add";
	}
	
//	添加商品
	@RequestMapping(value="/product",method=RequestMethod.POST)
	public String addProduct(Product product) {
		System.out.println("添加的商品信息"+product);
		productService.addProduct(product);
		return "redirect:/list";
	}
	
//	来到修改页面
	@RequestMapping(value="/product/{id}",method=RequestMethod.GET)
	public String toEditPage(@PathVariable("id")Integer id,Model model) {
		Product product = productService.findOne(id);
		model.addAttribute("product", product);
		return "update";
	}
	
//	修改商品
	@RequestMapping(value="/product",method=RequestMethod.PUT)
	public String updateProduct(Product product) {
		System.out.println("修改的员工信息"+product);
		productService.modifyProduct(product);
		return "redirect:/list";
	}
	
//	删除商品
	@RequestMapping(value="/product/{id}",method=RequestMethod.DELETE)
	public String deleteProduct(@PathVariable("id")Integer id) {
		productService.deleteProduct(id);
		return "redirect:/list";
	}
	
	
	
}

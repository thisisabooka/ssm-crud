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
	
//	reseful���uri
/*	GetMapping()
	PostMapping()
	PutMapping()
	DeleteMapping()*/
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
//		pageNumҳ��,pageSizeÿҳ��¼��
		PageHelper.startPage(pn, 10);
//		�����һ����ҳ��ѯ��
		List<Product> productList = productService.getAll();
//		�����������ϸ�ķ�ҳ��Ϣ������������ʾ��ҳ��5
		PageInfo pageInfo = new PageInfo(productList,5);
//		�������ݸ�ǰ��ҳ��
		model.addAttribute("pageInfo", pageInfo);
		return "list";
	}
	
	
//	�������ҳ��
	@RequestMapping(value="/product",method=RequestMethod.GET)
	public String toAddPage() {
		return "add";
	}
	
//	�����Ʒ
	@RequestMapping(value="/product",method=RequestMethod.POST)
	public String addProduct(Product product) {
		System.out.println("��ӵ���Ʒ��Ϣ"+product);
		productService.addProduct(product);
		return "redirect:/list";
	}
	
//	�����޸�ҳ��
	@RequestMapping(value="/product/{id}",method=RequestMethod.GET)
	public String toEditPage(@PathVariable("id")Integer id,Model model) {
		Product product = productService.findOne(id);
		model.addAttribute("product", product);
		return "update";
	}
	
//	�޸���Ʒ
	@RequestMapping(value="/product",method=RequestMethod.PUT)
	public String updateProduct(Product product) {
		System.out.println("�޸ĵ�Ա����Ϣ"+product);
		productService.modifyProduct(product);
		return "redirect:/list";
	}
	
//	ɾ����Ʒ
	@RequestMapping(value="/product/{id}",method=RequestMethod.DELETE)
	public String deleteProduct(@PathVariable("id")Integer id) {
		productService.deleteProduct(id);
		return "redirect:/list";
	}
	
	
	
}

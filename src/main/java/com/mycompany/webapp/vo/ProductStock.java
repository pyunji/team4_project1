package com.mycompany.webapp.vo;

import lombok.Data;

@Data
public class ProductStock {
	private String id;
	private String productColorId;
	private String size;
	private int stock;
}

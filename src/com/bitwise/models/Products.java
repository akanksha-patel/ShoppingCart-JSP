package com.bitwise.models;

import java.util.ArrayList;
import java.util.List;

public class Products {
	
	private List<Product> list = new ArrayList<Product>();
	
	public List<Product> getList() {
		return list;
	}

	public Products () {
		this.init();
	}
	
	public void init () {
		String [] names = {
				"Mac Lipstick",
				"Mac Lipliner",
				"Mac EyeShadow",
				"Mac NailPolish",
				"Mac NailPaintRemover",
				"Mac EyeLiner",
				"Mac Cleanser",
				"Mac SunsCream"
		};
		float [] prices = {
				999.00f, 
				1500.00f,
				500.00f,
				900.00f,
				400.00f,
				1200.00f,
				1000.00f,
				800.00f
		};
		
		for (int i=0; i < names.length; i++) {
			list.add(new Product(names[i], prices[i]));
		}
	}
	

}

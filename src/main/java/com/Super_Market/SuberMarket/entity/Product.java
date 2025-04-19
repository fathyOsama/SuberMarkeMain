package com.Super_Market.SuberMarket.entity;

import jakarta.persistence.*;

@Entity
@Table(name="product")
public class Product {

	// define fields

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;

	@Column(name = "Product_image")
	private String ProductImage;

	@Column(name="Product_name")
	private String ProductName;

	@Column(name="Product_type")
	private String ProductType;

	@Column(name="expiry_data")
	private String ExpriryData;

	@Column(name = "Product_price")
	private double ProductPrice;


	// define constructors

	public Product() {
	}

	public Product(int id, String productImage, String productName, String productType, String expriryData, double productPrice) {
		this.id = id;
		ProductImage = productImage;
		ProductName = productName;
		ProductType = productType;
		ExpriryData = expriryData;
		ProductPrice = productPrice;
	}

// define getter/setter

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductImage() {
		return ProductImage;
	}

	public void setProductImage(String productImage) {
		ProductImage = productImage;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
	}

	public String getProductType() {
		return ProductType;
	}

	public void setProductType(String productType) {
		ProductType = productType;
	}

	public String getExpriryData() {
		return ExpriryData;
	}

	public void setExpriryData(String expriryData) {
		ExpriryData = expriryData;
	}

	public double getProductPrice() {
		return ProductPrice;
	}

	public void setProductPrice(double productPrice) {
		ProductPrice = productPrice;
	}

// define tostring


	@Override
	public String toString() {
		return "Product{" +
				"id=" + id +
				", ProductImage='" + ProductImage + '\'' +
				", ProductName='" + ProductName + '\'' +
				", ProductType='" + ProductType + '\'' +
				", ExpriryData='" + ExpriryData + '\'' +
				", ProductPrice='" + ProductPrice + '\'' +
				'}';
	}
}












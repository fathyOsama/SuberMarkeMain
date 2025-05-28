package com.Super_Market.SuberMarket.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import org.springframework.security.core.userdetails.User;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="product")
public class product {

	// define fields

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;

	@Column(name = "Product_image")
	private String productImage;

	@Column(name="Product_name")
	private String productName;

	@Column(name="Product_type")
	private String productType;

	@Column(name="expiry_data")
	private String expriryData;

	@Column(name = "Product_price")
	private double productPrice;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<productImage> images;



	// define constructors


	public product() {
	}

	public product( String productImage, String productName, String productType, String expriryData, double productPrice) {
		this.productImage = productImage;
		this.productName = productName;
		this.productType = productType;
		this.expriryData = expriryData;
		this.productPrice = productPrice;
	}

// define getter/setter



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getExpriryData() {
		return expriryData;
	}

	public void setExpriryData(String expriryData) {
		this.expriryData = expriryData;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public List<com.Super_Market.SuberMarket.entity.productImage> getImages() {
		return images;
	}

	public void setImages(List<com.Super_Market.SuberMarket.entity.productImage> images) {
		this.images = images;
	}



// define tostring


	@Override
	public String toString() {
		return "Product{" +
				"id=" + id +
				", ProductImage='" + productImage + '\'' +
				", ProductName='" + productName + '\'' +
				", ProductType='" + productType + '\'' +
				", ExpriryData='" + expriryData + '\'' +
				", ProductPrice='" + productPrice + '\'' +
				'}';
	}
}












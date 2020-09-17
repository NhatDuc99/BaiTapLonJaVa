/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class Product {

    private String id;
    private String name;
    private int quantity;
    private float price;
    private TypeProduct tp;
    private Brand br;
    private String image;

    public Product() {
    }

    public Product(String id, String name, int quantity, float price, TypeProduct tp, Brand br, String image) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.tp = tp;
        this.br = br;
        this.image = image;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public TypeProduct getTp() {
        return tp;
    }

    public void setTp(TypeProduct tp) {
        this.tp = tp;
    }

    public Brand getBr() {
        return br;
    }

    public void setBr(Brand br) {
        this.br = br;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}

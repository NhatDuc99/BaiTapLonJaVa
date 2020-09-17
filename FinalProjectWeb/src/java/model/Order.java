/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author admin
 */
public class Order {

    private int id;
    private Customer customer;
    private Product product;
    private boolean status;

    public Order() {
    }

    public Order(int id, Customer customer, Product product, boolean status) {
        this.id = id;
        this.customer = customer;
        this.product = product;
        this.status = status;
    }

    public Order(Customer customer, Product product, boolean status) {
        this.id = id;
        this.customer = customer;
        this.product = product;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}

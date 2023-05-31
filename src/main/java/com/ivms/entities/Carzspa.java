package com.ivms.entities;

import javax.persistence.*;

@Entity
@NamedQuery(name="Carzspa.fetchAll",
        query = "SELECT OBJECT(c) FROM Carzspa c")
public class Carzspa {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @Basic
    @Column(name = "name")
    private String name;
    @Basic
    @Column(name = "category")
    private String category;
    @Basic
    @Column(name = "quantity")
    private int quantity;
    @Basic
    @Column(name = "costPrice")
    private double costPrice;
    @Basic
    @Column(name = "sellingPrice")
    private double sellingPrice;

    public int getId() {

        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(double costPrice) {
        this.costPrice = costPrice;
    }

    public double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    @Override
    public String toString()
    {
        return "Carzspa{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", category='" + category + '\'' +
                ", quantity=" + quantity +
                ", costPrice=" + costPrice +
                ", sellingPrice=" + sellingPrice +
                '}';
    }
}

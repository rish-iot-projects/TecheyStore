import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

interface Product {
  id: number;
  sku: string;
  name: string;
  category: string;
  price: number;
  stock: number;
  description: string;
}

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styles: []
})
export class ProductsComponent implements OnInit {
  products: Product[] = [];
  externalProducts: { sku: string; name: string; price: number }[] = [];

  constructor(private http: HttpClient) {}

  ngOnInit() {
    // Fetch local electronics
    this.http.get<Product[]>('http://localhost:3000/api/products').subscribe(data => {
      this.products = data;
    });

    // Fetch external electronics
    this.http
      .get<{ sku: string; name: string; price: number }[]>('http://localhost:3000/api/external/electronics')
      .subscribe(data => {
        this.externalProducts = data;
      });
  }

  placeOrder(productId: number) {
    this.http
      .post('http://localhost:3000/api/orders', { product_id: productId, quantity: 1 })
      .subscribe(response => {
        alert('Order placed!');
      });
  }
}

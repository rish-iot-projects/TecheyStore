import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { ProductsComponent } from './products/products.component';
import { OrderComponent } from './order/order.component';

@NgModule({
  declarations: [AppComponent, HomeComponent, ProductsComponent, OrderComponent],
  imports: [BrowserModule, HttpClientModule, AppRoutingModule],
  bootstrap: [AppComponent],
})
export class AppModule {}

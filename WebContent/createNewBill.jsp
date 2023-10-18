<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="css/style_main.css" />
  </head>
  <body>
    <div id="main-content">
      <div class="heading">Create New Bill <br /></div>
      <!-- Add item form -->
      <div class="form-container">
        <form class="item-form" method="POST" action="">
          <label>Item Description</label>
          <input type="text" name="desc" placeholder="Enter Item description" />
          <br />
          <label>Service Type</label>
          <select id="service" name="Service Type">
            <option value="dry_clean">Dry Clean</option>
            <option value="bulk">Bulk laundry</option>
          </select>
          <label>Quantity</label>
          <input type="text" placeholder="Enter Qunatity" id="quantity" />
          <label>Unit Price</label>
          <select id="prices" name="Prices"></select>
          <br />
          <input type="submit" value="Add" />
        </form>
      </div>
      <!-- Show added items table -->
      <div class="item-table">
      Item Table goes here
      </div>


<!-- Payment Amount -->
      <div class="payment-container">
      Final Amount:
      <br>
      Min Payment:
      </div>
      <div class="buttons">
        <!-- Checkout button -->
        <button id="checkout" value="checkout">Checkout</button>
        <!-- Discard items button -->
        <button id="checkout" value="checkout">Discard</button>
      </div>
    </div>
  </body>
</html>

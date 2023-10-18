<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Manage Prices</title>
    <script src="js/scripts.js"></script>
  </head>
  <body>
    <!--main content-->
    <main class="main">
      <div id="main-content">
        <!-- add new price -->
        <div class="add-price">
          <div class="price-header">Add New Price</div>
          <!-- form add new price -->
          <form class="price-form" method="post" action="">
            <label>Service type</label>
            <select
              name="service"
              id="service"
              onchange="changeFormContentPrices()"
            >
              <option value="dry_clean" selected>Dry Clean</option>
              <option value="bulk">Bulk laundry</option>
            </select>
            <br />
            <div id="dry-clean" style="display: block">
              <label>Item name</label>
              <input type="text" name="iname" placeholder="Enter item name" />
              <br />
              <label>Item price(rs)</label>
              <input
                type="number"
                name="iprice"
                placeholder="Enter item name"
              />
              <br />
              <input type="submit" value="add" />
            </div>
            <div id="bulk" style="display: none">
              <label>Weight(in kilos)</label>
              <input
                type="number"
                name="weight"
                placeholder="Enter item name"
              />
              <br />
              <label>Item price(rs)</label>
              <input
                type="number"
                name="iprice"
                placeholder="Enter item name"
              />
              <br />
              <input type="submit" value="add" />
            </div>
          </form>
        </div>

        <!--show, edit and delete price - BULK -->
        <div class="bulk-table">
          <table border="1" cellpadding="5px">
            <caption>
              Bulk Prices
            </caption>
            <tr>
              <th>Amount of Kilos</th>
              <th>Price</th>
            </tr>

            <!-- Get prices -->
          </table>
        </div>
        <!--show, edit and delete price - DRY CLEAN-->
        <div class="dryclean-table">
          <table border="1" cellpadding="5px">
            <caption>
              Dry Clean Prices
            </caption>
            <tr>
              <th>Amount of Kilos</th>
              <th>Price</th>
            </tr>

            <!-- Get prices -->
          </table>
        </div>
      </div>
    </main>
  </body>
</html>

<html>
<%@ include file="header.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ivms.entities.Carzspa" %>
<body>
<div class="col_center pd_md">
<h2 class="mg-sm text_center mg_b_xs">Partsomatic.Co</h2>
    <p> Tough on Dirt, Gentle on Spare Parts </p>
    <br>  </br>
    <form action="new">
            <button class="btn btn-outline-primary"><i class="fa-solid fa-plus mg_r_sm"></i>Add Product</button>
    </form>
</div>
<hr/>
<div class="container">
   <div class="w_100 col_center mg_v_lg">

   <%-- <p> Welcome! ${name} </p> --%>
    </div>
    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col">#Id</th>
          <th scope="col">Name</th>
          <th scope="col">Category</th>
          <th scope="col">Quantity</th>
          <th scope="col">CostPrice</th>
          <th scope="col">SellingPrice</th>
          <th scope="col">Action</th>
        </tr>
      </thead>
      <tbody>
      <% ArrayList<Carzspa> spares = (ArrayList<Carzspa>) request.getAttribute("spares");
              for(int i=0; i<spares.size(); i++)
              {
                  Carzspa item = spares.get(i);
          %>
        <tr class="shaker_parent shower_parent">

          <th scope="row "><%= item.getId() %></th>
          <td><%= item.getName() %></td>
          <td><%= item.getCategory() %></td>
          <td><%= item.getQuantity() %></td>
          <td> Rs. <%= item.getCostPrice() %></td>
          <td> Rs. <%= item.getSellingPrice() %></td>

          <td>
          <div class="col_center h100">
            <div class="row_left no_wrap shower_child items_left">
                <form action="view" method="get">
                    <input type="hidden" value="<%= item.getId() %>" name="id" >
                    <button class="btn" > <i class="fa-solid fa-ellipsis-vertical"></i></button>
                </form>
                <form action="delete" method="post">
                    <input type="hidden" value="<%= item.getId() %>" name="id" >
                        <button class="btn shake_once_child" > <i class="fa-solid fa-trash text-danger"></i></button>
                </form>

            </div>
          </div>
          </td>
        </tr>
        <% } %>

      </tbody>
    </table>
</div>
</body>
</html>

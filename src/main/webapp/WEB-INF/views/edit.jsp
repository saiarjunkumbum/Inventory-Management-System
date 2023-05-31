<html>
<%@ include file="header.jsp" %>
<%@ page import="com.ivms.entities.Carzspa" %>

<body>
    <div class="container">

        <% Carzspa spare = (Carzspa)request.getAttribute("spare"); %>

        <div class=" pd_sm col_center w100 mg_v_lg">
            <div class="w_100 max_500 rounded-1 items_center shadow">
                <h3 class="text_center mg_t_md mg_h_md">Edit item</h3>
                <hr>
                <% String emsg = (String)request.getAttribute("error_message");
                    if(emsg!=null) { %>
                    <div class="pd_md">
                        <p><i class="fa-solid fa-warning"> </i> <%= emsg %> </p>
                    </div>
                <% } %>
                <% String smsg = (String)request.getAttribute("success_message");
                    if(smsg!=null) { %>
                <div class="pd_md">
                    <p><i class="fa-solid fa-check-circle">  </i><%= smsg %></p>
                </div>
                <% } %>

                <form action="submitUpdate" method="post" class="w100 pd_md">
                    <input type="hidden" value="<%= spare.getId() %>" name="id"/>
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input name="name" value="<%= spare.getName() %>" class="form-control" id="name" type="text" placeholder="Brand name">
                    </div>
                    <div class="mb-3">
                        <label for="quantity" class="form-label">Quantity</label>
                        <input type="number" value="<%= spare.getQuantity() %>" name="quantity" class="form-control" id="quantity" placeholder="Add items">
                    </div>
                    <div class="mb-3">
                        <label for="costprice" class="form-label">Cost Price</label>
                        <input type="number" value="<%= spare.getCostPrice() %>" name="costPrice" class="form-control" id="costprice" placeholder="Cost Price of Item">
                    </div>
                    <div class="mb-3">
                        <label for="sellingprice" class="form-label">Selling Price</label>
                        <input type="number" value="<%= spare.getSellingPrice() %>" name="sellingPrice" class="form-control" id="sellingprice" placeholder="Selling Price of Item">
                    </div>
                    <label class="form-label">Category</label>
                    <div class="mb-3 form-floating">
                        <select class="form-select" default= id="floatingSelect" name="category" aria-label="Floating label select example">
                            <option selected value="<%= spare.getCategory() %>"><%= spare.getCategory() %> </option>
                            <option value="Tyres">Tyres</option>
                            <option value="Shock Absorbers">Shock Absorbers</option>
                            <option value="Battery">Battery</option>
                            <option value="Engine oil">Engine oil</option>
                            <option value="Exhaust">Exhaust</option>
                            <option value="Brakes">Brakes</option>
                        </select>
                        <label for="floatingSelect">Select Category</label>
                    </div>
                    <div class="row_between">
                        <a href = "login" class="btn btn-light fw600"><i class="fa-solid fa-xmark mg_r_xs"></i>Close</a>

                        <button type="submit" class="btn btn-primary" href="home">Submit update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>

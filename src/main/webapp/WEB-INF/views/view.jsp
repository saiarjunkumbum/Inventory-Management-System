<html>
<%@ include file="header.jsp" %>
<%@ page import="com.ivms.entities.Carzspa" %>
<body>
<div class="col_center pd_md">
<h2 class="mg-sm text_center mg_b_xs">PARTSOMATIC.in</h2>
    <p> Tough on Dirt, Gentle on Spare Parts </p>
</div>
<hr/>
<div class="container">

<div class=" pd_sm col_center w100 mg_v_lg">
        <div>
        <% Carzspa spares = (Carzspa)request.getAttribute("spares");

        %>
        </div>

                <div class="row-center mg_b_md">
                        <a href = "login" class="btn btn-light fw600"><i class="fa-solid fa-xmark mg_r_xs"></i>Close</a>
                </div>
        <div class="w_100 max_500 rounded-2 items_center shadow">

            <div class="pd_t_md pd_h_md">
                <div class="row_between no_wrap">
                    <h4> <%= spares.getName() %> </h4>
                    <div class="row_right"  >
                        <form method="get" action="edit">
                            <input type="hidden" value="<%= spares.getId() %>" name="id" />
                            <button type="submit" class="btn btn-white mg_r_sm shaker_parent child"> <i class="fa-solid fa-pen shake_once_child"></i></button>
                        </form>

                        <%-- <form method="get" action="/delete">
                            <a class="btn btn-white shaker_parent"> <i class="fa-solid fa-trash shake_once_child"></i></a>
                        </form> --%>
                    </div>
                </div>
                <p class="txt_sm mg_t_sm text-primary"><i class="fa-solid txt_mn mg_r_xs" ></i> <%= spares.getCategory() %> </p>
            </div>

            <hr/>

            <div class="row_right w100">
            </div>

            <div class="row pd_md">
                <div class="col-6 ">
                    <div class="rounded-1 bg-ligh col_center items_center mg_r_xs pd_h_sm pd_v_md">
                        <h1> Rs. <%= spares.getCostPrice() %> </h1>
                        <p>Cost Price</p>
                    </div>
                </div>
                <div class="col-6">
                    <div class="bg-ligh rounded-1 col_center items_center mg_l_xs pd_h_sm pd_v_md">
                        <h1> Rs. <%= spares.getSellingPrice() %> </h1>
                        <p>Selling Price</p>
                    </div>
                </div>
            </div>
        </div>
</div>

</div>

</body>
</html>

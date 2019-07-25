<div class="clo-sm-3 col-md-3 col-xs-3 col-xl-3 grey lighten-4">
                                <p class="pink-text darken-2" >Why Not Show Some Love, Request to Reserve For A <a href="#" class="friendword" >Friend</a> or <a href="#" class="familyword" > Family</a></p>
                                <div class="friend" id="friend">
                                    <form method="post" action="./booking/guest_reserve.jsp">
                                        <p>Required fields are marked<b class="red-text">*</b></p>
                                        <div class="form-group">
                                            <label>Friends Name<span class="red-text">*</span></label>
                                            <input type="text" required="" name="name">
                                        </div>
                                        <div class="form-group">
                                            <label>Email<span class="red-text">*</span></label>
                                            <input type="email" required="" name="email">
                                        </div>
                                        <div class="form-group">
                                            <label>Phone<span class="red-text">*</span></label>
                                            <input type="text" required="" name="phone">
                                        </div>
                                        <div class="form-group">
                                            <label>Country<span class="red-text">*</span></label>
                                            <select name="country" required="" class="form-control">
                                                 <option value="">Select Country</option>
                                                 <% 
                                                     try{

                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                                        Statement stm = conn.createStatement();
                                                        String sql = "SELECT * FROM countries";

                                                        ResultSet rst = stm.executeQuery(sql);

                                                        while(rst.next()){
                                                            %>
                                                            <option value="<%=rst.getString("country_name")  %>"><%=rst.getString("country_name")  %></option>
                                                            <%
                                                        }

                                                        }catch(Exception e){
                                                            out.println(e);
                                                        }
                                                  %>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Check In<span class="red-text">*</span></label>
                                            <input type="date" required="" name="check_in">
                                        </div>
                                        <div class="form-group">
                                            <label>Check_out<span class="red-text">*</span></label>
                                            <input type="date" required="" name="check_out">
                                        </div>
                                            <input type="hidden" name="determinant" value="Friend">
                                        <div class="form-group">
                                            <%
                                                if(Integer.parseInt(rs.getString("booked")) == 1 ){
                                                    %>
                                                    Cannot be Reserved, <a href="rooms.jsp" class="pink-text" >check another</a>
                                                    <%
                                                }else{
                                                    %>
                                                    For A<a href="#" class="familyword"> Family?</a>
                                                    <a href="./booking.jsp?uid=<%=rs.getString("id")  %>">
                                                        <input type="submit" 
                                                               class="btn pull-right pink " 
                                                               name="guestReserve" 
                                                               title="reserve for that special friend" 
                                                               value="Request"
                                                        >
                                                    </a>
                                                    <%
                                                }
                                            %>
                                        </div>   
                                    </form>
                                </div>
                                <div class="family" id="family">
                                    <form method="post" action="./booking/guest_reserve.jsp" >
                                        <div class="form-group">
                                            <label>Family Name<span class="red-text">*</span></label>
                                            <input type="text" required="" name="name">
                                        </div>
                                        <div class="form-group">
                                            <label>Email<span class="red-text">*</span></label>
                                            <input type="email" required="" name="email">
                                        </div>
                                        <div class="form-group">
                                            <label>Phone<span class="red-text">*</span></label>
                                            <input type="text" required="" name="phone">
                                        </div>
                                        <div class="form-group">
                                            <label>Country<span class="red-text">*</span></label>
                                            <select name="country" required="" class="form-control">
                                                 <option value="">Select Country</option>
                                                 <% 
                                                     try{

                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                                        Statement stm = conn.createStatement();
                                                        String sql = "SELECT * FROM countries";

                                                        ResultSet rst = stm.executeQuery(sql);

                                                        while(rst.next()){
                                                            %>
                                                            <option value="<%=rst.getString("country_name")  %>"><%=rst.getString("country_name")  %></option>
                                                            <%
                                                        }

                                                        }catch(Exception e){
                                                            out.println(e);
                                                        }
                                                  %>

                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Adults<span class="red-text">*</span></label>
                                            <input type="number" required="" name="adults">
                                        </div>
                                        <div class="form-group">
                                            <label>Children</label>
                                            <input type="number" name="children">
                                        </div>
                                                  <input type="hidden" name="determinant" value="Family">
                                        <div class="form-group col-1">
                                            <label>Check In<span class="red-text">*</span></label>
                                            <input type="date" required="" name="check_in">
                                        </div>
                                        <div class="form-group col-1">
                                            <label>Check_out<span class="red-text">*</span></label>
                                            <input type="date" required="" name="check_out">
                                        </div>
                                        <div class="form-group">
                                            <%
                                                if(Integer.parseInt(rs.getString("booked")) == 1 ){
                                                    %>
                                                    Cannot be Reserved, <a href="rooms.jsp" class="pink-text" >check another</a>
                                                    <%
                                                }else{
                                                    %>
                                                    For A <a href="#" class="friendword"> Friend?</a>
                                                    <a href="./booking.jsp?uid=<%=rs.getString("id")  %>">
                                                        <input type="submit" 
                                                               class="btn pull-right pink " 
                                                               name="guestReserve" 
                                                               title="reserve for that special family" 
                                                               value="Request"
                                                        >
                                                    </a>
                                                    <%
                                                }
                                            %>
                                        </div>   
                                    </form>
                                </div>
                            </div>
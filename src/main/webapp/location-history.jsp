<%@ page import="com.wifi.publicwifiproject.dao.LocationHistoryDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wifi.publicwifiproject.dto.LocationHistoryDTO" %><%--
  Created by IntelliJ IDEA.
  User: ksh
  Date: 2024. 8. 7.
  Time: PM 7:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>와이파이 정보 구하기</title>
        <style>
            table {
                width: 100%;
            }
            th, td {
                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>위치 히스토리 목록</h1>
        <div>
            <a href="index.jsp">홈</a> &nbsp;|&nbsp;
            <a href="hello-servlet">위치 히스토리 목록</a> &nbsp;|&nbsp;
            <a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a> &nbsp;|&nbsp;
            <a href="hello-servlet">북마크 보기</a> &nbsp;|&nbsp;
            <a href="hello-servlet">북마크 그룹 가져오기</a>
        </div>
        <br>
        <div>
            <%
                LocationHistoryDAO locationHistoryDAO = new LocationHistoryDAO();
                List<LocationHistoryDTO> list = locationHistoryDAO.locHistoryList();
            %>
            <table>
                <thead>
                    <th>ID</th>
                    <th>X좌표</th>
                    <th>Y좌표</th>
                    <th>조회일자</th>
                    <th>비고</th>
                </thead>
                <tbody>
                    <% if (list.size() > 0) { %>
                        <% for (LocationHistoryDTO locationHistoryDTO : list) { %>
                        <tr>
                            <td><%=locationHistoryDTO.getId()%></td>
                            <td><%=locationHistoryDTO.getLat()%></td>
                            <td><%=locationHistoryDTO.getLnt()%></td>
                            <td><%=locationHistoryDTO.getSearchDate()%></td>
                            <td><input type="button" value="삭제" id="row<%=locationHistoryDTO.getId()%>" onclick=""></td>
                        </tr>
                        <% } %>
                    <% } %>
                </tbody>
            </table>
        </div>
        <script>
        </script>
    </body>
</html>

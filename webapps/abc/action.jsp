<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4104029039" />
  <jsp:setProperty property="user" name="database" value="4104029039" />
  <jsp:setProperty property="password" name="database" value="Ss4104029039!" />
</jsp:useBean>
<%
  database.connectDB();
  database.query("select * from account;");
  ResultSet rs = database.getRS();

  String username = request.getParameter("username");
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  String password2 = request.getParameter("password2");
  String telphone = request.getParameter("telphone");
  String name = request.getParameter("name");
  String passwd = request.getParameter("passwd");
  String namet="",passwordt="",emailt="",telphonet="";
  int x=0,y=0,xxx=0;
if(username !=null && password !=null && email !=null && password2 !=null && telphone !=null){
  if(!password.equals(password2)){
    x++;%>
    <script language="javascript">
    alert("Two passwords are not the same.");
    history.go(-1);
    </script><%
  }
  if(rs!=null){
    while(rs.next()){
      if(username.equals(rs.getString("name"))){%>
        <script language="javascript">
        alert("The username has been taken.");
        history.go(-1);
        </script>
        <%
        x++;
      }
    }
  }
  if(x==0){
    database.insertData(username,email,password,telphone);%>
    <script language="javascript">
    alert("Register sucessfully. Please log in now.");
    history.go(-1);
    </script><%
  }
}
if(rs!=null){
  while(rs.next()){
    if(name.equals(rs.getString("name"))){
      if(passwd.equals(rs.getString("password"))){
        y=0;
        namet=rs.getString("name");
        passwordt=rs.getString("password");
        emailt=rs.getString("email");
        telphonet=rs.getString("telphone");%>
        <script language="javascript">
        alert("LOGIN SUCCESSFULLY.");
        </script><%
        break;
      }else{
        %>
        <script language="javascript">
        alert("The password is wrong.");
        history.go(-1);
        </script>
        <%
        break;
      }
    }else{
      y++;
    }
  }
}

if(y!=0){%>
<script language="javascript">
alert("The username does not exist.");
history.go(-1);
</script>
 <%
}
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Material Login Form</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="style.css">
</head>

<body>
<br><br>
<div class="container">
  <div class="card"></div>
  <div class="card">
    <h1 class="title">WELCOME</h1><br>
    <h1 class="title">YOUR INFORMATION</h1>
    <form>
      <div class="input-container">
        <label>username = <%=namet%></label>
        <div class="bar"></div>
      </div><br><br><br><br>
      <div class="input-container">
        <label>password = <%=passwordt%></label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <label>email=<%=emailt%></label>
        <div class="bar"></div>
      </div><br><br><br><br>
      <div class="input-container">
        <label>telphone = <%=telphonet%></label>
        <div class="bar"></div>
      </div>
    </form>
  </div>
</div>
</body>
</html>

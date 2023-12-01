<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="your-styles.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poiret+One">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"> <!-- Include FontAwesome CSS from a CDN -->
  <style>
    /* Add your CSS code here */
    *{box-sizing: border-box;}

    .button {
      position: absolute;
      top: 10px;
      left: 10px;
      z-index: 10000;
      color: white;
      padding: 10px;
      font-size: 30px;
      cursor: pointer;
    }

    .button .fa {
      transition: color 1000ms cubic-bezier(.68, -0.55, 0.265, 1.55);
      transition-delay: .75s;
    }

    html {
      overflow-x: hidden;
    }

    body {
      color: #fff;
      font-family: 'Poiret One', cursive;
      position: relative;
      background: #BB4430;
      transform: translateX(0);
      transition: transform 800ms cubic-bezier(0.68, -0.55, 0.265, 1.55);
    }

    .menu {
      position: absolute;
      top: 0;
      left: 0;
      bottom: 0;
      width: 400px;
      padding-left: 0;
      transform: translateX(-150%);
      transition: transform 500ms cubic-bezier(.68, -0.55, 0.265, 1.55);
      transition-delay: .2s;
    }

    .content {
      position: absolute;
      margin: 0 auto;
      padding: 30px 20%;
      font-size: 18px;
      transform: translateX(100%);
      transition: color 1s ease 1s, background .5s ease 1s, transform 1000ms cubic-bezier(.68, -0.55, 0.265, 1.55) .5s;
    }

    h1 { font-size: 60px; }

    p {
      margin-bottom: 100px;
      line-height: 2.4;
    }

    ul {
      margin: 0;
      padding: 20px 0;
      list-style: none;
    }

    li {
      margin: 0;
      padding: 0;
    }

    a {
      text-decoration: none;
      display: block;
      padding: 10px 20px;
      padding-left: 120px;
      color : #231F20;
      font-size:20px;
      font-weight:bold;
    }

    a:hover {
      background: #231F20;
      color:#BB4430;
    }

    .button .fa {
      color: white;
    }

    .home_is_visible {
      .home {
        transform: translateX(0);
        z-index: 5000;
        color: white;
        background: #231F20;
      }
    }

    .aboutus_is_visible {
      .aboutus {
        transform: translateX(0);
        z-index: 5000;
        color: black;
        background: pink;
      }
    }

    .clients_is_visible {
      .clients {
        transform: translateX(0);
        z-index: 5000;
        color: white;
        background: purple;
      }
    }

    .contactus_is_visible {
      .contactus {
        transform: translateX(0);
        z-index: 5000;
        color: black;
        background: brown;
      }
    }

    body.nav_is_visible {
      transform: translateX(300px);
      .menu {
        transform: translateX(-100%);
      }
    }
  </style>
</head>
<body class="home_is_visible">
  <div class="button">
    <i class="fa fa-bars"></i>
  </div>

  <div class="menu">
    <nav>
      <ul>
        <li>
          <a href="<%= request.getContextPath() %>/home_is_visible">Home</a>
        </li>
        <li>
          <a href="<%= request.getContextPath() %>/aboutus_is_visible">About</a>
        </li>
        <li>
          <a href="<%= request.getContextPath() %>/clients_is_visible">Clients</a>
        </li>
        <li>
          <a href="<%= request.getContextPath() %>/contactus_is_visible">Contact Us</a>
        </li>
      </ul>
    </nav>
  </div>

  

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $('body').addClass('home_is_visible');

      $('.button').on("click", function(){
        $('body').toggleClass('nav_is_visible');
      });

      function removeClasses() {
        $(".menu ul li").each(function() {
          var link = $(this).find('a').attr('href');
          $('body').removeClass(link);
        });
      }

      $('.menu a').on("click", function(e){
        e.preventDefault();
        removeClasses();
        var link = $(this).attr('href');
        $('body').addClass(link);
        $('body').removeClass('nav_is_visible');
      });
    });
  </script>
</body>
</html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ADVENTicket</title>
    <style>
      * {
            margin: 0;
            padding: 0;
        }

        body {
            background: url(../images/mail/dark_wall.png);
            font-size: 11px;
            font-family: 'Open Sans', sans-serif;
            color: #4A4A4A ;
            text-align: center; 
        }

        .wrap {  
            margin: 20px auto;
            display: block;
            width: 300px;
            height: 310px;
            padding:20px;

            background: #f3f3f3;
            border: 1px solid #fff;
            border-radius: 5px;

            box-shadow: 0 1px 3px rgba(0,0,0,0.5);
            -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
            -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
        }



        .gradient {
            /* Center Positioning */
            width: 600px;
            height: 600px;
            position: fixed;
            left: 50%;
            top: 50%;
            margin-left: -300px;
            margin-top: -300px;
            z-index: -2;

            /* Fallback */ 
            background-image: url(../images/mail/gradient.png); 
            background-repeat: no-repeat; 

            /* CSS3 Gradient */
            background-image: -webkit-gradient(radial, 0% 0%, 0% 100%, from(rgba(213,246,255,1)), to(rgba(213,246,255,0)));
            background-image: -webkit-radial-gradient(50% 50%, 40% 40%, rgba(213,246,255,1), rgba(213,246,255,0));
            background-image: -moz-radial-gradient(50% 50%, 50% 50%, rgba(213,246,255,1), rgba(213,246,255,0));
            background-image: -ms-radial-gradient(50% 50%, 50% 50%, rgba(213,246,255,1), rgba(213,246,255,0));
            background-image: -o-radial-gradient(50% 50%, 50% 50%, rgba(213,246,255,1), rgba(213,246,255,0));
        }

        .wrap img {
            width: 100%;
            margin-top: 15px;
        }

        p{ 
            margin-top: 15px;
            text-align: justify;
        }

        h1{
            font-size: 20px;
            font-weight: bold;
            margin-top: 5px; 
            text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
        }

        a{
            text-decoration: none;
            color: #4A4A4A !important;
        }

        a:hover{
            text-decoration: underline;
            color: #6B6B6B !important ;
        }
    </style>
  </head>
  <body>
    <div class="wrap">
       <h1><g:message code="enrollment.sendConfirmation.label"/></h1>   
          <img src="https://www.dropbox.com/s/65g1akpgn75jdds/eclipse.jpg">
          <p><g:message code="enrollment.sendConfirmation1.label" args="${[user.nombre]}" /></p> 
          <p><g:message code="enrollment.sendConfirmation2.label" /></p> 
          <p><g:message code="enrollment.sendConfirmation3.label" /></p> 
          <p><a href="${uri}">${uri}</a></p> 
          <p><g:message code="enrollment.sendConfirmation4.label" /></p> 
          <p><g:message code="enrollment.sendConfirmation5.label" /></p> 
          <p><g:message code="enrollment.sendConfirmation6.label" /></p> 
          <br />
    </div>
    <div class="gradient"></div>
  </body>
</html>

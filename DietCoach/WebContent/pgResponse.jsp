<%@page import="com.utility.PaytmConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%
Enumeration<String> paramNames = request.getParameterNames();
String str = new String("");
Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	if(paramName.equals("CHECKSUMHASH")){
		paytmChecksum = mapData.get(paramName)[0];
	}else{
		parameters.put(paramName,mapData.get(paramName)[0]);
	}
}
boolean isValideChecksum = false;
String outputHTML="";
try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
	if(isValideChecksum && parameters.containsKey("RESPCODE")){
		if(parameters.get("RESPCODE").equals("01")){
			outputHTML = parameters.toString();
		}else{
			response.sendRedirect("http://localhost:8080/DietPlan/pricing.jsp");
			outputHTML="<b>Payment Failed.</b>";
		}
	}else{
		outputHTML="<b>Checksum mismatched.</b>";
	}
}catch(Exception e){
	outputHTML=e.toString();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="asset/img/logo.png">
  <link rel="icon" type="image/png" href="asset/img/logo.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Diet Coach</title>
  
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="GENERATOR" content="Evrsoft First Page">
	
	 <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="asset/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="asset/css/material-dashboard.min1c51.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="asset/demo/demo.css" rel="stylesheet" />
  <style type="text/css">
  	.pricing-page .title {
    color: #fff;
    margin-top: 0px;
	}

	h2.title {
	    margin-bottom: 10px;
	}
  </style>
</head>
<body class="off-canvas-sidebar">
<%-- <p id="paymentDet"><%=outputHTML%></p> --%>
	<div class="wrapper wrapper-full-page">
    <div class="page-header pricing-page header-filter" style="background-image: url('asset/img/bg-pricing.jpg')">
      <div class="container">
        <div class="row">
        
        <%for (int i = 1; i < outputHTML.length() - 1; i++) {
				str += outputHTML.charAt(i);
			}
			String str1[] = str.split(",");
		%>
		
		
		
		
		<%
			if(outputHTML.length()>28){
				for (int j = 0; j < str1.length; j++) {
		%>
		<table border="1" style="display:none;" id="resonseTable">
			<tr>
				<%
					String values[] = str1[j].split("=");
				%>
				<td><%=values[0]%></td>
				<td><%=values[1]%></td>
				<input type="hidden" name="<%=values[0].trim()%>" id="<%=values[0].trim()%>"
					value="<%=values[1].trim()%>">
			</tr>
			<%
			}
			%>
		</table>
			
		<div class="card card-nav-tabs text-center">
  			<div class="card-header card-header-primary">
    			<h2 class="card-title">Payment Details</h2>
  			</div>
  			<div class="card-body">
    			<h4 class="card-title">Payment Successful.</h4>
    			<a href="Login.jsp" class="btn btn-primary" id="done">Done</a>
  			</div>
  			<div class="card-footer text-muted">
    
			</div>
		</div>
			
		<%
		}
		else{%>
			<div class="card card-nav-tabs text-center">
  			<div class="card-header card-header-primary">
    			<h2 class="card-title">Payment Details</h2>
  			</div>
  			<div class="card-body">
    			<h4 class="card-title">Payment Process Failed</h4>
    			<a href="Login.jsp" class="btn btn-primary">Go Back</a>
  			</div>
  			<div class="card-footer text-muted">
    
			</div>
		</div>		
		<%}
		%>
		
        </div>
      </div>
    </div>
  </div>
		
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			
			$("#done").click(function regen() {
				var bankName = $('input:hidden[name=BANKNAME]').val();
				var bankTxnId = $('input:hidden[name=BANKTXNID]').val();
				var currency = $('input:hidden[name=CURRENCY]').val();
				var getwayName = $('input:hidden[name=GATEWAYNAME]').val();
				var merchantId = $('input:hidden[name=MID]').val();
				var orderId = $('input:hidden[name=ORDERID]').val();
				var paymentMode = $('input:hidden[name=PAYMENTMODE]').val();
				var responseCode = $('input:hidden[name=RESPCODE]').val();
				var responseMsg = $('input:hidden[name=RESPMSG]').val();
				var staTus = $('input:hidden[name=STATUS]').val();
				var txnAmt = $('input:hidden[name=TXNAMOUNT]').val();
				var txnDate = $('input:hidden[name=TXNDATE]').val();
				var txnId = $('input:hidden[name=TXNID]').val();
				
				$.get('PaymentServlet', {
					bankname : bankName,
					banktxnid : bankTxnId,
					currency : currency,
					gatewayname : getwayName,
					merchantid : merchantId,
					orderid : orderId,
					paymentmode : paymentMode,
					responsecode : responseCode,
					responsemsg : responseMsg,
					status : staTus,
					txnamount : txnAmt,
					txndate : txnDate,
					txnid : txnId				
				}, function(responseText) {
	 				$('#PaymentServlet').text(responseText);
				});
			});
		     
			
			
		});
		</script>
			<!--   Core JS Files   -->
  <script src="asset/js/core/jquery.min.js"></script>
  <script src="asset/js/core/popper.min.js"></script>
  <script src="asset/js/core/bootstrap-material-design.min.js"></script>
  <script src="asset/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2Yno10-YTnLjjn_Vtk0V8cdcY5lC4plU"></script>
  <!-- Place this tag in your head or just before your close body tag. -->
  <script async defer src="asset/js/core/buttons.js"></script>
  <!-- Chartist JS -->
  <script src="asset/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="asset/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="asset/js/material-dashboard.min1c51.js?v=2.1.2" type="text/javascript"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="asset/demo/demo.js"></script>
	<script>
    $(document).ready(function() {
      $().ready(function() {
        $sidebar = $('.sidebar');

        $sidebar_img_container = $sidebar.find('.sidebar-background');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

        if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
          if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
            $('.fixed-plugin .dropdown').addClass('open');
          }

        }

        $('.fixed-plugin a').click(function(event) {
          // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .active-color span').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-color', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data-color', new_color);
          }
        });

        $('.fixed-plugin .background-color .badge').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('background-color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-background-color', new_color);
          }
        });

        $('.fixed-plugin .img-holder').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).parent('li').siblings().removeClass('active');
          $(this).parent('li').addClass('active');


          var new_image = $(this).find("img").attr('src');

          if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            $sidebar_img_container.fadeOut('fast', function() {
              $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
              $sidebar_img_container.fadeIn('fast');
            });
          }

          if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $full_page_background.fadeOut('fast', function() {
              $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
              $full_page_background.fadeIn('fast');
            });
          }

          if ($('.switch-sidebar-image input:checked').length == 0) {
            var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
          }
        });

        $('.switch-sidebar-image input').change(function() {
          $full_page_background = $('.full-page-background');

          $input = $(this);

          if ($input.is(':checked')) {
            if ($sidebar_img_container.length != 0) {
              $sidebar_img_container.fadeIn('fast');
              $sidebar.attr('data-image', '#');
            }

            if ($full_page_background.length != 0) {
              $full_page_background.fadeIn('fast');
              $full_page.attr('data-image', '#');
            }

            background_image = true;
          } else {
            if ($sidebar_img_container.length != 0) {
              $sidebar.removeAttr('data-image');
              $sidebar_img_container.fadeOut('fast');
            }

            if ($full_page_background.length != 0) {
              $full_page.removeAttr('data-image', '#');
              $full_page_background.fadeOut('fast');
            }

            background_image = false;
          }
        });

        $('.switch-sidebar-mini input').change(function() {
          $body = $('body');

          $input = $(this);

          if (md.misc.sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            md.misc.sidebar_mini_active = false;

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

          } else {

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

            setTimeout(function() {
              $('body').addClass('sidebar-mini');

              md.misc.sidebar_mini_active = true;
            }, 300);
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);

        });
      });
    });
  </script>
  <script>
    $(document).ready(function() {
      md.checkFullPageBackgroundImage();
    });
  </script>
</body>
</html>

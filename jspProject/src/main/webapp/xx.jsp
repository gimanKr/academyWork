<!DOCTYPE html>
<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>  
		* { margin:0 ; padding:0 ; border:0 ; text-decoration:none ; box-sizing:border-box }
		#header { background-color:#f1f1f1 ; padding:5px }
		#header > h1 { text-align:center ; font-size:16px} 

		#nav > ul { overflow:hidden ; background-color:#333; display: flex; justify-content: center;}
		#nav li , #nav a {  display:block }
		#nav li { float:left }
		#nav a {
			padding:12px 20px ; border-right:solid 1px rgba(255,255,255,0.1) ;
			font-size:14px ; color:#ffffff ; text-align:center ;
		}
		#nav a:hover { background-color:#ddd ; color:black } 

		.column { float:left ; padding:10px  } 
		.side   { width:25% }
		.middle { width:50% }
		.row::after { content:"" ; display:table ; clear:both } 
		@media screen and (max-width:600px) {
			.column { width:100% }
		}

		#footer {
			background-color:#f1f1f1 ; padding:10px ;
			text-align:center
		}
	</style>
	</head>
	<body> 
		<header id="header"><h1>Header</h1></header>

		<nav id="nav">
			<ul>
				<li><a href="#">MENU1</a></li>
				<li><a href="#">MENU2</a></li>
				<li><a href="#">MENU3</a></li>
				<li><a href="#">MENU4</a></li>
			</ul>
		</nav>
		
		<main id="main">
			<div class="row">
				<aside class="column side">
					<h2>Side</h2>
					<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.  </p>
				</aside>
				<div class="column middle">
					<h2>Main Content</h2>
					<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Distinctio modi, incidunt, facere similique, alias odit earum veniam ipsam sunt optio qui voluptatem. Sapiente corrupti cumque at quos modi unde. Distinctio!</p>
				</div>
				<aside class="column side">
					<h2>Side</h2>
					<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.  </p>
				</aside> 
			</div>
		</main>
		
		<footer id="footer"><p>Footer</p></footer>
 
	</body>
</html>
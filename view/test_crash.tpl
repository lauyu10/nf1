<!doctype html>
<html lang="en">
	<head>
		<title>NF1 Home Page</title>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Bootstrap CSS -->

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

		<!-- My CSS -->

		<link rel="stylesheet" type="text/css" href="./view/css/nf1.css">

		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->


		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
		<script src="./view/js/script.js"></script>
		<script src="./view/js/jquery/jquery-3.3.1.js"></script>
	</head>
	<body>

		<header>
			<div class="collapse bg-dark" id="navbarHeader">
				<div class="container">
					<div class="row">
						<div class="col-sm-8 py-4">
							<h4 class="text-white">About</h4>
							<p class="text-muted">NF1 is a news website about the Nascar Cup Series and Formula 1 at the moment</p>
						</div>
						<div class="col-sm-4 py-4">
							<h4 class="text-white"><a href="index.php?control=routing_page&action=home_page" class="text-white">Home NF1</a></h4>
							<h4 class="text-white">Nascar Cup Series</h4>
							<ul class="list-unstyled">
								<li><a href="index.php?control=routing_page&action=news_nascar" class="text-white">News</a></li>
								<li><a href="index.php?control=routing_page&action=standing_nascar" class="text-white">Standing</a></li>
								<li><a href="index.php?control=routing_page&action=results_nascar" class="text-white">Results</a></li>
							</ul>
							<h4 class="text-white">F1</h4>
							<ul class="list-unstyled">
								<li><a href="index.php?control=routing_page&action=news_f1" class="text-white">News</a></li>
								<li><a href="index.php?control=routing_page&action=standing_f1" class="text-white">Standing</a></li>
								<li><a href="index.php?control=routing_page&action=results_f1" class="text-white">Results</a></li>
							</ul>
							<h4 class="text-white"><a href="index.php?control=routing_page&action=what_if" class="text-white">What If...</a></h4>
							<h4 class="text-white"><a href="index.php?control=routing_page&action=videos" class="text-white">Videos</a></h4>
							<h4 class="text-white"><a href="index.php?control=routing_page&action=test_crash" class="text-white">Test Crash page</a></h4>
						</div>
					</div>
				</div>
			</div>
			<div class="navbar navbar-dark bg-dark">
				<div class="container d-flex justify-content-between">
					<form action="index.php?control=routing_page&action=home_page" method="post"><button class="button_menu"><img src="view/images/nf1.jpg" width="25%" height="2%"></img></button></form>

					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>
			</div>
		</header>
		<script type="text/javascript">function_load_last_result_f1();</script>
		<main role="main">

			<section class="jumbotron text-center">
				<div class="container">
					<h1 class="jumbotron-heading" id="titre"></h1>
				</div>
			</section>

			<div class="container" id="tableau">
			</div>

		</main>

		<footer class="text-muted">
			<div class="container">
				<p class="float-right">
					<a href="#">Back to top</a>
				</p>
			</div>
		</footer>
	</body>

</html>

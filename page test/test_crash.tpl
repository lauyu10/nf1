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
							<h4 class="text-white"><a href="index.php?control=routing_page&action=contact_page" class="text-white">Contact NF1</a></h4>
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

		<main role="main">
			<section class="jumbotron text-center">
				<div class="container">
					<img class="float-image-center" src="./view/images/f1_2017_driver_standing_race_18.jpg" alt="Schedule F1 with Nascar's points"/>
				</div>
			</section>

			<div class="container">
				<h1 class="title-page-article">What if we change points system in F1 to Nascar's points system. What happens in the drivers' standing ?</h1>
				<p class="article">
					For this season 2017, Lewis Hamilton is the champion of F1. It remains 2 grand prix before the end of the season.
					But, if we change the f1 scoring system into a NASCAR scoring system. Each place gives 1 point. Example : 1st place gives 20 pts,
					2nd place gives 19pts, 3rd : 18pts, etc..., 20th : 1pt. Even, if do not take part of the race. Drivers just need to be here on the grid.
					</br>
					On the picture, you can see that Lewis Hamilton is ahead of his teammate Valtteri Bottas with 22pts.
					As you can see, If we use this fantasy scoring system, the season is not over we do not know, who is going to win the driver championship.
					</br>
					On the left, the fantasy scoring system. On the right, the real scoring system in f1.
					</br>
					<img src="./view/images/compare.png" alt="Differents scoring system. On the left, the fantasy scoring system. On the right, the real scoring system in f1."/>
				</p>
			</div>

			<div class="container" id="sept_cinq">
				<div class="widget-area no-padding blank">
					<div class="status-upload">

						<form action="index.php?control=routing_page&action=addcomment" method="post">
							<input id="no_border" type="text" name="name" placeholder="name ?"></input>
							<textarea name="commentaire" placeholder="your comments here"></textarea>
							<?php
								if(isset($error_message))
								{?>
									<span id="error_message"><?php echo($_SESSION['error_message']);?></span><?php
								}
							?>
							<button type="submit" class="btn btn-success green" id="marge"> Commenter</button>
						</form>
					</div><!-- Status Upload  -->
				</div><!-- Widget Area -->
			</div>

			<?php
				if($table_comments != null)
				{
					foreach($table_comments as $comment)
					{?>
						<div class="container" id="marge">
							<div class="card" id="sept_cinq">
							  <div class="card-block">
									<h4 class="card-title"><?php echo($comment['name']);?></h4>
							    <p class="card-text"><?php echo($comment['comment']);?></p>
									<h6 class="card-subtitle mb-2 text-muted"><?php echo($comment['date']);?></h6>
								</div>
							</div>
						</div>
					<?php
					}
				}
				else
				{?>
					<div class="container" id="marge">
						<div class="card" id="sept_cinq">
							<div class="card-block">
								<h4 class="card-title">Be the first to comment ?</h4>
							</div>
						</div>
					</div>
				<?php
			}?>

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

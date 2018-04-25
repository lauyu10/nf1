<!doctype html>
<html lang="en">
	<head>
		<title>NF1 5 things that Nascar should change</title>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Bootstrap CSS -->

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

		<!-- My CSS -->

		<link rel="stylesheet" type="text/css" href="./view/css/nf1.css">

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
					<img class="float-image-center" src="./view/images/things_change_nascar.jpg" alt="F1 have to change"/>
				</div>
			</section>

			<div class="container">

				<h1 class="title-page-article">5 things that Nascar should change</h1>
				<p class="card-text">
					Before I give my point of view, I have to precise that these 5 reasons come from me, and it is just my opinion. You can be agreed with me or disagreed. </br>
				</p>
				<p class="article">
					-	Calendar (less races) </br>
					The calendar in the Monster Energy Nascar Cup Series is too heavy. 36 races plus 2 extra-races. A lot of drivers say to journalists that, they want to race in other motorsport’s events </br>
					like “les 24 heures du Mans”. But they cannot, since the Nascar season takes place from February to November. There are just 2 or 3 weeks off, and that’s it. Maybe, Nascar should reduce </br>
					to 30 races per season or less. But, the problem is the circuit’s owners. They paid so much money to have race in their circuit. Maybe, we can see some change in a few years.
				</p>
				<p class="article">
					-	Public channel races </br>
					If you want to be a sport that everyone knows. You need to be broadcasted on public channels. Yes of course, if you do this, FIA will receive less money from the tv rights. Cause, at the </br>
					moment, most public channels do not have enough money to fight against pay TV. But if you do this, there will be more people who can watch races. It can also attract sponsors for F1, potentially </br>
					more money than expected with pay TV. The merchandising can also have a boost with new fans. In fact, Nascar puts full-length races on its youtube channel, but a week later. Is that enough? </br>
				</p>
				<p class="article">
					-	Less distance for races </br>
					Races in Nascar Cup Series can take 3h30 or more that 4h. that could be too much for people who want to watch races. From 500 miles, you can reduce a few races to 400 miles or maybe 300 miles. </br>
					Nascar has done that Pocono races, or in Michigan 500 -> 400. Less distance means less duration.
				</p>
				<p class="article">
					-	Penalties and rules </br>
					Nascar’s rules are sometimes strange. For example, when the caution comes out, pit road is closed. But if you are engaged into the pit road and the caution provoked the closure of the pit road </br>
					at the wrong moment, you can be penalised for that. That is unfair. If the driver wants to avoid this penalty, he or she has to do a dangerous move. In Nascar, it is security first. </br>
					So, is that contradictory?
				</p>
				<p class="article">
					-	Add non-oval circuit </br>
					In 2017, there are only 2 races in a non-oval circuit, Sonoma and Watkins Glen. The next season, there will be 1 more race. For many years, we have seen spectacular races in a non-oval circuit. </br>
					For example, Watkins Glen 2012, Sonoma 2016, etc … A lot of people, appreciate theses races. Many viewers want that Nascar Cup Series compete more on non-oval races. But, the problem is once </br>
					again circuit’ owners.
				</p>
			</div>

			<div class="container">
				<h5>Want to see more articles, click on the links below</h5>
				<p class="float-left">
					<?php
					if(isset($previous_article))
					{?>
						<a href="index.php?control=routing_page&action=article_page&article=<?php echo($previous_article);?>" class="text-black">Previous Article</a>
					<?php
					}
					else
					{?>
						<label>No previous article</label>
					<?php
					}?>
				</p>
				<p class="float-right">
					<?php
					if(isset($next_article))
					{?>
						<a href="index.php?control=routing_page&action=article_page&article=<?php echo($next_article);?>" class="text-black">Next Article</a>
					<?php
					}
					else
					{?>
						<label>No Next article</label>
					<?php
					}?>
        </p>
      </div>

			<div class="container" id="sept_cinq">
				<div class="widget-area no-padding blank">
					<div class="status-upload">

						<form action="index.php?control=routing_page&action=addcomment" method="post">
							<input id="no_border" type="text" name="name" placeholder="name ?"></input>
							<textarea name="commentaire" placeholder="your comments here"></textarea>
							<?php
								if(isset($_SESSION['error_message']))
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

		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->

		<script src="./view/js/jquery/jquery-3.3.1.js"></script>
		<script src="./view/js/script.js"></script>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
	</body>
</html>

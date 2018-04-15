<?php
/*
This controller is used for routing to the good view
*/

/*
this function is for the home page of the website.
the function asks to the controller loading articles, if there are articles in all category in the database.
the table ($table_articles) will be used in the view home.tpl
*/
function home_page()
{
	require('controller/loading_articles.php');
	$table_articles = get_articles(all);
	require('view/home.tpl');
}

/*
this function is for the what if page.
the function asks to the controller loading articles, if there are articles in the category what if in the database.
the table ($table_articles) will be used in the view what_if.tpl
*/
function what_if()
{
	require('controller/loading_articles.php');
	$table_articles = get_articles(what_if);
	require('view/what_if.tpl');
}

/*
this function is for the videos page. at the moment the function just redirect to the video page.
However, the function will ask to the controller loading video, if there are videos in the database.
a table will be used in the view videos.tpl
*/
function videos()
{
	require('controller/loading_videos.php');
	$table_videos = get_videos();
	require('view/videos.tpl');
}

/*
this function is for the nascar page.
the function asks to the controller loading articles, if there are articles in the category nascar in the database.
the table ($table_articles) will be used in the view news_nascar.tpl
*/
function news_nascar()
{
	require('controller/loading_articles.php');
	$table_articles = get_articles(nascar);
	require('view/news_nascar.tpl');
}

/*
this function is for the standing nascar page.
the function asks to the controller loading results, if there are seasons in the category nascar in the database.
the table ($table_seasons) will be used in the view standing_nascar.tpl
*/
function standing_nascar()
{
	require('controller/loading_results.php');
	$table_seasons = loading_season(nascar);
	require('view/standing_nascar.tpl');
}

/*
this function is for the result nascar page.
the function asks to the controller loading results, if there are seasons in the category nascar in the database.
the table ($table_seasons) will be used in the view results_nascar.tpl
*/
function results_nascar()
{
	require('controller/loading_results.php');
	$table_seasons = loading_season(nascar);
	require('view/results_nascar.tpl');
}

/*
this function is for the F1 page.
the function asks to the controller loading articles, if there are articles in the category F1 in the database.
the table ($table_articles) will be used in the view news_f1.tpl
*/
function news_f1()
{
	require('controller/loading_articles.php');
	$table_articles = get_articles(f1);
	require('view/news_f1.tpl');
}

/*
this function is for the standing f1 page.
the function asks to the controller loading results, if there are seasons in the category f1 in the database.
the table ($table_seasons) will be used in the view standing_f1.tpl
*/
function standing_f1()
{
	require('view/standing_f1.tpl');
}

/*
this function is for the result f1 page.
the function asks to the controller loading results, if there are seasons in the category f1 in the database.
the table ($table_seasons) will be used in the view results_f1.tpl
*/
function results_f1()
{
	require('view/results_f1.tpl');
}

/*
this function is for the loading circuit. this function is called if the user has selected a season in a discipline of motorsport
the function keeps the year of the season.
The function asks to the controller leading results, if there are circuits where the discipline has to take part in the season
the table ($table_circuits) will be used in the view results_race.tpl
*/
function results_loading_circuits()
{
	require('controller/loading_results.php');
	$_SESSION['year_season'] = get_year($_POST['season_selected'])['year'];

	$table_circuits = loading_circuits($_POST['season_selected']);
	require('view/results_race.tpl');
}

/*
this function is for loading the result of a race. this function is called if the user has selected a circuit in a discipline of motorsport
the function keeps the circuit selected.
The function asks to the controller leading results, if there are reslts for the race
the table ($table_results) wil be used in the view results_race.tpl
*/
function results_loading_race()
{
	require('controller/loading_results.php');
	$_SESSION['circuit_selected'] = get_country_circuit($_POST['circuit_selected'])['place'];
	$table_results = loading_race($_POST['circuit_selected']);
	require('view/results_race.tpl');
}

/*
this function is for loading the standings of a discipline in a season. this function is called if the user has selected the season
the function keeps the year of the seasons
the function ask to the controller loading results, the driver and team standing
the tables ($table_standing_driver and $table_standing_team) will be used in the view standing.tpl
*/
function standing_loading()
{
	require('controller/loading_results.php');
	$_SESSION['year_season'] = get_year($_POST['season_selected'])['year'];
	$table_standing_team = get_standing_team($_POST['season_selected']);
	$table_standing_driver = get_standing_driver($_POST['season_selected']);
	require('view/standing.tpl');
}

/*
this function is used to redirect to the article page.
the function receives from the index.php the file's name of the article
*/
function article_page($name)
{
	if(!function_exists('get_articles'))
	{
		require('./controller/loading_articles.php');
	}

	$table_comments = get_comments_article($name);
	require('view/articles/'.$name.'.tpl');
}

/*
this function is for loading information of a driver.
the function receives from the index.php the ID of the driver
the function asks to the controller loading results, the information of the driver, and all race that he/she takes part
the tables ($driver_info and $driver_race) will be used in the view driver.tpl
*/
function driver_page($driver)
{
	require('controller/loading_results.php');
	$driver_info = get_driver_info($driver);
	$driver_race = get_race_one_driver($driver);
	require('view/driver.tpl');
}

/*
this function is for loading information of a team.
the function receives from the index.php the ID of the team
the function asks to the controller loading results, the drivers, all race that the drivers take part, and information of the team
the tables ($team_info, $team_race and $list_driver) will be used in the view team.tpl
*/
function team_page($team)
{
	require('controller/loading_results.php');
	$team_info = get_team_info($team);
	$team_race = get_race_team($team);
	$list_driver = get_driver_team($team);
	require('view/team.tpl');
}

function test_crash()
{
	require('view/test_crash.tpl');
}

function contact_page()
{
	require('view/contact.tpl');
}

function test_input($data) {
	$data = trim($data);
	$data = stripslashes($data);
	$data = htmlspecialchars($data);
	return $data;
}

function send_mail()
{
	if(empty($_POST['first_name']) || empty($_POST["last_name"]) || empty($_POST["mail"]) || empty($_POST["text"]))
	{
		if (empty($_POST["first_name"])) {
			$first_name_error = "First Name is required";
		}
		else {
			$first_name_error = "OK";
		}
		if (empty($_POST["last_name"])) {
			$last_name_error = "Last Name is required";
		}
		else {
			$last_name_error = "OK";
		}
		if (empty($_POST["mail"])) {
			$mail_error = "Mail is required";
		}
		else {
			$mail_error = "OK";
		}
		if (empty($_POST["text"])) {
			$text_error = "Text is required";
		}
		else {
			$text_error = "OK";
		}

		$message = "Message not sended";
		require('view/test_crash.tpl');
	}
	else
	{
		$first_name = test_input($_POST["first_name"]);
		$last_name = test_input($_POST["last_name"]);
		$mail = test_input($_POST["mail"]);
		$text = test_input($_POST["text"]);

		require('controller/send_message.php');
		send_message_verified($first_name,$last_name,$mail,$text);

		$first_name_error = $last_name_error = $mail_error = $text_error = "";
		$message = "Message sended";
		require('view/test_crash.tpl');
	}
}

function addcomment()
{
	if ($_POST['name'] == "" || $_POST['commentaire'] == "")
	{
		$_SESSION['error_message'] = "missing entry";
		article_page($_SESSION['article']);
	}
	else
	{
		$_SESSION['error_message'] = "";

		require('./controller/loading_articles.php');

		add_comments($_POST['name'],$_POST['commentaire'],$_SESSION['article']);
		article_page($_SESSION['article']);
	}
}

?>

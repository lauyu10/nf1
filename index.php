<?php
session_start();

/*
define what category of article or reslts for the php language
Numbers are the same for the database. These one are important since the website has these fields
*/
define('all',0);
define('nascar', 1);
define('f1',2);
define('what_if',3);

/*
$control = define which file will be used to have the controller
$action = define which function in the controller will be used
$article = used in order to pass the ID in the database of the article
$driver = used in order to pass the ID in the database of the driver
$team = used to pass the ID in the database of the team
*/
$control = isset($_GET['control'])?$_GET['control']:'routing_page';
$action = isset($_GET['action'])?$_GET['action']:'home_page';
$article = isset($_GET['article'])?$_GET['article']:'';
$driver = isset($_GET['driver'])?$_GET['driver']:'';
$team = isset($_GET['team'])?$_GET['team']:'';

/*
condition in order to find out the good function in a controller
*/

if ($article != '')
{
  require ('./controller/' .  $control . '.php');
  $action($article);
}
else
{
  if($driver != '')
  {
    require('./controller/' . $control . '.php');
    $action($driver);
  }
  else
  {
    if($team != '')
    {
      require ('./controller/' .  $control . '.php');
      $action($team);
    }
    else
    {
      require ('./controller/' .  $control . '.php');
      $action();
    }
  }
}
?>

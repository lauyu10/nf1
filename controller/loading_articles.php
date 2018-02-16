<?php

/*
this function is called by the controller routing page.
the function will ask to the model information of articles from a category 
*/
function get_articles($number)
{
  require('./model/articles.php');
  $table_articles = get_articles_db($number);

  return $table_articles;
}
?>

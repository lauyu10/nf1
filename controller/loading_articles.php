<?php
/**
 * This controller is used for articles in the website
 * this controller is the link between model and controller
 * @author Laurent Yu
 */

require('./model/articles.php');

/**
 * this function is called by the controller routing page.
 * the function will ask to the model information of articles from a category
 */
function get_articles($number)
{
  $table_articles = get_articles_db($number);
  return $table_articles;
}


function add_comments($name,$commentaire,$article)
{
  $idArticle = get_id_article_db($article);
  add_comments_db($name,$idArticle,$commentaire);
}

function get_comments_article($name)
{
  $idArticle = get_id_article_db($name);
  $table_comments = get_comments_article_db($idArticle);
  return $table_comments;
}

function get_previous_article($name)
{
  $idArticle = get_id_article_db($name);
  $previous_article = get_article_name_db($idArticle - 1);
  return $previous_article;
}

function get_next_article($name)
{
  $idArticle = get_id_article_db($name);
  $next_article = get_article_name_db($idArticle + 1);
  return $next_article;
}
?>

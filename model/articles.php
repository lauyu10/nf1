<?php
/**
 * This model is used for articles
 * @author Laurent Yu
 */

/**
 * this function will find out articles in a idCategory
 * @param Integer $number id of the disciplne
 * @return List $articles list of articles in the discipline
 */
function get_articles_db($number)
{
  require('./model/connect_db.php');
  unset($line);
  if ($number == 0)
  {
    $sql = "select a.nameFile, a.nameImage, a.updateDate, a.title from articles a order by a.updateDate DESC";
    $result = mysqli_query($link,$sql) or die (utf8_encode("request error") . $sql);

    $articles= array();
    while ($line = mysqli_fetch_assoc($result) and isset($line))
    {
			$articles[] = $line;
    }
    return $articles;
  }
  else
  {
    $sql = "select a.nameFile, a.nameImage, a.updateDate, a.title from articles a where a.idCategory = '%d' order by a.updateDate DESC";
    $request = sprintf($sql,$number);
    $result = mysqli_query($link,$request) or die (utf8_encode("request error") . $request);

    $articles= array();
    while ($line = mysqli_fetch_assoc($result) and isset($line))
    {
      $articles[] = $line;
    }
    return $articles;
  }
}

/**
 * this function will find out the id of an article
 * @param String $nameFile name of the file article
 * @return Integer $idArticle['idArticle'] id of the article
 */

function get_id_article_db($nameFile)
{
  require('./model/connect_db.php');
  $sql = "select idArticle from articles a where a.nameFile = '%s'";
  $request = sprintf($sql,$nameFile);
  $result = mysqli_query($link,$request) or die (utf8_encode("request error" . $request));

  $idArticle = mysqli_fetch_assoc($result);
  return $idArticle['idArticle'];
}

/**
 * this function will find out comments from an article
 * @param Integer $idArticle id of the article
 * @return List $comments list of comments for the article
 */

function get_comments_article_db($idArticle)
{
  require('./model/connect_db.php');
  $sql = "select * from comments c where c.idArticle = '%d' order by c.date DESC";
  $request = sprintf($sql,$idArticle);
  $result = mysqli_query($link,$request) or die (utf8_encode("request error") . $request);

  $comments = array();

  while($line = mysqli_fetch_assoc($result) and isset($line))
  {
    $comments[] = $line;
  }

  return $comments;
}

/**
 * this function will put the comment into the database for the article
 * @param String $name name of the user who wants to comment
 * @param Integer $idArticle id of the article
 * @param String $comment comment
 */

function add_comments_db($name,$idArticle,$comment)
{
  require('./model/connect_db.php');
  $sql = "insert into `comments`(idArticle,comment,name) values('%d','%s','%s')";
  $request = sprintf($sql,$idArticle,$comment,$name);
  $result = mysqli_query($link,$request) or dir (utf8_encode("request error"));
}

/**
 * this function will find out the file name of the article with the idArticle
 * @param Integer $idArticle id of the article
 * @return String $nameArticle['nameFile'] name of the article file 
 */

function get_article_name_db($idArticle)
{
  require('./model/connect_db.php');
  $sql = "select a.nameFile from articles a where a.idArticle = '%d'";
  $request = sprintf($sql,$idArticle);
  $result = mysqli_query($link,$request) or die (utf8_encode("request error") . $request);

  $nameArticle = mysqli_fetch_assoc($result);
  return $nameArticle['nameFile'];
}
?>

<?php
/*
this function will find out information of articles in a idCategory
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
?>

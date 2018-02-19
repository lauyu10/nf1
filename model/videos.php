<?php
function get_videos_db()
{
  require('./model/connect_db.php');
  unset($line);
  $sql = "select v.idVideos, v.title from videos v order by v.idVideos DESC";
  $result = mysqli_query($link,$sql) or die (utf8_encode("request error") . $sql);

  $videos= array();
  while ($line = mysqli_fetch_assoc($result) and isset($line))
  {
    $videos[] = $line;
  }
  return $videos;
}
 ?>

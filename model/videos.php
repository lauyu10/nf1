<?php

/**
 * This model is used to get videos
 * @author Laurent Yu
 */

/**
 * this function will give information of videos
 * @return List $videos list of videos
 */
function get_videos_db()
{
  require('./model/connect_db.php');
  unset($line);
  $sql = "select v.idVideos, v.title, v.link from videos v order by v.idVideos DESC";
  $result = mysqli_query($link,$sql) or die (utf8_encode("request error") . $sql);

  $videos= array();
  while ($line = mysqli_fetch_assoc($result) and isset($line))
  {
    $videos[] = $line;
  }
  return $videos;
}
 ?>

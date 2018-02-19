<?php

/*
this function is called by the controller routing page.
the function will ask to the model information of videos
*/
function get_videos()
{
  require('./model/videos.php');
  $table_videos = get_videos_db();

  return $table_videos;
}
?>

<?php

/**
 * This controller is used for videos
 * this controller is the link between model and controller
 * @author Laurent Yu
 */

/**
 * this function is called by the controller routing page.
 * the function will ask to the model information of videos
 */
function get_videos()
{
  require('./model/videos.php');
  $table_videos = get_videos_db();

  return $table_videos;
}
?>

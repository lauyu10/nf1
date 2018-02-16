<?php

//login and password for the database
$host='localhost';
$login='root';
$pass='root';
$db='nf1';



if (! isset($link))
{
	$link = mysqli_connect($host, $login, $pass) or die ("fail to connect :" . mysql_error());
	mysqli_select_db($link, $db) or die (htmlentities("fail on the database :") . $db);
}
?>

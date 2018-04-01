<?php
function send_message_verified($first_name,$last_name,$mail,$text)
{
  $mail = 'jeankazaza@gmail.com'; // Déclaration de l'adresse de destination.
  $text = wordwrap($text, 70, "\r\n");
  $headers =  'MIME-Version: 1.0' . "\r\n";
  $headers .= 'From: Your name <info@address.com>' . "\r\n";
  $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
  $subject = 'From NF1 Contact : ' + $first_name + " " + $last_name;
  mail($mail, $subject, $text, $headers);
}
?>

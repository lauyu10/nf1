<?php
require("G:\Laurent Yu Individual Project CI302\UwAmp\PHPMailer_5.2.0\class.phpmailer.php");
function send_message_verified($first_name,$last_name,$mail,$text)
{
  $mail_to = 'jeankazaza@gmail.com'; // Déclaration de l'adresse de destination.
  $text = wordwrap($text, 70, "\r\n");
  $headers =  'MIME-Version: 1.0' . "\r\n";
  $headers .= 'From: Your name <info@address.com>' . "\r\n";
  $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
  $subject = 'From NF1 Contact : ' + $first_name + " " + $last_name + " mail : " + $mail;
  echo(mail($mail_to, $subject, $text, $headers));
}

function send_message_phpmailer($first_name,$last_name,$mail,$text)
{
  $mail = new PHPMailer();
  $mail->IsSMTP();
  $mail->Mailer = 'smtp';
  $mail->SMTPAuth = true;
  $mail->Host = 'smtp.gmail.com';
  $mail->Port = 465;
  $mail->SMTPSecure = 'ssl';

  $mail->Username = jeankazaza@gmail.com;
}
?>

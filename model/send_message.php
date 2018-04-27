<?php

/**
 * This model is used for send message
 * @author Laurent Yu
 */

require("G:\Laurent Yu Individual Project CI302\UwAmp\PHPMailer_5.2.0\class.phpmailer.php");
require("G:\Laurent Yu Individual Project CI302\UwAmp\PHPMailer_5.2.0\class.smtp.php");

/**
 * this function is using sendmessage
 * this function will try to send a message to a mail address
 * @param String $first_name first name of the user
 * @param String $last_name last name of the user
 * @param String $mail email address of the user
 * @param String $text message
 */
function send_message_verified($first_name,$last_name,$mail,$text)
{
  $mail_to = 'laurentyu1997@gmail.com'; // Déclaration de l'adresse de destination.
  $text = wordwrap($text, 70, "\r\n");
  $headers =  'MIME-Version: 1.0' . "\r\n";
  $headers .= 'From: Your name <info@address.com>' . "\r\n";
  $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
  $subject = 'From NF1 Contact : ' + $first_name + " " + $last_name + " mail : " + $mail;
  echo(mail($mail_to, $subject, $text, $headers));
}

/**
 * this function is using PHPmailer
 * this function will try to send a message to a mail address
 * @param String $first_name first name of the user
 * @param String $last_name last name of the user
 * @param String $mail email address of the user
 * @param String $text message
 */
function send_message_phpmailer($first_name,$last_name,$mail,$text)
{

  $mail_to = new PHPMailer();
  $mail_to->IsSMTP();

//$mail_to->Mailer = 'smtp';

  $mail_to->Host = 'smtp.free.fr';
  $mail_to->Port = 25;

  $mail_to->Username = "pjs6.nf1@free.fr";
  $mail_to->Password = "pekinexpres";

  $mail_to->IsHTML(true);
//$mail->SingleTo = true; if you want to send HTML a sameemail to multiple users. multiple emails will be sent one by one
  $mail_to->From = "pjs6.nf1@free.fr";
  $mail_to->FromName = "From NF1";

  $mail_to->addAddress("laurentyu1997@hotmail.fr","Laurent Yu NF1");

//$mail_to->addBCC("laurentyu1997@hotmail.fr","Laurent Yu NF1");

  $mail_to->Subject = "Testing PHPMailer with localhost";
  $mail_to->Body = "Hi,<br /><br />This system is working perfectly.";

  if(!$mail_to->Send())
      echo "Message was not sent <br />PHPMailer Error: " . $mail_to->ErrorInfo;
  else
      echo "Message has been sent";
}
?>

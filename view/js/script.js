/*
$('p'); // je sélectionne tous les paragraphes

$('.maClasse'); // je sélectionne les éléments ayant .maClasse pour classe

$('#monId'); // je sélectionne l'élément qui possède l'identifiant #monId

jQuery(document).ready(function(){}); = $(document).ready(function(){}); = $(function(){});

*/

/*
function display_hello()
{
  alert("hello world");
}
*/
//display_hello();
$(document).ready(function(){

  console.log("jQuery est prêt !");

  $('a.text-white').hover(function(){
    console.log("je suis sur un lien");
  });

  $.ajax();
  
});

<?php
/**
 * This model is used for results
 * @author Laurent Yu
 */

/**
 * this function will find out all seasons in the discipline
 * @param Integer $idDiscipline id of the discipline
 * @return List $season list of seasons in the discipline
 */
function get_seasons($idDiscipline)
{
  require('./model/connect_db.php');
  $sql = "select s.idSeason,s.year from Season s where s.idDiscipline ='%d'";
  $request = sprintf($sql,$idDiscipline);
  $result = mysqli_query($link,$request) or die (utf8_encode("request error") . $request);

  $season= array();
  while ($line = mysqli_fetch_assoc($result) and isset($line))
  {
    $season[] = $line;
  }
  return $season;

}

/**
 * this function will find out all circuits in the season
 * @param Integer $idSeason id of a season
 * @return List $circuit_season list of circuits which have a race in the season
 */
function get_circuits_season($idSeason)
{
  require('./model/connect_db.php');
  $sql = "select c.idCircuit, c.nameCircuit, c.place from Circuit c where c.idSeason = '%d'";
  $request = sprintf($sql,$idSeason);
  $result = mysqli_query($link,$request) or die (utf8_encode("request error") . $request);

  $circuit_season= array();
  while ($line = mysqli_fetch_assoc($result) and isset($line))
  {
    $circuit_season[] = $line;
  }
  return $circuit_season;
}

/**
 * this function will find out reults of the race
 * @param Integer $idCircuit id of a circuit
 * @return List $result_race list of drivers (result of the race)
 */
function get_race($idCircuit)
{
  require('./model/connect_db.php');
  $sql = "select p.idPilot,r.position,p.pilotNumber,p.namePilot,t.idTeam,t.nameTeam,r.points from Race r, Pilot p, Team t where r.idCircuit = '%d' and r.idPilot = p.idPilot and r.idTeam = t.idTeam order by r.position ";
  $request = sprintf($sql,$idCircuit);
  $result = mysqli_query($link,$request) or die (utf8_encode("request error") . $request);

  $result_race= array();
  while ($line = mysqli_fetch_assoc($result) and isset($line))
  {
    $result_race[] = $line;
  }
  return $result_race;
}

/**
 * this function will find out the year of a season
 * @param Integer $idSeason id of the season
 * @return Integer $year year of the season
 */
function get_year_db($idSeason)
{
  require('./model/connect_db.php');
  $sql = "select s.year from season s where s.idSeason = '%d'";
  $request = sprintf($sql,$idSeason);
  $result = mysqli_query($link,$request) or die(utf8_encode("request error") . $request);

  $year = mysqli_fetch_assoc($result);
  return $year;
}

/**
 * this function will find out the place of the circuit
 * @param Integer $idCircuit id of the circuit
 * @return String $country name of the country
 */
function get_country_circuit_db($idCircuit)
{
  require('./model/connect_db.php');
  $sql = "select c.place from circuit c where c.idCircuit = '%d'";
  $request = sprintf($sql,$idCircuit);
  $result = mysqli_query($link,$request) or die(utf8_encode("request error") . $request);

  $country = mysqli_fetch_assoc($result);
  return $country;
}

/**
 * this function will find out the driver standing
 * @param Integer $idSeason id of a season
 * @return List $standing list of drivers (standing of drivers)
 */
function get_standing_driver_db($idSeason)
{
  require('./model/connect_db.php');
  $sql = "select p.idPilot, p.namePilot, p.pilotNumber, t.idTeam, t.nameTeam, sum(r.Points) as points from pilot p, team t, race r, season s where r.idPilot = p.idpilot and p.idteam = t.idTeam and s.idseason = '%d' and s.idseason = r.idseason group by p.namepilot order by points desc ";
  $request = sprintf($sql,$idSeason);
  $result = mysqli_query($link,$request) or die(utf8_encode("request error") . $request);
  $standing = array();
  while($line = mysqli_fetch_assoc($result) and isset($line))
  {
    $standing[] = $line;
  }
  return $standing;
}

/**
 * this function will find out the driver standing
 * @param Integer $idSeason id of a season
 * @return List $standing list of teams (standing of teams)
 */
function get_standing_team_db($idSeason)
{
  require('./model/connect_db.php');
  $sql = "select t.idTeam, t.nameTeam, sum(r.Points) as points from team t, race r, season s where r.idTeam = t.idTeam and s.idseason = '%d' and s.idseason = r.idseason group by t.nameTeam order by points desc ";
  $request = sprintf($sql,$idSeason);
  $result = mysqli_query($link,$request) or die(utf8_encode("request error") . $request);
  $standing = array();
  while($line = mysqli_fetch_assoc($result) and isset($line))
  {
    $standing[] = $line;
  }
  return $standing;
}

/**
 * this function will find out information of a driver
 * @param Integer $idPilot id of the driver
 * @return Object $driver_info information of the driver
 */
function get_driver_info_db($idPilot)
{
  require('./model/connect_db.php');
  $sql = "select p.namePilot, p.pilotNumber, p.placeBirth, p.dateBirth, p.country, t.idTeam, t.nameTeam from pilot p, team t where p.idPilot = '%d' and p.idTeam = t.idTeam";
  $request = sprintf($sql,$idPilot);
  $result = mysqli_query($link,$request) or die(utf8_encode("request error") . $request);
  $driver_info = mysqli_fetch_assoc($result);
  return $driver_info;
}
//date("y")
/**
 * this function will find out races of a driver
 * @param Integer $idPilot id of the driver
 * @return List $driver_race list of races for the driver
 */
function get_race_one_driver_db($idPilot)
{
  require('./model/connect_db.php');
  $sql = "select r.position, r.points, s.year, c.nameCircuit, c.place, t.idTeam, t.nameTeam from race r, season s, circuit c, team t where r.idPilot = '%d' and r.idcircuit = c.idcircuit and r.idseason = s.idseason and r.idteam = t.idteam";
  $request = sprintf($sql,$idPilot);
  $result = mysqli_query($link,$request) or die(utf8_encode("request error") . $request);
  $driver_race = array();
  while($line = mysqli_fetch_assoc($result) and isset($line))
  {
    $driver_race[] = $line;
  }
  return $driver_race;
}

/**
 * this function will find out information of a teams
 * @param Integer $idTeam id of the team
 * @return Object $team_info information of the team
 */
function get_team_info_db($idTeam)
{
  require('./model/connect_db.php');
  $sql = "select t.nameTeam from team t where t.idteam = '%d'";
  $request = sprintf($sql,$idTeam);
  $result = mysqli_query($link,$request) or die(utf8_encode("request error") . $request);
  $team_info = mysqli_fetch_assoc($result);
  return $team_info;
}

/**
 * this function will find out races of a team
 * @param Integer $idTeam id of the team
 * @return List $race_team list of races for the team
 */
function get_race_team_db($idTeam)
{
  require('./model/connect_db.php');
  $sql = "select r.position, r.points, s.year, c.nameCircuit, c.place, p.namePilot, p.pilotNumber, p.idPilot from race r, circuit c, season s, pilot p where r.idTeam = '%d' and r.idPilot = p.idPilot and r.idCircuit = c.idCircuit and r.idSeason = s.idSeason";
  $request = sprintf($sql,$idTeam);
  $result = mysqli_query($link,$request) or die(utf8_encode("request error") . $request);
  $race_team = array();
  while($line = mysqli_fetch_assoc($result) and isset($line))
  {
    $race_team[] = $line;
  }
  return $race_team;
}

/**
 * this function will find out drivers of the team
 * @param Integer $idTeam id of the team
 * @return List $list_driver list of drivers in the team
 */
function get_driver_team_db($idTeam)
{
  require('./model/connect_db.php');
  $sql = "select p.idPilot, p.namePilot, p.pilotNumber, p.country from pilot p where p.idTeam = '%d'";
  $request = sprintf($sql,$idTeam);
  $result = mysqli_query($link,$request) or die(utf8_encode("request error") . $request);
  $list_driver = array();
  while($line = mysqli_fetch_assoc($result) and isset($line))
  {
    $list_driver[] = $line;
  }
  return $list_driver;
}
?>

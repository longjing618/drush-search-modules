<?php
// $Id: 

/**
 * @file Drush search commands
 */

/**
 * Implementation of hook_drush_command().
 */
function search_drush_command()
{
  $items['search'] = array
  (
    'callback' => 'general',
    'description' => 'Search modules',
    'example' => array
    (
       'drush search apache\ php --page=5' => 'The search content is "apache php", the result will show 5 pages about modules name and relative descriptions',
    ),
    'arguments' => array(
      'module' => 'Module name.',
     ),
    'options' => array
     (
       'page' => 'pages in result',
     ),
     'bootstrap' => DRUSH_BOOTSTRAP_MAX,
    );
   return $items;
}

function general($module)
{
  $module=str_replace(" ","%20",$module);
  echo "Getting modules' name and description now\nPlease wait...\n";
  if(!$page=drush_get_option('page'))
    $page=0;
  $output = shell_exec(DRUSH_BASE_PATH."/commands/search/search.sh $module $page");
  echo $output;
}
    
?>

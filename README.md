First, please create a folder "searchmodule" under folder drush/commands/
Then please place "searchmodule.drush.inc", "search.sh" under "searchmodule" folder and make sure that the shell "search.sh" in drush/commands/searchmodule has executive permission.

We can use command:

drush search SearchText --page=number

to search modules depending on what Searchtext we input, the search result includes modules' name, projects name and description.

We can use argument --page=number (drush search function will set this argument with 0 by default) to decide how many pages of modules we want to show.

Here is the example:

Searchtext: solr (one page)

drush search solr

Searchtext: solr (six pages)

drush search solr --page=6

Search result (example):

Solr (solr)
For the 'official' Solr project, see Apache Solr Search Integration . This module handles integration with Solr - an XML-based front-end to the Lucene search engine - and is a replacement for the core search.module. Call solr.module functions from any module that handles a custom node type (example hook ...

Openlayers Apachesolr Integration (openlayers_solr)
http://drupal.org/project/openlayers ) and apachsolr ( http://drupal.org/project/apachesolr ) with local solr integartion. ... and can be overridden by setting the 'openlayers_solr_map' variable. The real strength of this module ... in solr. This is because of the http://drupal.org/project/geofield. Tutorials Video ...

What is in brackets in the example result above is the project name of module.

Notice:

1. If Searchtext contain space, we need to use "\" to escape space. For example, if we want to search "send email", the whole command is

drush search send\ email

2. " \ ", " ' " and " " " are not allowed in Searchtext

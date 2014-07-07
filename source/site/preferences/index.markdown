---
layout: page
title: "Preferences"
date: 2011-11-05T15:15:58+00:00
comments: true
sharing: true
footer: true
group: Site
---


Preferences for [PmWiki/access keys](/pm-wiki/access-keys) and edit form

This page can be used as template for (personal) preferences, or set as default site preference (see below).

->[@
  # Access keys - hold Alt (Windows IE), Shift + Alt (Firefox)
  # or Control (Mac) and tap the indicated key on your keyboard
  # to trigger the corresponding action.
#  'ak_view'          => * ,         # view page
  'ak_edit'          => 'e',         # edit page
  'ak_history'       => 'h',         # page history
#  'ak_print'         => *,          # print view of page
  'ak_recentchanges' => 'c',         # Recent Changes
  'ak_save'          => 's',         # save page
  'ak_saveedit'      => 'u',         # save and keep editing
  'ak_savedraft'     => 'd',         # save as draft
  'ak_preview'       => 'p',         # preview page
  'ak_textedit'      => ','          # focus to edit textarea (at the end)
  'ak_em'            => 'i',         # emphasized text (italic)
  'ak_strong'        => 'b',         # strong text (bold)

#  'ak_attach'        => *,          # attach a file
#  'ak_backlinks'     => *,          # show backlinks
#  'ak_logout'        => *,          # log out

  # Editing components
  'e_rows' => '20',                  # rows in edit textarea
  'e_cols' => '70',                  # columns in edit textarea
  'Site.EditForm' => 'Site.EditForm' # location of EditForm
  @]

To create personal user (browser) preferences,
* make a copy of [ this page](/site/{$full-name}?action=source-) somewhere, preferably as @@Profiles.*<span class='text-success'>insert_your_name_here</span>*-Preferences@@
* edit that page with your new preferred settings,
* select [ Set Preferences of this Page](/site/{$full-name}?setprefs={$full-name}-) on the page containing your newly created settings. 
-> This sets a preference cookie on your browser which tells PmWiki where to find your personal preference settings.

To revert to the PmWiki default preferences
* select [ Revert to PmWiki Default Preferences](/site/{$name}?setprefs=) to unset the preference cookie

See also [Cookbook:UserConfigurations](/site/cookbook:user-configurations) about how to customise the edit form for personal use.


Note that by default, parsing of {$FullName} is disabled. To make it the default site preference, add
 XLPage('prefs', "Site.Preferences");
to a config file (e.g. local/config.php).

To disable user preferences entirely set $EnablePrefs = 0;

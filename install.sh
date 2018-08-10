#!/bin/bash
set -e

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
PLUGINS=$DIR/plugins

# récupération des plugins
cd $PLUGINS
if [ ! -d "redmine_omniauth_client" ]; then
    git clone -s https://github.com/arlin2050/redmine_omniauth_client.git
    chmod 755 redmine_omniauth_client
    cd redmine_omniauth_client
    git checkout 0.0.3
fi

cd $PLUGINS
if [ ! -d "redmine_stealth" ]; then
    git clone -s https://github.com/arlin2050/redmine_stealth.git
    chmod 755 redmine_stealth
    cd redmine_stealth
    git checkout 0.6.0-oru
fi

cd $PLUGINS
if [ ! -d "readme_at_repositories" ]; then
    git clone -s https://github.com/simeji/readme_at_repositories.git
    chmod 755 readme_at_repositories
    cd readme_at_repositories
    git checkout origin/master
fi

cd $PLUGINS
if [ ! -d "redmine_iframe" ]; then
    git clone -s https://github.com/arlin2050/redmine_iframe.git
    chmod 755 redmine_iframe
    cd redmine_iframe
    git checkout 0.0.4
fi

cd $PLUGINS
if [ ! -d "select_to_select2" ]; then
    git clone -s https://github.com/arlin2050/select_to_select2.git
    chmod 755 select_to_select2
    cd select_to_select2
    git checkout 0.1.2
fi

cd $PLUGINS
if [ ! -d "google_analytics_plugin" ]; then
    git clone -s https://github.com/arlin2050/redmine-google-analytics-plugin.git google_analytics_plugin
    chmod 755 google_analytics_plugin
    cd google_analytics_plugin
    git checkout 0.2.0
fi

cd $PLUGINS
if [ ! -d "redmine_custom_auto_complete" ]; then
    git clone -s https://github.com/arlin2050/redmine_custom_auto_complete.git
    chmod 755 redmine_custom_auto_complete
    cd redmine_custom_auto_complete
    git checkout 0.0.3
fi

# installation des plugins
cd $DIR
bundle install
if [ "$#" -ne 1 ]; then
    environnement=production
else
    environnement=$1
fi
bundle exec rake redmine:plugins:migrate RAILS_ENV=$environnement

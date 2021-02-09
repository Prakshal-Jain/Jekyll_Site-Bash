#!/bin/bash

#Platform: Linux
# Run with -dep option to install all the dependencies.
if  [[ $1 = "-dep" ]]; then
    sudo apt-get install ruby-full build-essential

    echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
    echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
    echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc

    sudo gem install jekyll bundler
fi

#Below script builds the static files ready to be uploaded
git pull
bundle update
bundle exec jekyll build

#Push the changes in _site folder to the UB Server
echo "Please enter remote system location (Example: username@timberlake.cse.buffalo.edu:Desktop/website)"
read serv
scp -r ./_site/* ${serv}


#------------------------------
#Created by: Prakshal Jain (prakshal@buffalo.edu
#Source: https://jekyllrb.com/docs/installation/, https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories

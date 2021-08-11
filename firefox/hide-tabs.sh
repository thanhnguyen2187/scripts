#!/bin/bash

cd $HOME/.mozilla/firefox/*.default-release || exit

mkdir -p chrome
tee -a chrome/userChrome.css <<-EOF
#TabsToolbar { visibility: collapse !important; }
EOF

cd - || exit

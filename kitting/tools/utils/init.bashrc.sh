#!/bin/bash

set_locale() {
    cat <<-EOD >> ~/.bashrc
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
EOD
}

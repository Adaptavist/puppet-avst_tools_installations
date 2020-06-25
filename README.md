# avst_tools_installations Module
[![Build Status](https://travis-ci.org/Adaptavist/puppet-avst_tools_installations.svg?branch=master)](https://travis-ci.org/Adaptavist/puppet-avst_tools_installations)

## Overview

The **avst_tools_installations** module handles the installation and configuration of support and debugging tools for avstapp.

Support for tarballs and packages.
It downloads tarball specified as tarball_location_url with command download_command and stores it to download_location. Extracts the downloaded tarball with extract_command to extract_location. Possibly creates script based on template provided as parameters. See avst_tarball_to_install for details and defaults. 

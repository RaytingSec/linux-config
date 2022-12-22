README
====================

- Look for your powerline install location
    + Usually go to your pip packages location
        
        ```bash
        pip show powerline-status | egrep '^Location: '
        ```

- Generally the config file of interest is the shell powerline config
    + `site-packages/powerline/config_files/themes/shell/default.json`
    + Be sure to back up before you modify

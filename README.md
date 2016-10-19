# puppet-bundle

A puppet face that packages control repo assets into a portable collection that can be used in a masterless context with `puppet apply`

* [Overview](#overview)
* [Usage](#usage)
* [Thanks](#thanks)

## Overview

The bundled package includes:
```
.
├── hiera.yaml (or lookup.conf)
├── hieradata/
├── modules/
└── site/
```

## Usage

    puppet bundle DIR [--name]

... bundles into a package

## Thanks
- [Erik Dalén](https://github.com/dalen) for providing a stellar clean & modern Puppet Face example at https://github.com/dalen/puppetls

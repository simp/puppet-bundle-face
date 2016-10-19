# puppet-bundle

A puppet face that packages control repo assets into a portable collection that can be used in a masterless context with `puppet apply`


* [Overview](#overview)
* [Usage](#usage)

## Overview

The bundled package includes:
```
.
├── hiera.yaml
├── hieradata/
├── modules/
└── site/
```

## Usage

    puppet bundle DIR [--name]

... bundles into a package

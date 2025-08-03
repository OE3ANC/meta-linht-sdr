# meta-linht-sdr

A Yocto Project layer providing GNU Radio and Software Defined Radio (SDR) support for the LinHT Handheld Transceiver project.

## Overview

This layer is a **fork of [meta-sdr](https://github.com/balister/meta-sdr)** by Philip Balister. We extend our sincere gratitude to Philip Balister and the meta-sdr community for their excellent work in providing GNU Radio and SDR support for Yocto Project.

The layer has been adapted and customized to support the specific requirements of the LinHT project while maintaining compatibility with the broader SDR ecosystem.

## Dependencies

This layer depends on the following layers:

### Core dependencies
```
URI: git://github.com/openembedded/openembedded-core.git
branch: master
revision: HEAD
```

### Meta-OpenEmbedded layers
```
URI: git://github.com/openembedded/meta-openembedded.git
branch: master
revision: HEAD
```

**Required meta-openembedded sublayers:**
- **meta-oe**: OpenEmbedded layer
- **meta-filesystems**: Filesystem support
- **meta-networking**: Network protocols and tools
- **meta-python**: Python packages and runtime

## Integration instructions

### Adding to build configuration

Add the required layers to your `bblayers.conf`:

```bash
# Core dependencies
BBLAYERS += "/path/to/openembedded-core/meta"

# Meta-OpenEmbedded layers
BBLAYERS += "/path/to/meta-openembedded/meta-oe"
BBLAYERS += "/path/to/meta-openembedded/meta-filesystems"
BBLAYERS += "/path/to/meta-openembedded/meta-networking"
BBLAYERS += "/path/to/meta-openembedded/meta-python"

# LinHT SDR layer
BBLAYERS += "/path/to/meta-linht-sdr"
```

## License

This layer maintains the same licensing as the original meta-sdr layer. Individual recipes may have their own specific licenses.

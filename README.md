# Feather: Stik Edition

[![GitHub Release](https://img.shields.io/github/v/release/khcrysalis/feather?include_prereleases)](https://github.com/khcrysalis/feather/releases)
[![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/khcrysalis/feather/total)](https://github.com/khcrysalis/feather/releases)
[![GitHub License](https://img.shields.io/github/license/khcrysalis/feather?color=%23C96FAD)](https://github.com/khcrysalis/feather/blob/main/LICENSE)

Feather: Stik Edition is a developer tool for testing applications on real devices. It signs your builds using developer certificates so you can validate functionality on hardware. The app is intended for developers to deploy and debug their own software.

<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="Images/Image-dark.png"><source media="(prefers-color-scheme: light)" srcset="Images/Image-light.png"><img alt="Pointercrate-pocket." src="Images/Image-light.png"></picture></p>

## Features
- User friendly, and clean UI.
- Sign and deploy test builds.
- Designed for internal development and quality assurance only.
- Supports [AltStore](https://faq.altstore.io/distribute-your-apps/make-a-source#apps) repositories.
- View detailed information about apps and your certificates.
- Configurable signing options mainly for modifying the app, such as appearance and allowing support for the files app.
  - This includes patching apps for compatibility and Liquid Glass.
- Tweak support for advanced users, using [Ellekit](https://github.com/tealbathingsuit/ellekit) for injection. 
- Supports injecting `.deb` and `.dylib` files.
- Actively maintained: always ensuring testing works reliably.
- No tracking or analytics, ensuring user privacy.
- Of course, open source and free.

## How does it work?

How Feather: Stik Edition works is a bit complicated, with multiple ways to deploy and test your apps. Below is a brief overview of the important features.

To start off, we need a validly signed IPA. We can achieve this with Zsign, using a provided IPA using a `.p12` and `.mobileprovision` pair.

#### Deploying Test Builds

Feather: Stik Edition can deploy developer builds in two ways:

- **Local Server** – Host your IPA on a private HTTPS server and use `itms-services` to trigger installation. This replicates TestFlight-style over‑the‑air deployments.
- **Paired Device** – Connect using a pairing file and VPN so the app can talk directly to `installd`, similar to Xcode's run‑on‑device feature.

Both methods require your own developer certificates and provisioning profiles. They are intended solely for testing the apps you build.

## Download

Visit [releases](https://github.com/khcrysalis/Feather/releases) and get the latest `.ipa`.

## Contributing

Read the [contribution requirements](./CONTRIBUTING.md) for more information.

## Sponsors

| Thanks to all my [sponsors](https://github.com/sponsors/khcrysalis)!! |
|:-:|
| <img src="https://raw.githubusercontent.com/khcrysalis/github-sponsor-graph/main/graph.png"> |
| _**"samara is cute" - Vendicated**_ |

## Star History

<a href="https://star-history.com/#khcrysalis/feather&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=khcrysalis/feather&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=khcrysalis/feather&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=khcrysalis/feather&type=Date" />
 </picture>
</a>

## Acknowledgements

- [Samara](https://github.com/khcrysalis) - The maker
- [idevice](https://github.com/jkcoxson/idevice) - Backend for builds with this included, used for communication with `installd`.
- [*.backloop.dev](https://backloop.dev/) - localhost with public CA signed SSL certificate
- [Vapor](https://github.com/vapor/vapor) - A server-side Swift HTTP web framework.
- [Zsign](https://github.com/zhlynn/zsign) - Allowing to sign on-device, reimplimented to work on other platforms such as iOS.
- [LiveContainer](https://github.com/LiveContainer/LiveContainer) - Fixes/some help
- [Nuke](https://github.com/kean/Nuke) - Image caching.
- [Asspp](https://github.com/Lakr233/Asspp) - Some code for setting up the http server.
- [plistserver](https://github.com/nekohaxx/plistserver) - Hosted on https://api.palera.in.

## License 

This project is licensed under the GPL-3.0 license. You can see the full details of the license [here](https://github.com/khcrysalis/Feather/blob/main/LICENSE). It's under this specific license to keep this developer tool transparent; before this project there weren't any open source tools that filled this gap.

By contributing to this project, you agree to license your code under the GPL-3.0 license as well (including agreeing to license exceptions), ensuring that your work, like all other contributions, remains freely accessible and open.

## Disclaimer

This project is maintained here, on GitHub. Releases are distributed here, on GitHub. We do not currently have a project website outside of this repository. Please make sure to avoid any sites that host our software as they are often malicious and are there to mislead to user.

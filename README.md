# Club Penguin Continued Media Server

This archive is an as-clean and as-complete Club Penguin™ Media Server.

A Club Penguin™ Media Server provides the required assets for the Adobe/Shockwave Flash Club Penguin client to load assets and run properly.

This media server is compatible with [Aurora](https://github.com/anthonywww/aurora), a Club Penguin server emulator.

### Copyright Notice

These files are owned by Disney Interactive Studios (originally by RocketSnail Games Ltd. [now Hyper-Hippo Entertainment Ltd.]).

The files are provided "AS-IS" under [17 U.S.C. § 107 "Fair Use"](https://www.gpo.gov/fdsys/pkg/USCODE-2010-title17/pdf/USCODE-2010-title17-chap1-sec107.pdf) and in no way hold Disney, Disney Interactive Studios or its predecesors liable for how this content is used.

In no way do these files or its modifications represent Disney's stance or views.

The works under [public](./public/) are provided under implication of [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en).

### Sources

These are sources that helped in the supplementation of this archive:

- [icer.ink](https://icer.ink/)
- Wayback Machine Web Archive Club Penguin Official Sources https://media1.clubpenguin.com/
- [Club Penguin Continued](https://cpcontinued.com/)
- [CPRewritten](https://cprewritten.net/)
- Club Penguin Archives (wiki swf files)

### Modifications

Any files or directories that have had major changes/modifications to are listed below.

A few of the ActionScript sources are available under [src](./src/).

If you decide on making your own edits, it is highly recommended to modify the P-code (similar to Java byte-code/assembly) instead of the
decompiled ActionScript 2/3 as it may yield broken SWF files upon re-compilation.

To modify the SWF files, I'd recommend using [FFdec](https://github.com/jindrapetrik/jpexs-decompiler) and [swfmill](https://github.com/djcsdy/swfmill/).

**Note:** The `.bak` files are backups of previous generation modifications/original files.

- `loader.swf` - Points to media1 server and login/redemption/world servers.
- `v2/client/shell.swf` - In order to get content to work properly (p-code exclusive).
- `v2/client/dependencies.json` - In order to inject/load new dependencies.
- `v2/client/airtower.swf` - In order to get WebSocket side-loading.
- `v2/client/chatenc.swf` - Chat Encryption support.
- `v2/client/captcha.swf` - Captcha anti-bot support.
- `v2/content/local/en/login/*` - Custom login.
- `v2/content/global/crumbs/global_crumbs.swf` - Better id support/handling.
- `v2/content/local/en/crumbs/local_crumbs.swf` - Better id support/handling.
- `v2/content/global/content/*` - Multi-year/multi-event content support.


### What is Club Penguin Continued

**Club Penguin Continued** was an independent project of mine that started October 2017 in college to reverse-engineer Club Penguin and revive the servers for my own entertainment with friends. The goal of the project was to remain as close to vanilla as possible and make as few edits to the original SWF files, while enabling/adopting multi-version support where possible.

I started reverse engineering the "XT" or Smart Fox Server protocol independently in 2014 and boosted those efforts in 2017 to improve upon existing code and leverage a more modular design which should allow for multiple version to co-exist.

**Disclaimer:** I am not part of any team or group and am not associated with any recent unfortunate events and controvercies surrounding the name or associations of "Club Penguin Continued." These files and reverse-engineering efforts pre-date said events and are purely coincidental.

Please do not use these files to make yet another CPPS micro-transaction clone or used in a way that may violate local, state, or national laws.

Please do not use these files unethically.

**Waddle on!**

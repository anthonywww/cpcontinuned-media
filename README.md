# Club Penguin Continued Media Server

This archive is an as-clean and as-complete Club Penguin™ Media Server.

A Club Penguin™ Media Server provides the required assets for the Adobe/Shockwave Flash Club Penguin client to load assets and run properly.

This media server is compatible with [Aurora](https://github.com/anthonywww/aurora), a Club Penguin server emulator.


### Copyright Notice

These files are owned by Disney Interactive Studios (originally, New Horizon Interactive in Kelowna, BC, Canada).

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

#### Contribution

If you have any **original** media files that you would like to contribute/donate, please open a PR with the following template below.

**Note:** If your files have been modified or were not part of the original Club Penguin game itself, do not submit your files. If you attempt to submit modified, misleading or malicious files you will be barred from submitting any content going forward.

Please also note; if your submitted files do not contain or match our internal record of original SHA-256 hashes or your files do not match the hashes you provided we may discard your submission.

```md
# Media Contribution

**Type:** `client/interface/rooms/music/locale/games`
**Path:** `path of where the file(s) normally resided`
**Year:** `year file(s) were created/present`
**Event:** `event associated with this file, if any, or just leave empty`

### SHA-256 hashes:

- file1.swf `sha256 hash of file1.swf goes here`
- file2.swf `sha256 hash of file2.swf goes here`
- file3.swf `sha256 hash of file3.swf goes here`


### Description:

Write a short description as to what the file(s) are/contain.

```



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


### Special Thanks

A huge thanks to the entire Club Penguin team that built the island that we all know and love. Here are just a few names that should be recognized.

- [Lance Priebe](https://twitter.com/lancepriebe) (rsnail) - Founder. Current CEO of Hyper Hippo Games (former Rocket Snail Games Ltd.)
- [Lane Merrifield](https://twitter.com/lanemerrifield) (Billybob) - Co-founder
- [Dave Krysko](https://twitter.com/DaveKrysko) (Skidder) - Co-founder
- [Chris Hendricks](https://twitter.com/_screenhog) (Screenhog) - Lead designer (audio, art, animation) until October 29, 2010. Current YouTube content creator showing off [BTS content of Club Penguin](https://www.youtube.com/@ChrisHendricks)

If you were a former employee of Disney / New Horizon Interactive who worked on Club Penguin and want to be added please [contact me](mailto:me@anthonyw.me) with evidence of your employment, legal name, job position, and a description of the work you contributed.

**Waddle on!**

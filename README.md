![cRequire image](http://i-got.ratelimited.today/ACxiiRW.png)
# cRequire - a simple module handler

## About
cRequire (acronym for "custom require") - is a custom modular handler for Roblox scripts, whenever it's for a game, or for a script - purely made for fun.

as of 6th July 2022, this can:
    - serve as a GetObjects handler
    - serve as a sound handler (can play sound, and change settings easily through music settings)
    - serve as a file handler (only for roblox exploiting scripts)
    - serve as a module editor
    and of course, serves as a module handler - all in a classy style no game developer would be laughing at you.

I am not responsible if this gets used in exploiting scripts, I only provide a simpler way to use stuff.
If you want, you can fork this project and write your own features to it, or modify it - all up to the editor's wish, 
however I'd love it if you'd credit me for making crequire. That'll be awesome!

## Installation
If you're a game developer on Roblox - simply go to "source.lua", copy the code, then make a ModuleScript in the destination you want to put it in (and is reachable through scripts in Roblox Studio), and then replace the default ModuleScript code with this one, by pressing Ctrl+A, and then Ctrl+V.

If you're a script developer - I'd advice you to make your own fork, which lets you uncomment what was commented by default for your needs - and then, loadstring the link normally like this: 
`loadstring(game:HttpGet("replace this with the fork's link"))()`

... however you don't need to do that, if you don't care about `getsynasset` extra functionality in GetSound and `GetFile`. The decision is up to you.

## Credits, responsibilities and licenses
I (revolume) am the original creator of cRequire, and cRequire is on `CC BY` license - meaning that it can be used for commercial purposes and so on, as long as you credit the creator.
I am not responsible if this script gets used in malicious scripts/exploits, or in a huge Roblox game on the front page. I only provide the handler - and what the user does with it, is up to them.

And that's about it - happy scripting!

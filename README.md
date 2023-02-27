## Join the community
There are thousands of users, but most are content to simply download and use the interface without further ado. If you wish to get more involved though, have some questions you can't find answers to anywhere else or simply just wish to stop by and say hello, we have a [discord](https://discordapp.com/) server as well. 

* [Discord](https://discord.gg/Rc9wcK9cAB)
* [Twitter](https://twitter.com/KkthnxUI)

## Buy me a coffee
Donations are welcome, but not required to use the UI at all. Donations help me further my development and fuel my gaming! Donations will never be a requirement to use the UI! If you would like to donate, you can do so down below.

* [PayPal](https://www.paypal.me/kkthnx)
* [Patreon](https://www.patreon.com/kkthnx)

## Overview

The addon template provides a starting point for creating addons for World of Warcraft (WoW) that includes a configuration panel for users to customize the addon's behavior and a saved variable database for storing data. The template can be customized to include any desired functionality.

The template uses the Ace3 addon framework or Blizzard's built-in interface options to create the configuration panel. The user can easily enable or disable options and save their preferences to the saved variable database.

## Getting started

To use the addon template, follow these steps:

    Copy the code for the template into a new Lua file with a name that matches your addon's name (e.g. MyAddon.lua).
    Modify the functions and data in the MyAddon table to implement your addon's functionality. You can add new functions, event handlers, and variables as needed.
    Create a ZIP file containing your addon Lua file and any other necessary files, such as artwork or sound files.
    Distribute the ZIP file to other WoW players who can then install the addon by extracting the files to their WoW addons directory.

## Template components

The template includes the following components:
### MyAddon table

The MyAddon table is the main table that holds your addon's functions and data. It includes the following properties:

    debug (boolean): A flag that enables or disables debug messages. Set this to true to enable debug messages or false to disable them.
    Initialize (function): A function that initializes your addon. Add any initialization code you need to this function.
    OnEvent (function): A function that handles events. You can add code to handle events here.
    Debug (function): A function that prints debug messages. You can call this function in your addon's code to output debug messages to the chat window.

## Saved variable database

The saved variable database is used to store data for your addon. The template includes the following saved variables:

    MyAddonDB (table): A table that holds any saved variables you need for your addon. You can add properties to this table as needed.

## Configuration panel

The configuration panel allows users to customize the behavior of your addon. The template uses the Ace3 addon framework or Blizzard's built-in interface options to create the configuration panel.

To add options to the configuration panel, you can create new elements using the appropriate API for your chosen framework. The template includes two example options: myOption and debug.

    myOption (boolean): A boolean option that users can enable or disable to customize your addon's behavior.
    debug (boolean): A boolean option that enables or disables debug messages.

## Conclusion

That's a brief overview of the addon template and how to use it. I hope this documentation helps you get started with creating your own addons for WoW! Let me know if you have any questions or if there's anything else I can do to assist you.

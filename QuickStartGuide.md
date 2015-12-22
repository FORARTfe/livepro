# Introduction #

Here's the very bare minimum quick start guide to running this system.

# Build #

Checkout the code:

**`$ svn checkout http://livepro.googlecode.com/svn/trunk/ livepro-read-only && cd livepro-read-only`**

Build livemix:

**`$ cd livemix && qmake && make -j3; cd..`**

Build the mixer UI:

**`$ cd ../ && svn checkout http://miditcp.googlecode.com/svn/trunk/ miditcp && cd livepro-read-only`**

**`$ cd mixerui && qmake && make -j3; cd ..`**

# Run #
Run livemix:

**`$ cd livemix && ./livemix &; cd ..`**

Run mixerui:

**`$ cd mixerui && ./mixerui`**

# Using #
When mixerui launches, it will prompt you to setup an output. Just add a newoutput with 'localhost' as the server.

  * Once you're in the mixer, it will query 'livemix' for the video capture inputs it's detected and display the previews to you.
  * Use the '**Edit**' menu to add 'Group Player's (generic slide players - design your own slides), 'Overlays' (overlay over live video), 'Camera Mixer' (PiP, etc) or a Video Player.
  * Just click on a camera or a group player to make it live
  * Press the 'play' icon on an overlay to make it live
# Introduction #

PHC uses the livepro project in a variety of different ways. Diagrammed here is the mixing/control setup in the control booth.


# Diagram #

[![](http://www.mybryanlife.com/userfiles/PHC-Systems-Layout-Small.png)](http://www.mybryanlife.com/userfiles/PHC-Systems-Layout.pdf)

In addition to livepro (this Google code project), several other software projects are referenced in this diagram:

  * DViz: http://code.google.com/p/dviz/
  * dmxsliderwin: http://code.google.com/p/dmxsliderwin/
  * miditcp: http://code.google.com/p/miditcp/

# Details #

## Computer 1 ##
This is the primary Command and Control computer, which directly connects to the keyboard and mouse, shared with computers 3 and 4 via [synergy](http://synergy-foss.org/).

### DViz ###
This computer's primary purpose is to run [DViz](http://code.google.com/p/dviz/) to manage front-of-house projection for song lyrics, slides, Bible verses, or anything else that needs to be presented.

### MixerUI ###
This computer also runs 'mixerui' (see the 'mixerui' subfolder) to control video switching and overlays for Computer 2, the video mixer running 'livemix' (see the 'livemix' subfolder.)

### MixerUI and DViz Interaction ###
MixerUI uses overlays with a HTTP Image object to receive a 'raw' frame feed from DViz's secondary output. DViz is setup with appropriately designed templates which have a dedicated template for the secondary output that provides properly-formatted text boxes and graphics for lower-third functionality. Both the Bible and Song modules have templates setup for lower-thirds on the secondary output, while the Text Import Tool has a template that is used for sermon importing that also has a secondary output template with lower-third text and graphics.

When any of the groups with a appropriately-setup template goes live in DViz, the secondary output renders an ARGB32 frame of the corresponding slide and sends it over the wire (TCP) to both the mixerui for previewing, as well as to livemix on Computer 2 (192.168.0.18) for overlaying (if the overlay is activated by the mixerui.)

MixerUI can also optionally setup a group player (or overlay if desired) that connects to the 'raw' frame feed from DViz's primary output (front of house). The group player can then be switched to just like a camera feed for full-screen graphics display from DViz.

### PTZ Control ###
Computer 1 also runs 'ptzcontrol' (see the 'ptzcontrol' subfolder in this Google Code project source tree) to control a pan/tilt/zoom camera head based on an Arduino Uno, Linksys WRT54G, three servos, and a Samsung 3-CCD camera placed on stage behind some foliage for audience reaction shots or musician closeups. It connects to 'livemix' on Computer 2 to display a preview feed from the camera on the PTZ head. Of course, as far as livemix knows, there's nothing special about the feed - it's just another camera.

### Lighting Control ###
Computer 1 runs the 'dmxsliderwin' project to control the house and stage light dimmers. It exposes a HTTP interface, which DViz takes advantage of with appropriate default 'user event actions' set on Songs and Videos to raise/lower house lights for videos, and raise/lower the lights over the worship band for songs.

### MIDI Control ###
All the above programs (DViz, MixerUI, PTZ Control, and Lighting) connect to the [miditcp](http://code.google.com/p/miditcp/) server on Computer 2. This server reads inputs to USB-to-MIDI adapter from a board in the AV Booth that has a number of buttons and sliders. The values of these buttons and sliders are exposed via a simple TCP stream (see the http://code.google.com/p/miditcp/ page for details).

Each of the programs above use the MIDI data stream for different purposes:
  * DViz, for example, uses buttons to change slides, blackout, or go to logo, and a slider to change the fade speed
  * MixerUI, of course, uses buttons to switch cameras, toggle overlays, and change fade speed.
  * PTZ Control uses buttons to trigger pan/tilt/zoom presets.
  * dmxsliderwin uses sliders from MIDI to change lighting preset levels and trigger fades.

## Computer 2 ##
This computer handles the video mixing/crossfading work via the 'livemix' subfolder in this Google Code project. It outputs using an NVidia GPU, and captures video using a BlakcMagic Intensity Pro PCIe card (Composite input from a Sony HD tripod Camera) and two Hauppaugee PCI Capture Cards (1 - wide angle rear-of-house camera, 1 - PTZ camera front-of-house.)

As stated above, this computer also runs the 'server' from the [miditcp](http://code.google.com/p/miditcp/) project, used by Computer 1 for command and control.

## Computer 3 ##
Computer 3 streams the services live via Ustream. It captures the output from Computer 2 via a simple Hauppaugee PCI card (S-Video.)

This computer also shares printers on the network and provides shared storage for DViz files, images, videos for use in-service, etc.

## Computer 4 ##
This computer uses the Adobe CS5 suite to capture video via a BlackMagic Intensity Pro PCIe capture card (S-Video), and handles editing and rendering of final videos for distribution and uploading to Vimeo.

This computer stores all raw capture footage and rendered videos on a 1 TB network server (not illustrated) for near-line usage. (Soon to be upgraded to 3 TB.)
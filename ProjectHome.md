# Live Production Video and Graphics Mixer #

The goal of this project is to produce a high-quality, production-ready output for use in broadcast and in-house areas. Specifically, LivePro allows multiple channels of live video to be mixed with overlays, recorded videos, full screen graphic "slides" and rendered real-time via OpenGL to multiple outputs.

## PHC Setup Illustrated ##
**2012-05-15**

Example setup of LivePro at PHC documented in a new wiki page: http://code.google.com/p/livepro/wiki/LiveProSetupAtPHC

[![](http://www.mybryanlife.com/userfiles/PHC-Systems-Layout-Small.png)](http://www.mybryanlife.com/userfiles/PHC-Systems-Layout.pdf)

## SVN [r126](https://code.google.com/p/livepro/source/detail?r=126) ##
**2012-05-14**

Windows 7 build of the 'mixerui' folder in livepro released and available for download: http://code.google.com/p/livepro/downloads/detail?name=livepro-mixerui-r126.zip

Linux (CentOS 5.3, dynamic link) build of the 'livemix' folder in livepro released and available for download:
http://code.google.com/p/livepro/downloads/detail?name=livepro-livemix-r126.tar.gz

Included in [r126](https://code.google.com/p/livepro/source/detail?r=126) is a rebuild of the Android APK for switchmon, and a crash fix for when the remote server disconnects unexpectedly in mixerui.

## SVN [r125](https://code.google.com/p/livepro/source/detail?r=125) ##
**2012-05-10**

Over the past two and a half months, most of the work has gone into (a) stabalization, (b) integration with DViz CG transmission over TCP/IP, and (c) Pan/Tilt/Zoom control, with many other minor fixes/enhancements under the hood.

### DViz CG Transmission ###

[DViz](http://code.google.com/p/dviz/) (as of [r988](https://code.google.com/p/livepro/source/detail?r=988)) can be configured to send one or more of it's Outputs over the wire as individual frames (ARGB32 - e.g. full transparency support.) Combined with automatic secondary group generation in DViz (see notes under the heading "SVN [r988](https://code.google.com/p/livepro/source/detail?r=988)" on http://code.google.com/p/dviz/), DViz can be used as a very effective graphics generator for lower thirds and full-screen frames. (DViz also has title-safe guides enabled by default in it's editor now, enabling better control over graphics designed for video.) All of this happens with little or no effort on the part of the user in DViz (other than the initial setup of the lower-third templates, etc.)

In livepro (in mixerui, to be exact) a "HTTP Image" drawable is used to pull in the feed from DViz - this image drawable can be used in either an Overlay or a Group Player - and it automatically updates every time the frame from DViz changes, so no action is required on the part of the mixerui operator to show the latest lower-third visual (say, for the next verse of the song from DViz, etc.)

### PTZ Control ###

Combined with an appropriate hardware setup (we're using an arduino with an ethernet shield connected to a Pan/Tilt head, and a third servo connected to the camera's 'zoom' switch,) the subfolder in livepro titled 'ptzcontrol' can provide useful and effective remote operation of a PTZ setup. ptzcontrol can be setup (thru a .ini file) to display the feed for the video from the camera on the pan/tilt head in the control window to allow for click-to-point actions as well.

### Error Recovery ###

A large part of the stabilization work has gone into making the network parts of the codebase very aggressive in detecting network errors and attempting to recovery from them cleanly without necessitating restarting whatever executable is affected. This work is crucial to long-term stable operation of a video mixer, but not readily visible in the UI - mainly an "under-the-hood" change.

### Other Changes ###
Many other changes were made in the code base since [r88](https://code.google.com/p/livepro/source/detail?r=88) - feel free to browse the change list at http://code.google.com/p/livepro/source/list?num=25&start=125 to explore what went into this latest batch of changes, or just jump right in with our _very_ [QuickStartGuide](http://code.google.com/p/livepro/wiki/QuickStartGuide).

As always, feel free to email any questions or problems to [josiahbryan@gmail.com](mailto:josiahbryan@gmail.com) or report them on the "Issues" tab, above.


## SVN [r89](https://code.google.com/p/livepro/source/detail?r=89) ##
**2012-02-22**

With the integration of the 'mixerui' subfolder/project (src/mixerui), LivePro is now stable enough for live production usage. In fact, this past Sunday, we ran the morning service completely from the LivePro codebase.

All S-Video and Component video inputs were used (no Composite). Component video was sourced from a Sony HXR-MC2000U HD Camcorder and captured by a Blackmagic DeckLink card, while the S-Video feed was provided by a Cannon GL-1 and a secondary output from DViz via S-Video (both captured via Hauppaugee cards.)

MixerUI has been updated from it's original codebase (e.g. gldirector in the DViz codebase) with minor additions and code fixes. Of note is the ability to stretch/shrink the aspect ratio of video feeds, and the integration of support for 'camera hints' - e.g. persistent camera settings unique to the capturing device. Also added an additional MIDI hotkey action for show/hide overlays.

This project is actively under development (see src/devel for experimental code), and actively in production use every week. Not only is it being used for live broadcasts, but also to capture classroom environments via a multi-camera setup.

The 'autodir' subproject (src/autodir) manages the switching of cameras via simple optical-flow analysis (using opencv) to analyze relative motion content of each feed and selects the feed with the most motion for the current live camera. Simple though in design, this basic algorithm has proven to be sufficient to show the most suitable camera, or best "camera of interest" in a classroom discussion setting.

## Note about Audio ##

This project makes no plans or promises to handle audio mixing (capturing audio along with the cameras and re-outputting the audio). In the current usage scenario (and current live usage practice at the primary development venue), audio is mixed via an external soundboard by a dedicated audio technician. Any recordings of the video feed or broadcast of the feed receive their audio straight from the soundboard. (In practice, the audio for the recorded video goes through a separate laptop right now that introduces a 1/10th second delay in order to compensate for some AV sync seen sometimes in recordings, but not noticed live.)

The only audio handled by this project is the audio originating from videos files. Basic volume level adjustment controls are provided, but nothing more at present.

## Target Features ##

  * Multiple camera inputs [**Done**]
  * Video playback [**Done**], with improvements/changes planned
  * Network transparency (control UI and graphics engine on separate machines) [**Done**]
  * Graphic overlays [**Done**], with improvements/changes planned
  * Graphic slides [**Done**], with improvements/changes planned
  * Multiple outputs [**Done**], with improvements/changes planned

As you can see, all major features are implemented in the originating code base - however, they need changed/improved to really be useful and/or stable.

If you want to be kept up-to-date and/or have input on the direction or features of this project, send an email to [Josiah Bryan](mailto:josiahbryan@gmail.com).
.. status: ok


15.6 HyperTex
-------------

ugWhatsNewHyperDoc

The buttons on the titlebar and scrollbar have been replaced with ones
which have a 3D effect. You can change the foreground and background
colors of these controls by including and modifying the following lines
in your .Xdefaults file.


.. spadVerbatim

::

 FriCAS.hyperdoc.ControlBackground: White
 FriCAS.hyperdoc.ControlForeground: Black



For various reasons, HyperDoc sometimes displays a secondary window. You
can control the size and placement of this window by including and
modifying the following line in your .Xdefaults file.


.. spadVerbatim

::

 FriCAS.hyperdoc.FormGeometry: =950x450+100+0



This setting is a standard X Window System geometry specification: you
are requesting a window 950 pixels wide by 450 deep and placed in the
upper left corner.

Some key definitions have been changed to conform more closely with the
CUA guidelines. Press F9 to see the current definitions.

Input boxes (for example, in the Browser) now accept paste-ins from the
X Window System. Use the second button to paste in something you have
previously copied or cut. An example of how you can use this is that you
can paste the type from an FriCAS computation into the main Browser
input box.




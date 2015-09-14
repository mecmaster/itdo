// Created by iWeb 3.0.2 local-build-20110715

function writeMovie1()
{detectBrowser();if(windowsInternetExplorer)
{document.write('<object id="id5" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab" width="324" height="198" style="height: 198px; left: 63px; position: absolute; top: 63px; width: 324px; z-index: 1; "><param name="src" value="Media/H2O%20-%20Just%20Add%20Water%20-%20Main%20Title%20%5BSaveYouTube.com%5D.mp4" /><param name="controller" value="true" /><param name="autoplay" value="false" /><param name="scale" value="tofit" /><param name="volume" value="100" /><param name="loop" value="false" /></object>');}
else if(isiPhone)
{document.write('<object id="id5" type="video/quicktime" width="324" height="198" style="height: 198px; left: 63px; position: absolute; top: 63px; width: 324px; z-index: 1; "><param name="src" value="geroi_files/H2O%20-%20Just%20Add%20Water%20-%20Main%20Title%20%5BSaveYouTube.com%5D.jpg"/><param name="target" value="myself"/><param name="href" value="../Media/H2O%20-%20Just%20Add%20Water%20-%20Main%20Title%20%5BSaveYouTube.com%5D.mp4"/><param name="controller" value="true"/><param name="scale" value="tofit"/></object>');}
else
{document.write('<object id="id5" type="video/quicktime" width="324" height="198" data="Media/H2O%20-%20Just%20Add%20Water%20-%20Main%20Title%20%5BSaveYouTube.com%5D.mp4" style="height: 198px; left: 63px; position: absolute; top: 63px; width: 324px; z-index: 1; "><param name="src" value="Media/H2O%20-%20Just%20Add%20Water%20-%20Main%20Title%20%5BSaveYouTube.com%5D.mp4"/><param name="controller" value="true"/><param name="autoplay" value="false"/><param name="scale" value="tofit"/><param name="volume" value="100"/><param name="loop" value="false"/></object>');}}
function writeMovie2()
{detectBrowser();if(windowsInternetExplorer)
{document.write('<object id="id6" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab" width="240" height="208" style="height: 208px; left: 405px; position: absolute; top: 60px; width: 240px; z-index: 1; "><param name="src" value="Media/Winx%20Believix%20-%204%20Season%20-%20Episode%206%20%5BSaveYouTube.com%5D.mp4" /><param name="controller" value="true" /><param name="autoplay" value="false" /><param name="scale" value="tofit" /><param name="volume" value="100" /><param name="loop" value="false" /></object>');}
else if(isiPhone)
{document.write('<object id="id6" type="video/quicktime" width="240" height="208" style="height: 208px; left: 405px; position: absolute; top: 60px; width: 240px; z-index: 1; "><param name="src" value="geroi_files/Winx%20Believix%20-%204%20Season%20-%20Episode%206%20%5BSaveYouTube.com%5D.jpg"/><param name="target" value="myself"/><param name="href" value="../Media/Winx%20Believix%20-%204%20Season%20-%20Episode%206%20%5BSaveYouTube.com%5D.mp4"/><param name="controller" value="true"/><param name="scale" value="tofit"/></object>');}
else
{document.write('<object id="id6" type="video/quicktime" width="240" height="208" data="Media/Winx%20Believix%20-%204%20Season%20-%20Episode%206%20%5BSaveYouTube.com%5D.mp4" style="height: 208px; left: 405px; position: absolute; top: 60px; width: 240px; z-index: 1; "><param name="src" value="Media/Winx%20Believix%20-%204%20Season%20-%20Episode%206%20%5BSaveYouTube.com%5D.mp4"/><param name="controller" value="true"/><param name="autoplay" value="false"/><param name="scale" value="tofit"/><param name="volume" value="100"/><param name="loop" value="false"/></object>');}}
setTransparentGifURL('Media/transparent.gif');function applyEffects()
{var registry=IWCreateEffectRegistry();registry.registerEffects({stroke_0:new IWStrokeParts([{rect:new IWRect(-3,3,6,33),url:'geroi_files/stroke.png'},{rect:new IWRect(-3,-3,6,6),url:'geroi_files/stroke_1.png'},{rect:new IWRect(3,-3,46,6),url:'geroi_files/stroke_2.png'},{rect:new IWRect(49,-3,7,6),url:'geroi_files/stroke_3.png'},{rect:new IWRect(49,3,7,33),url:'geroi_files/stroke_4.png'},{rect:new IWRect(49,36,7,6),url:'geroi_files/stroke_5.png'},{rect:new IWRect(3,36,46,6),url:'geroi_files/stroke_6.png'},{rect:new IWRect(-3,36,6,6),url:'geroi_files/stroke_7.png'}],new IWSize(52,39))});registry.applyEffects();}
function hostedOnDM()
{return false;}
function onPageLoad()
{loadMozillaCSS('geroi_files/geroiMoz.css')
adjustLineHeightIfTooBig('id1');adjustFontSizeIfTooBig('id1');adjustLineHeightIfTooBig('id2');adjustFontSizeIfTooBig('id2');adjustLineHeightIfTooBig('id3');adjustFontSizeIfTooBig('id3');adjustLineHeightIfTooBig('id4');adjustFontSizeIfTooBig('id4');adjustLineHeightIfTooBig('id7');adjustFontSizeIfTooBig('id7');Widget.onload();fixAllIEPNGs('Media/transparent.gif');fixupIECSS3Opacity('id8');applyEffects()}
function onPageUnload()
{Widget.onunload();}

// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.AvatarAssetDownloadManager

package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.utils.Dictionary;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.assets.AssetLoaderStruct;
    import flash.utils.Timer;
    import flash.net.URLRequest;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.utils.HabboWebTools;
    import flash.events.Event;
    import com.sulake.habbo.avatar.events.LibraryLoadedEvent;
    import com.sulake.habbo.avatar.structure._SafeStr_3125;
    import com.sulake.habbo.avatar.structure.figure.FigurePart;

    public class AvatarAssetDownloadManager extends EventDispatcherWrapper 
    {

        public static const LIBRARY_LOADED:String = "LIBRARY_LOADED";
        private static const LIB_BODY:String = "hh_human_body";
        private static const LIB_ITEMS:String = "hh_human_item";
        private static const LIB_AVATAR_EDITOR:String = "hh_avatar_editor";

        private const DOWNLOAD_TIMEOUT:int = 100;
        private const MAX_SIMULTANEOUS_DOWNLOADS:int = 4;

        private var _SafeStr_4144:_SafeStr_1702;
        private var _SafeStr_4273:Dictionary;
        private var _SafeStr_4696:Dictionary;
        private var _assets:_SafeStr_21;
        private var _SafeStr_4698:Dictionary;
        private var _listeners:Dictionary;
        private var _SafeStr_3762:AvatarStructure;
        private var _SafeStr_4694:String;
        private var _SafeStr_4692:String;
        private var _SafeStr_4697:Boolean;
        private var _SafeStr_4691:int = 3;
        private var _SafeStr_4690:AssetLoaderStruct;
        private var _downloadShiftTimer:Timer;
        private var _SafeStr_3770:Array;
        private var _SafeStr_4700:Array;
        private var _SafeStr_4699:Array;
        private var _SafeStr_4695:String;
        private var _SafeStr_4693:Array = ["hh_human_body", "hh_human_item"];

        public function AvatarAssetDownloadManager(_arg_1:_SafeStr_1702, _arg_2:_SafeStr_21, _arg_3:String, _arg_4:String, _arg_5:AvatarStructure, _arg_6:String)
        {
            var _local_10:* = null;
            var _local_8:* = null;
            super();
            _SafeStr_4144 = _arg_1;
            _SafeStr_4273 = new Dictionary();
            _SafeStr_4696 = new Dictionary();
            _assets = _arg_2;
            _SafeStr_3762 = _arg_5;
            _SafeStr_4698 = new Dictionary();
            _SafeStr_4694 = _arg_4;
            _SafeStr_4692 = _arg_3;
            _SafeStr_4695 = _arg_6;
            _listeners = new Dictionary();
            _SafeStr_3770 = [];
            _SafeStr_4700 = [];
            _SafeStr_4699 = [];
            _SafeStr_3762.renderManager.events.addEventListener("AVATAR_RENDER_READY", purgeInitDownloadBuffer);
            var _local_7:URLRequest = new URLRequest(_arg_3);
            var _local_9:IAsset = _assets.getAssetByName("figuremap");
            if (_local_9 == null)
            {
                _SafeStr_4690 = _assets.loadAssetFromFile("figuremap", _local_7, "text/xml");
                addMapLoaderEventListeners();
            }
            else
            {
                _local_10 = (_assets.getAssetByName("figuremap") as XmlAsset);
                _local_8 = (_local_10.content as XML).copy();
                loadFigureMapData(_local_8);
            };
            _downloadShiftTimer = new Timer(100, 1);
            _downloadShiftTimer.addEventListener("timerComplete", onNextDownloadTimeout);
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_4696 = null;
            _assets = null;
            _SafeStr_4698 = null;
            _listeners = null;
            if (_SafeStr_3762.renderManager)
            {
                _SafeStr_3762.renderManager.events.removeEventListener("AVATAR_RENDER_READY", purgeInitDownloadBuffer);
            };
            _SafeStr_3762 = null;
            _SafeStr_4700 = null;
            _SafeStr_3770 = null;
            if (_downloadShiftTimer)
            {
                _downloadShiftTimer.stop();
                _downloadShiftTimer = null;
            };
            if (_SafeStr_4690)
            {
                removeMapLoaderEventListeners();
                _SafeStr_4690 = null;
            };
        }

        private function addMapLoaderEventListeners():void
        {
            if (_SafeStr_4690)
            {
                _SafeStr_4690.addEventListener("AssetLoaderEventComplete", onConfigurationComplete);
                _SafeStr_4690.addEventListener("AssetLoaderEventError", onConfigurationError);
            };
        }

        private function removeMapLoaderEventListeners():void
        {
            if (_SafeStr_4690)
            {
                _SafeStr_4690.removeEventListener("AssetLoaderEventComplete", onConfigurationComplete);
                _SafeStr_4690.removeEventListener("AssetLoaderEventError", onConfigurationError);
            };
        }

        private function onConfigurationError(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (disposed)
            {
                return;
            };
            _SafeStr_4691--;
            if (_SafeStr_4691 <= 0)
            {
                HabboWebTools.logEventLog(("Figuremap download error " + _SafeStr_4692));
            }
            else
            {
                if (_SafeStr_4692.indexOf("?") > 0)
                {
                    _local_2 = ((_SafeStr_4692 + "&retry=") + _SafeStr_4691);
                }
                else
                {
                    _local_2 = ((_SafeStr_4692 + "?retry=") + _SafeStr_4691);
                };
                removeMapLoaderEventListeners();
                _local_3 = new URLRequest(_local_2);
                _SafeStr_4690 = _assets.loadAssetFromFile("figuremap", _local_3, "text/xml");
                addMapLoaderEventListeners();
            };
        }

        private function onConfigurationComplete(_arg_1:Event):void
        {
            var _local_2:* = null;
            if (disposed)
            {
                return;
            };
            var _local_3:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            if (_local_3 == null)
            {
                return;
            };
            try
            {
                _local_2 = new XML((_local_3.assetLoader.content as String));
            }
            catch(e:Error)
            {
                return;
            };
            loadFigureMapData(_local_2);
        }

        private function loadFigureMapData(_arg_1:XML):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            if (_arg_1.toString() == "")
            {
                return;
            };
            generateMap(_arg_1);
            loadMandatoryLibs();
            _SafeStr_4697 = true;
            dispatchEvent(new Event("complete"));
        }

        public function loadMandatoryLibs():void
        {
            var _local_2:* = null;
            var _local_1:Array = _SafeStr_4693.slice();
            for each (var _local_3:String in _local_1)
            {
                _local_2 = _SafeStr_4273[_local_3];
                if (_local_2)
                {
                    addToQueue(_local_2);
                }
                else
                {
                    _SafeStr_14.log(("Missing mandatory library: " + _local_3));
                };
            };
            _downloadShiftTimer.start();
        }

        private function purgeInitDownloadBuffer(_arg_1:Event):void
        {
            var _local_2:* = null;
            for each (_local_2 in _SafeStr_3770)
            {
                loadFigureSetData(_local_2[0], _local_2[1]);
            };
            _SafeStr_3770 = [];
        }

        private function generateMap(_arg_1:XML):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_6:* = null;
            for each (var _local_5:XML in _arg_1.lib)
            {
                _local_2 = new AvatarAssetDownloadLibrary(_local_5.@id, _local_5.@revision, _SafeStr_4694, _assets, _SafeStr_4695);
                _local_2.addEventListener("complete", libraryComplete);
                _SafeStr_4273[_local_2.libraryName] = _local_2;
                for each (var _local_4:XML in _local_5.part)
                {
                    _local_3 = ((_local_4.@type + ":") + _local_4.@id);
                    _local_6 = _SafeStr_4696[_local_3];
                    if (_local_6 == null)
                    {
                        _local_6 = [];
                    };
                    _local_6.push(_local_2);
                    _SafeStr_4696[_local_3] = _local_6;
                };
            };
        }

        public function isReady(_arg_1:_SafeStr_3164):Boolean
        {
            if (((!(_SafeStr_4697)) || (!(_SafeStr_3762.renderManager.isReady))))
            {
                return (false);
            };
            var _local_2:Array = getLibsToDownload(_arg_1);
            return (_local_2.length == 0);
        }

        public function loadFigureSetData(_arg_1:_SafeStr_3164, _arg_2:_SafeStr_1875):void
        {
            var _local_5:* = null;
            if (((!(_SafeStr_4697)) || (!(_SafeStr_3762.renderManager.isReady))))
            {
                _SafeStr_3770.push([_arg_1, _arg_2]);
                return;
            };
            var _local_6:String = _arg_1.getFigureString();
            var _local_4:Array = getLibsToDownload(_arg_1);
            if (_local_4.length > 0)
            {
                if (((_arg_2) && (!(_arg_2.disposed))))
                {
                    _local_5 = _listeners[_local_6];
                    if (_local_5 == null)
                    {
                        _local_5 = [];
                    };
                    _local_5.push(_arg_2);
                    _listeners[_local_6] = _local_5;
                };
                _SafeStr_4698[_local_6] = _local_4;
                for each (var _local_3:AvatarAssetDownloadLibrary in _local_4)
                {
                    addToQueue(_local_3);
                };
                _downloadShiftTimer.start();
            }
            else
            {
                if (((!(_arg_2 == null)) && (!(_arg_2.disposed))))
                {
                    _arg_2.avatarImageReady(_local_6);
                };
            };
        }

        private function libraryComplete(_arg_1:Event):void
        {
            var _local_10:* = null;
            var _local_4:* = null;
            var _local_12:Boolean;
            var _local_5:* = null;
            var _local_8:* = null;
            var _local_9:int;
            if (disposed)
            {
                return;
            };
            var _local_11:Array = [];
            for (_local_10 in _SafeStr_4698)
            {
                _local_12 = true;
                _local_4 = _SafeStr_4698[_local_10];
                for each (var _local_3:AvatarAssetDownloadLibrary in _local_4)
                {
                    if (!_local_3.isReady)
                    {
                        _local_12 = false;
                        break;
                    };
                };
                if (_local_12)
                {
                    _local_11.push(_local_10);
                    _local_5 = _listeners[_local_10];
                    for each (var _local_7:_SafeStr_1875 in _local_5)
                    {
                        if (((!(_local_7 == null)) && (!(_local_7.disposed))))
                        {
                            _local_7.avatarImageReady(_local_10);
                        };
                    };
                    delete _listeners[_local_10];
                };
            };
            for each (_local_10 in _local_11)
            {
                delete _SafeStr_4698[_local_10];
            };
            var _local_6:String = (_arg_1.target as AvatarAssetDownloadLibrary).libraryName;
            var _local_2:int = _SafeStr_4693.indexOf(_local_6);
            if (_local_2 != -1)
            {
                _SafeStr_4693.splice(_local_2, 1);
                if (_SafeStr_4693.length == 0)
                {
                    _SafeStr_4144.onMandatoryLibrariesReady();
                };
            };
            _local_9 = 0;
            while (_local_9 < _SafeStr_4699.length)
            {
                _local_8 = _SafeStr_4699[_local_9];
                if (_local_8.libraryName == _local_6)
                {
                    _SafeStr_4699.splice(_local_9, 1);
                };
                _local_9++;
            };
            if (_local_11.length > 0)
            {
                dispatchEvent(new LibraryLoadedEvent("LIBRARY_LOADED", _local_6));
            };
            _downloadShiftTimer.start();
        }

        public function isMissingMandatoryLibs():Boolean
        {
            return (_SafeStr_4693.length > 0);
        }

        private function getLibsToDownload(_arg_1:_SafeStr_3164):Array
        {
            var _local_12:* = null;
            var _local_7:int;
            var _local_5:* = null;
            var _local_11:* = null;
            var _local_4:* = null;
            var _local_8:Array = [];
            if (!_SafeStr_3762)
            {
                return (_local_8);
            };
            if (!_arg_1)
            {
                return (_local_8);
            };
            var _local_2:_SafeStr_3125 = _SafeStr_3762.figureData;
            if (!_local_2)
            {
                return (_local_8);
            };
            var _local_10:Array = _arg_1.getPartTypeIds();
            for each (var _local_6:String in _local_10)
            {
                _local_12 = _local_2.getSetType(_local_6);
                if (_local_12)
                {
                    _local_7 = _arg_1.getPartSetId(_local_6);
                    _local_5 = _local_12.getPartSet(_local_7);
                    if (_local_5)
                    {
                        for each (var _local_9:FigurePart in _local_5.parts)
                        {
                            _local_11 = ((_local_9.type + ":") + _local_9.id);
                            _local_4 = _SafeStr_4696[_local_11];
                            if (_local_4 != null)
                            {
                                for each (var _local_3:AvatarAssetDownloadLibrary in _local_4)
                                {
                                    if (_local_3 != null)
                                    {
                                        if (!_local_3.isReady)
                                        {
                                            if (_local_8.indexOf(_local_3) == -1)
                                            {
                                                _local_8.push(_local_3);
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            return (_local_8);
        }

        private function processPending():void
        {
            var _local_1:* = null;
            while (((_SafeStr_4700.length > 0) && (_SafeStr_4699.length < 4)))
            {
                _local_1 = _SafeStr_4700.shift();
                _SafeStr_4699.push(_local_1);
                _local_1.startDownloading();
            };
        }

        private function addToQueue(_arg_1:AvatarAssetDownloadLibrary):void
        {
            if ((((!(_arg_1.isReady)) && (_SafeStr_4700.indexOf(_arg_1) == -1)) && (_SafeStr_4699.indexOf(_arg_1) == -1)))
            {
                _SafeStr_4700.push(_arg_1);
            };
        }

        private function onNextDownloadTimeout(_arg_1:Event=null):void
        {
            processPending();
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1702 = "_-E0" (String#5991, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3125 = "_-u1g" (String#5880, DoABC#4)
// _SafeStr_3164 = "_-rH" (String#2534, DoABC#4)
// _SafeStr_3177 = "_-S1T" (String#2526, DoABC#4)
// _SafeStr_3762 = "_-Q11" (String#1051, DoABC#4)
// _SafeStr_3770 = "_-X1n" (String#2917, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_4273 = "_-W1p" (String#3935, DoABC#4)
// _SafeStr_4690 = "_-y1z" (String#3253, DoABC#4)
// _SafeStr_4691 = "_-F1g" (String#5361, DoABC#4)
// _SafeStr_4692 = "_-W1P" (String#5146, DoABC#4)
// _SafeStr_4693 = "_-01e" (String#6392, DoABC#4)
// _SafeStr_4694 = "_-fN" (String#9032, DoABC#4)
// _SafeStr_4695 = "_-hk" (String#9049, DoABC#4)
// _SafeStr_4696 = "_-hw" (String#9042, DoABC#4)
// _SafeStr_4697 = "_-Y1S" (String#7714, DoABC#4)
// _SafeStr_4698 = "_-kF" (String#8652, DoABC#4)
// _SafeStr_4699 = "_-BS" (String#4332, DoABC#4)
// _SafeStr_4700 = "_-3u" (String#4737, DoABC#4)



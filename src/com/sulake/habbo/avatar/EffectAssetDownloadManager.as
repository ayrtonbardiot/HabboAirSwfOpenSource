// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.EffectAssetDownloadManager

package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets._SafeStr_21;
    import flash.utils.Timer;
    import flash.net.URLRequest;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import flash.events.Event;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.avatar.events.LibraryLoadedEvent;

    public class EffectAssetDownloadManager extends EventDispatcherWrapper 
    {

        public static const LIBRARY_LOADED:String = "LIBRARY_LOADED";

        private const DOWNLOAD_TIMEOUT:int = 100;
        private const MAX_SIMULTANEOUS_DOWNLOADS:int = 2;

        private var _SafeStr_4693:Array = ["dance.1", "dance.2", "dance.3", "dance.4"];
        private var _SafeStr_5400:Dictionary;
        private var _SafeStr_4691:int = 3;
        private var _SafeStr_4690:AssetLoaderStruct;
        private var _assets:_SafeStr_21;
        private var _SafeStr_4697:Boolean;
        private var _SafeStr_4692:String;
        private var _SafeStr_4694:String;
        private var _SafeStr_4695:String;
        private var _SafeStr_3762:AvatarStructure;
        private var _listeners:Dictionary;
        private var _SafeStr_5401:Dictionary;
        private var _downloadShiftTimer:Timer;
        private var _SafeStr_3770:Array;
        private var _SafeStr_4700:Array;
        private var _SafeStr_4699:Array;

        public function EffectAssetDownloadManager(_arg_1:_SafeStr_21, _arg_2:String, _arg_3:String, _arg_4:AvatarStructure, _arg_5:String)
        {
            var _local_9:* = null;
            var _local_7:* = null;
            super();
            _SafeStr_5400 = new Dictionary();
            _assets = _arg_1;
            _SafeStr_3762 = _arg_4;
            _SafeStr_4692 = _arg_2;
            _SafeStr_4694 = _arg_3;
            _SafeStr_4695 = _arg_5;
            _listeners = new Dictionary();
            _SafeStr_5401 = new Dictionary();
            _SafeStr_3770 = [];
            _SafeStr_4700 = [];
            _SafeStr_4699 = [];
            var _local_6:URLRequest = new URLRequest(_SafeStr_4692);
            var _local_8:IAsset = _assets.getAssetByName("effectmap");
            if (_local_8 == null)
            {
                _SafeStr_4690 = _assets.loadAssetFromFile("effectmap", _local_6, "text/xml");
                addMapLoaderEventListeners();
            }
            else
            {
                _local_9 = (_assets.getAssetByName("effectmap") as XmlAsset);
                _local_7 = (_local_9.content as XML).copy();
                loadEffectMapData(_local_7);
            };
            _downloadShiftTimer = new Timer(100, 1);
            _downloadShiftTimer.addEventListener("timerComplete", onNextDownloadTimeout);
            _SafeStr_3762.renderManager.events.addEventListener("AVATAR_RENDER_READY", purgeInitDownloadBuffer);
        }

        public function loadMandatoryLibs():void
        {
            var _local_4:* = null;
            var _local_1:Array = _SafeStr_4693.slice();
            for each (var _local_3:String in _local_1)
            {
                _local_4 = _SafeStr_5400[_local_3];
                if (_local_4 != null)
                {
                    for each (var _local_2:EffectAssetDownloadLibrary in _local_4)
                    {
                        addToQueue(_local_2);
                    };
                };
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
            loadEffectMapData(_local_2);
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
                HabboWebTools.logEventLog(("Effect download error " + _SafeStr_4692));
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
                _SafeStr_4690 = _assets.loadAssetFromFile("effectmap", _local_3, "text/xml");
                addMapLoaderEventListeners();
            };
        }

        private function loadEffectMapData(_arg_1:XML):void
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

        private function generateMap(_arg_1:XML):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_5:* = null;
            for each (var _local_4:XML in _arg_1.effect)
            {
                _local_2 = new EffectAssetDownloadLibrary(_local_4.@lib, "0", _SafeStr_4694, _assets, _SafeStr_4695);
                _local_2.addEventListener("complete", libraryComplete);
                _local_3 = _local_4.@id;
                _local_5 = _SafeStr_5400[_local_3];
                if (_local_5 == null)
                {
                    _local_5 = [];
                };
                _local_5.push(_local_2);
                _SafeStr_5400[_local_3] = _local_5;
            };
        }

        private function libraryComplete(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_11:* = null;
            var _local_10:Boolean;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_8:int;
            if (disposed)
            {
                return;
            };
            var _local_4:Array = [];
            var _local_9:EffectAssetDownloadLibrary = (_arg_1.target as EffectAssetDownloadLibrary);
            _SafeStr_3762.registerAnimation(_local_9.animation);
            for (_local_2 in _SafeStr_5401)
            {
                _local_10 = true;
                _local_11 = _SafeStr_5401[_local_2];
                for each (var _local_3:EffectAssetDownloadLibrary in _local_11)
                {
                    if (!_local_3.isReady)
                    {
                        _local_10 = false;
                        break;
                    };
                };
                if (_local_10)
                {
                    _local_4.push(_local_2);
                    _local_5 = _listeners[_local_2];
                    for each (var _local_6:_SafeStr_3139 in _local_5)
                    {
                        if (((!(_local_6 == null)) && (!(_local_6.disposed))))
                        {
                            _local_6.avatarEffectReady(parseInt(_local_2));
                        };
                    };
                    delete _listeners[_local_2];
                };
            };
            for each (_local_2 in _local_4)
            {
                delete _SafeStr_5401[_local_2];
            };
            while (_local_8 < _SafeStr_4699.length)
            {
                _local_7 = _SafeStr_4699[_local_8];
                if (_local_7.name == _local_9.name)
                {
                    _SafeStr_4699.splice(_local_8, 1);
                };
                _local_8++;
            };
            if (_local_4.length > 0)
            {
                dispatchEvent(new LibraryLoadedEvent("LIBRARY_LOADED", _local_9.name));
            };
            _downloadShiftTimer.start();
        }

        public function isReady(_arg_1:int):Boolean
        {
            if (((!(_SafeStr_4697)) || (!(_SafeStr_3762.renderManager.isReady))))
            {
                return (false);
            };
            var _local_2:Array = getLibsToDownload(_arg_1);
            return (_local_2.length == 0);
        }

        public function loadEffectData(_arg_1:int, _arg_2:_SafeStr_3139):void
        {
            var _local_5:* = null;
            if (((!(_SafeStr_4697)) || (!(_SafeStr_3762.renderManager.isReady))))
            {
                _SafeStr_3770.push([_arg_1, _arg_2]);
                return;
            };
            var _local_4:Array = getLibsToDownload(_arg_1);
            if (_local_4.length > 0)
            {
                if (((_arg_2) && (!(_arg_2.disposed))))
                {
                    _local_5 = _listeners[String(_arg_1)];
                    if (_local_5 == null)
                    {
                        _local_5 = [];
                    };
                    _local_5.push(_arg_2);
                    _listeners[String(_arg_1)] = _local_5;
                };
                _SafeStr_5401[String(_arg_1)] = _local_4;
                for each (var _local_3:EffectAssetDownloadLibrary in _local_4)
                {
                    addToQueue(_local_3);
                };
            }
            else
            {
                if (((!(_arg_2 == null)) && (!(_arg_2.disposed))))
                {
                    _arg_2.avatarEffectReady(_arg_1);
                    _SafeStr_14.log(("Effect ready to use: " + _arg_1));
                };
            };
        }

        private function getLibsToDownload(_arg_1:int):Array
        {
            var _local_3:Array = [];
            if (!_SafeStr_3762)
            {
                return (_local_3);
            };
            var _local_4:Array = _SafeStr_5400[String(_arg_1)];
            if (_local_4 != null)
            {
                for each (var _local_2:EffectAssetDownloadLibrary in _local_4)
                {
                    if (_local_2 != null)
                    {
                        if (!_local_2.isReady)
                        {
                            if (_local_3.indexOf(_local_2) == -1)
                            {
                                _local_3.push(_local_2);
                            };
                        };
                    };
                };
            };
            return (_local_3);
        }

        private function processPending():void
        {
            var _local_1:* = null;
            while (((_SafeStr_4700.length > 0) && (_SafeStr_4699.length < 2)))
            {
                _local_1 = _SafeStr_4700.shift();
                _local_1.startDownloading();
                _SafeStr_4699.push(_local_1);
            };
        }

        private function addToQueue(_arg_1:EffectAssetDownloadLibrary):void
        {
            if ((((!(_arg_1.isReady)) && (_SafeStr_4700.indexOf(_arg_1) == -1)) && (_SafeStr_4699.indexOf(_arg_1) == -1)))
            {
                _SafeStr_4700.push(_arg_1);
                processPending();
            };
        }

        private function onNextDownloadTimeout(_arg_1:Event=null):void
        {
            processPending();
        }

        private function purgeInitDownloadBuffer(_arg_1:Event):void
        {
            var _local_2:* = null;
            for each (_local_2 in _SafeStr_3770)
            {
                loadEffectData(_local_2[0], _local_2[1]);
            };
            _SafeStr_3770 = [];
        }

        public function get map():Dictionary
        {
            return (_SafeStr_5400);
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3139 = "_-7b" (String#5555, DoABC#4)
// _SafeStr_3762 = "_-Q11" (String#1051, DoABC#4)
// _SafeStr_3770 = "_-X1n" (String#2917, DoABC#4)
// _SafeStr_4690 = "_-y1z" (String#3253, DoABC#4)
// _SafeStr_4691 = "_-F1g" (String#5361, DoABC#4)
// _SafeStr_4692 = "_-W1P" (String#5146, DoABC#4)
// _SafeStr_4693 = "_-01e" (String#6392, DoABC#4)
// _SafeStr_4694 = "_-fN" (String#9032, DoABC#4)
// _SafeStr_4695 = "_-hk" (String#9049, DoABC#4)
// _SafeStr_4697 = "_-Y1S" (String#7714, DoABC#4)
// _SafeStr_4699 = "_-BS" (String#4332, DoABC#4)
// _SafeStr_4700 = "_-3u" (String#4737, DoABC#4)
// _SafeStr_5400 = "_-f1t" (String#4893, DoABC#4)
// _SafeStr_5401 = "_-12Q" (String#10538, DoABC#4)



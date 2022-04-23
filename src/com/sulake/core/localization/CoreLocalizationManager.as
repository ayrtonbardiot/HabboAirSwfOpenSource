﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.localization.CoreLocalizationManager

package com.sulake.core.localization
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.runtime._SafeStr_13;
    import flash.utils.Dictionary;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import flash.utils.ByteArray;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.utils.ErrorReportStorage;

    public class CoreLocalizationManager extends _SafeStr_20 implements _SafeStr_13, _SafeStr_17 
    {

        private var _SafeStr_4020:Dictionary;
        private var _SafeStr_8034:_SafeStr_24;
        private var _activeLocalizationDefinition:String;
        private var _SafeStr_8035:Array = [];
        private var _acceptEmptyMap:_SafeStr_24;
        private var _activeEnvironmentId:String;
        private var _gameDataResources:_SafeStr_40;

        public function CoreLocalizationManager(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        private static function validateLocalizationData(_arg_1:String, _arg_2:Boolean):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            if (((_arg_1.length == 0) && (!(_arg_2))))
            {
                return (false);
            };
            if (_arg_1.indexOf("<!DOCTYPE html") != -1)
            {
                return (false);
            };
            return (true);
        }


        override protected function initComponent():void
        {
            _SafeStr_4020 = new Dictionary();
            _SafeStr_8034 = new _SafeStr_24();
            _acceptEmptyMap = new _SafeStr_24();
        }

        override public function dispose():void
        {
            _SafeStr_4020 = null;
            if (_SafeStr_8034 != null)
            {
                _SafeStr_8034.dispose();
            };
            _SafeStr_8034 = null;
            _SafeStr_8035 = null;
            super.dispose();
        }

        public function registerLocalizationDefinition(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String):void
        {
            var _local_5:LocalizationDefinition = _SafeStr_8034[_arg_1];
            if (_local_5 == null)
            {
                _local_5 = new LocalizationDefinition(_arg_4, _arg_2, _arg_3);
                _SafeStr_8034[_arg_1] = _local_5;
            };
        }

        public function activateLocalizationDefinition(_arg_1:String):Boolean
        {
            var _local_2:LocalizationDefinition = _SafeStr_8034[_arg_1];
            if (_local_2 != null)
            {
                _activeLocalizationDefinition = _arg_1;
                loadLocalizationFromURL(_local_2.url, _local_2.languageCode);
                return (true);
            };
            return (false);
        }

        public function getGameDataResources():_SafeStr_40
        {
            return (_gameDataResources);
        }

        public function getLocalizationDefinitions():_SafeStr_24
        {
            return (_SafeStr_8034);
        }

        public function getLocalizationDefinition(_arg_1:String):ILocalizationDefinition
        {
            return (_SafeStr_8034[_arg_1] as ILocalizationDefinition);
        }

        public function getActiveEnvironmentId():String
        {
            return (_activeEnvironmentId);
        }

        public function getActiveLocalizationDefinition():ILocalizationDefinition
        {
            return (getLocalizationDefinition(_activeLocalizationDefinition));
        }

        public function loadLocalizationFromURL(_arg_1:String, _arg_2:String, _arg_3:Boolean=false):void
        {
            var hashesUrl = _arg_1;
            var environmentId = _arg_2;
            var acceptEmpty = _arg_3;
            if (((!(hashesUrl)) || (hashesUrl == "")))
            {
                _SafeStr_14.log("[CoreLocalizationManager] Localization hashes URL was null or empty!");
                events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
                return;
            };
            var urlLoader:URLLoader = new URLLoader(new URLRequest(hashesUrl));
            urlLoader.addEventListener("complete", function (_arg_1:Event):void
            {
                var _local_4:* = null;
                var _local_5:* = null;
                var _local_6:* = null;
                var _local_7:* = null;
                var _local_3:* = null;
                var _local_2:String = _arg_1.currentTarget.data;
                if (((_local_2) && (_local_2.length > 0)))
                {
                    try
                    {
                        _local_4 = _SafeStr_51.parse(_local_2);
                        if (!_local_4.isValid())
                        {
                            events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
                            return;
                        };
                        _gameDataResources = _local_4;
                        _local_5 = ((("localization_" + environmentId.toLowerCase()) + "_") + _local_4.getExternalTextsHash());
                        _local_6 = assets.getAssetByName(_local_5);
                        if (((_local_6) && (environmentId == _activeEnvironmentId)))
                        {
                            events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_LOADED"));
                            return;
                        };
                        _activeEnvironmentId = environmentId;
                        _acceptEmptyMap.remove(_local_5);
                        _acceptEmptyMap.add(_local_5, acceptEmpty);
                        _local_7 = ((_local_4.getExternalTextsUrl() + "/") + _local_4.getExternalTextsHash());
                        _SafeStr_14.log(("[CoreLocalizationManager] load localization for url: " + _local_7));
                        _local_3 = assets.loadAssetFromFile(_local_5, new URLRequest(_local_7), "text/plain", ("external_texts_" + environmentId.toLowerCase()), _local_4.getExternalTextsHash());
                        _local_3.addEventListener("AssetLoaderEventComplete", onLocalizationReady);
                        _local_3.addEventListener("AssetLoaderEventError", onLocalizationFailed);
                    }
                    catch(error:Error)
                    {
                        _SafeStr_14.log("Failed parsing hashes", error.getStackTrace());
                        events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
                    };
                }
                else
                {
                    events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
                };
            });
            urlLoader.addEventListener("error", function (_arg_1:Event):void
            {
                events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
            });
            urlLoader.addEventListener("ioError", function (_arg_1:Event):void
            {
                events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
            });
        }

        private function onLocalizationReady(_arg_1:AssetLoaderEvent):void
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_7:* = null;
            var _local_2:Boolean;
            var _local_6:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            if (_local_6 != null)
            {
                _local_5 = _local_6.assetName;
                if ((_local_6.assetLoader.content is ByteArray))
                {
                    _local_4 = (_local_6.assetLoader.content as ByteArray);
                    _local_4.position = 0;
                    _local_3 = _local_4.readUTFBytes(_local_4.length);
                }
                else
                {
                    _local_3 = (_local_6.assetLoader.content as String);
                };
                _local_7 = assets.getAssetByName(_local_5);
                if (_local_7)
                {
                    assets.removeAsset(_local_7).dispose();
                };
                _local_2 = _acceptEmptyMap.getValue(_local_5);
                if (!validateLocalizationData(_local_3, _local_2))
                {
                    this.events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
                    return;
                };
                parseLocalizationData(_local_3);
                this.events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_LOADED"));
            };
        }

        protected function onLocalizationFailed(_arg_1:AssetLoaderEvent):void
        {
            var _local_4:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            var _local_2:URLRequest = new URLRequest(_local_4.assetLoader.url);
            var _local_3:AssetLoaderStruct = assets.loadAssetFromFile(_local_4.assetLoader.url, _local_2, "text/plain");
            _local_3.addEventListener("AssetLoaderEventComplete", onLocalizationReady);
            _local_3.addEventListener("AssetLoaderEventError", onLocalizationRetryFailed);
        }

        private function onLocalizationRetryFailed(_arg_1:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            ErrorReportStorage.addDebugData("Localization name", _local_2.assetName);
            ErrorReportStorage.addDebugData("Localization url", _local_2.assetLoader.url);
            ErrorReportStorage.addDebugData("Localization error", ("Code: " + _local_2.assetLoader.errorCode));
        }

        public function hasLocalization(_arg_1:String):Boolean
        {
            var _local_2:Localization = (_SafeStr_4020[_arg_1] as Localization);
            return (!(_local_2 == null));
        }

        public function getLocalization(_arg_1:String, _arg_2:String=""):String
        {
            var _local_3:Localization = (_SafeStr_4020[_arg_1] as Localization);
            if (_local_3 == null)
            {
                _SafeStr_8035.push(_arg_1);
                return (_arg_2);
            };
            return (_local_3.value);
        }

        private function getRawValue(_arg_1:String, _arg_2:String=""):String
        {
            var _local_3:Localization = (_SafeStr_4020[_arg_1] as Localization);
            if (_local_3 == null)
            {
                _SafeStr_8035.push(_arg_1);
                return (_arg_2);
            };
            return (_local_3.raw);
        }

        public function updateLocalization(_arg_1:String, _arg_2:String):void
        {
            var _local_3:Localization = _SafeStr_4020[_arg_1];
            if (_local_3 == null)
            {
                _local_3 = new Localization(this, _arg_1, _arg_2);
                _SafeStr_4020[_arg_1] = _local_3;
            }
            else
            {
                _local_3.setValue(_arg_2);
            };
        }

        private function updateAllListeners():void
        {
            for each (var _local_1:Localization in _SafeStr_4020)
            {
                _local_1.updateListeners();
            };
        }

        public function registerListener(_arg_1:String, _arg_2:ILocalizable):Boolean
        {
            var _local_3:Localization = _SafeStr_4020[_arg_1];
            if (_local_3 == null)
            {
                _SafeStr_8035.push(_arg_1);
                _local_3 = new Localization(this, _arg_1, _arg_1);
                _SafeStr_4020[_arg_1] = _local_3;
            };
            _local_3.registerListener(_arg_2);
            return (true);
        }

        public function removeListener(_arg_1:String, _arg_2:ILocalizable):Boolean
        {
            var _local_3:Localization = _SafeStr_4020[_arg_1];
            if (_local_3 != null)
            {
                _local_3.removeListener(_arg_2);
            };
            return (true);
        }

        public function registerParameter(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="%"):String
        {
            var _local_5:Localization = _SafeStr_4020[_arg_1];
            if (_local_5 == null)
            {
                _local_5 = new Localization(this, _arg_1, _arg_1);
                _SafeStr_4020[_arg_1] = _local_5;
            };
            _local_5.registerParameter(_arg_2, _arg_3, _arg_4);
            return (_local_5.value);
        }

        public function getLocalizationRaw(_arg_1:String):ILocalization
        {
            return (_SafeStr_4020[_arg_1] as ILocalization);
        }

        public function getKeys():Array
        {
            var _local_1:Array = [];
            for (var _local_2:String in _SafeStr_4020)
            {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }

        public function printNonExistingKeys():void
        {
            var _local_1:String = "";
            for each (var _local_2:String in _SafeStr_8035)
            {
                _local_1 = (_local_1 + (_local_2 + "\n"));
            };
            _SafeStr_14.log(_local_1);
        }

        private function applyLocalizationData(_arg_1:Dictionary):void
        {
            var _local_2:* = null;
            for (var _local_3:String in _arg_1)
            {
                _local_2 = _arg_1[_local_3];
                updateLocalization(_local_3, _local_2);
            };
        }

        protected function parseLocalizationData(_arg_1:String):Dictionary
        {
            var _local_6:int;
            var _local_4:* = null;
            var _local_11:* = null;
            var _local_12:* = null;
            var _local_10:* = null;
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_5:Dictionary = new Dictionary();
            var _local_2:RegExp = /\n\r{1,}|\n{1,}|\r{1,}/gm;
            var _local_9:RegExp = /^\s+|\s+$/g;
            var _local_8:Array = _arg_1.split(_local_2);
            var _local_7:RegExp = /\\n/gm;
            var _local_3:int = _local_8.length;
            _local_6 = 0;
            while (_local_6 < _local_3)
            {
                _local_4 = _local_8[_local_6];
                if (_local_4.charAt(0) != "#")
                {
                    _local_11 = _local_4.split("=");
                    if (_local_11[0].length > 0)
                    {
                        if (_local_11.length > 1)
                        {
                            _local_12 = _local_11.shift();
                            _local_10 = _local_11.join("=");
                            _local_12 = _local_12.replace(_local_9, "");
                            _local_10 = _local_10.replace(_local_9, "");
                            _local_10 = _local_10.replace(_local_7, "\n");
                            if (_local_10.length > 0)
                            {
                                updateLocalization(_local_12, _local_10);
                                _local_5[_local_12] = _local_10;
                            };
                        };
                    };
                };
                _local_6++;
            };
            updateAllListeners();
            return (_local_5);
        }


    }
}//package com.sulake.core.localization

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_17 = "_-94" (String#7182, DoABC#3)
// _SafeStr_20 = "_-W1o" (String#8724, DoABC#3)
// _SafeStr_21 = "_-61a" (String#6965, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_31 = "_-Ee" (String#7513, DoABC#3)
// _SafeStr_40 = "_-dT" (String#9239, DoABC#3)
// _SafeStr_4020 = "_-el" (String#9314, DoABC#3)
// _SafeStr_51 = "_-OI" (String#8176, DoABC#3)
// _SafeStr_8034 = "_-N10" (String#8048, DoABC#3)
// _SafeStr_8035 = "_-Q1E" (String#8289, DoABC#3)


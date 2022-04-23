// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.advertisement.AdManager

package com.sulake.habbo.advertisement
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import flash.display.BitmapData;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboCatalog;
    import __AS3__.vec.Vector;
    import _-Q1p._SafeStr_965;
    import flash.system.Security;
    import flash.net.URLRequest;
    import flash.external.ExternalInterface;
    import _-e1A._SafeStr_663;
    import _-91q._SafeStr_1390;
    import com.sulake.habbo.advertisement.events.InterstitialEvent;
    import com.sulake.core.assets.AssetLoaderStruct;
    import flash.display.Bitmap;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.habbo.advertisement.events.AdEvent;

    public class AdManager extends _SafeStr_20 implements _SafeStr_1705 
    {

        private static const INTERSTITIAL_COMPLETE_CALLBACK:String = "interstitialCompleted";

        private var _communicationManager:_SafeStr_25;
        private var _sessionDataManager:ISessionDataManager;
        private var _catalog:IHabboCatalog;
        private var _SafeStr_3807:BitmapData = null;
        private var _SafeStr_3808:BitmapData = null;
        private var _billboardImageLoaders:_SafeStr_24;
        private var _SafeStr_3806:IMessageEvent;

        public function AdManager(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communicationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboConfigurationManager(), null), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }, false), new ComponentDependency(new IIDHabboCatalog(), function (_arg_1:IHabboCatalog):void
            {
                _catalog = _arg_1;
            }, false)]));
        }

        override protected function initComponent():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            _billboardImageLoaders = new _SafeStr_24();
            _SafeStr_3806 = _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_965(onInterstitial));
            var _local_6:String = getProperty("ads.domain");
            if (_local_6 != "")
            {
                Security.loadPolicyFile((("http://" + _local_6) + "/crossdomain.xml"));
            };
            var _local_3:String = getProperty("billboard.adwarning.left.url");
            var _local_4:String = getProperty("billboard.adwarning.right.url");
            var _local_5:String = getProperty("image.library.url");
            if (((!(_local_3 == "")) && (!(_local_4 == ""))))
            {
                _local_3 = (_local_5 + _local_3);
                _local_4 = (_local_5 + _local_4);
                _local_1 = new URLRequest(_local_3);
                _local_2 = assets.loadAssetFromFile("adWarningL", _local_1, "image/png");
                _local_2.addEventListener("AssetLoaderEventComplete", adWarningLeftReady);
                _local_1 = new URLRequest(_local_4);
                _local_2 = assets.loadAssetFromFile("adWarningRight", _local_1, "image/png");
                _local_2.addEventListener("AssetLoaderEventComplete", adWarningRightReady);
            };
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback("interstitialCompleted", interstitialCompleteCallback);
            };
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_billboardImageLoaders != null)
            {
                _billboardImageLoaders.dispose();
                _billboardImageLoaders = null;
            };
            if (_communicationManager != null)
            {
                _communicationManager.removeHabboConnectionMessageEvent(_SafeStr_3806);
                _SafeStr_3806 = null;
            };
            if (_SafeStr_3807)
            {
                _SafeStr_3807.dispose();
                _SafeStr_3807 = null;
            };
            if (_SafeStr_3808)
            {
                _SafeStr_3808.dispose();
                _SafeStr_3808 = null;
            };
            super.dispose();
        }

        public function showInterstitial():void
        {
            if (!getBoolean("interstitials.2016.enabled"))
            {
                noInterstitialAvailable();
                return;
            };
            _communicationManager.connection.send(new _SafeStr_663());
        }

        private function onInterstitial(_arg_1:_SafeStr_965):void
        {
            var _local_2:_SafeStr_1390 = _arg_1.getParser();
            if (((_local_2) && (_local_2.canShowInterstitial)))
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.showInterstitial");
                    events.dispatchEvent(new InterstitialEvent("AE_INTERSTITIAL_SHOW"));
                }
                else
                {
                    noInterstitialAvailable();
                };
            }
            else
            {
                noInterstitialAvailable();
            };
        }

        private function noInterstitialAvailable():void
        {
            if (events != null)
            {
                events.dispatchEvent(new InterstitialEvent("AE_INTERSTITIAL_NOT_SHOWN"));
            };
        }

        public function interstitialCompleteCallback(_arg_1:String):void
        {
            events.dispatchEvent(new InterstitialEvent("AE_INTERSTITIAL_COMPLETE", _arg_1));
        }

        private function adWarningLeftReady(_arg_1:AssetLoaderEvent):void
        {
            var _local_3:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            var _local_2:Bitmap = (_local_3.assetLoader.content as Bitmap);
            if (_local_2 != null)
            {
                _SafeStr_3807 = emulateBackgroundTransparency(_local_2.bitmapData);
            };
        }

        private function adWarningRightReady(_arg_1:AssetLoaderEvent):void
        {
            var _local_3:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            var _local_2:Bitmap = (_local_3.assetLoader.content as Bitmap);
            if (_local_2 != null)
            {
                _SafeStr_3808 = emulateBackgroundTransparency(_local_2.bitmapData);
            };
        }

        private function emulateBackgroundTransparency(_arg_1:BitmapData):BitmapData
        {
            var _local_4:int;
            var _local_5:int;
            var _local_3:uint;
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_2:BitmapData = new BitmapData(_arg_1.width, _arg_1.height, true, 0);
            _local_4 = 0;
            while (_local_4 < _local_2.height)
            {
                _local_5 = 0;
                while (_local_5 < _local_2.width)
                {
                    _local_3 = _arg_1.getPixel32(_local_5, _local_4);
                    if (_local_3 != 0xFFFFFFFF)
                    {
                        _local_2.setPixel32(_local_5, _local_4, _local_3);
                    };
                    _local_5++;
                };
                _local_4++;
            };
            return (_local_2);
        }

        private function isValidAdImage(_arg_1:Bitmap):Boolean
        {
            if ((((!(_arg_1 == null)) && (!(_arg_1.bitmapData == null))) && ((_arg_1.width > 1) || (_arg_1.height > 1))))
            {
                return (true);
            };
            return (false);
        }

        public function loadRoomAdImage(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String):void
        {
            var _local_10:* = null;
            var _local_11:* = null;
            if (((_arg_4 == null) || (_arg_4.length == 0)))
            {
                return;
            };
            if (assets.hasAsset(_arg_4))
            {
                _local_10 = assets.getAssetByName(_arg_4);
                if (_local_10 != null)
                {
                    _local_11 = (_local_10.content as BitmapData);
                    if (_local_11 != null)
                    {
                        dispatchImageAsset(_local_11.clone(), _arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
                    };
                };
                return;
            };
            var _local_9:Array = _billboardImageLoaders.getValue(_arg_4);
            if (_local_9 == null)
            {
                _local_9 = [];
                _billboardImageLoaders.add(_arg_4, _local_9);
            };
            if (_local_9.length > 0)
            {
                for each (var _local_7:AdImageRequest in _local_9)
                {
                    if ((((_local_7.roomId == _arg_1) && (_local_7.objectId == _arg_2)) && (_local_7.objectCategory == _arg_3)))
                    {
                        return;
                    };
                };
            };
            _local_9.push(new AdImageRequest(_arg_1, _arg_4, _arg_5, _arg_2, _arg_3));
            var _local_6:URLRequest = new URLRequest(_arg_4);
            var _local_8:AssetLoaderStruct = assets.loadAssetFromFile(_arg_4, _local_6, "image/png");
            _local_8.addEventListener("AssetLoaderEventComplete", onBillboardImageReady);
            _local_8.addEventListener("AssetLoaderEventError", onBillboardImageLoadError);
        }

        private function onBillboardImageReady(_arg_1:AssetLoaderEvent):void
        {
            var _local_4:* = null;
            var _local_5:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            var _local_2:Bitmap = (_local_5.assetLoader.content as Bitmap);
            var _local_6:Array = _billboardImageLoaders.remove(_local_5.assetName);
            if (((_local_6 == null) || (_local_6.length == 0)))
            {
                return;
            };
            if (isValidAdImage(_local_2))
            {
                _local_4 = _local_2.bitmapData;
                if (_local_4 != null)
                {
                    for each (var _local_3:AdImageRequest in _local_6)
                    {
                        dispatchImageAsset(_local_4.clone(), _local_3.roomId, _local_3.objectId, _local_3.objectCategory, _local_3.imageURL, _local_3.clickURL);
                    };
                };
            };
        }

        private function dispatchImageAsset(_arg_1:BitmapData, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:String):void
        {
            if (events != null)
            {
                events.dispatchEvent(new AdEvent("AE_ROOM_AD_IMAGE_LOADED", _arg_2, _arg_1, _arg_5, _arg_6, null, null, _arg_3, _arg_4));
            };
        }

        private function onBillboardImageLoadError(_arg_1:AssetLoaderEvent):void
        {
            var _local_3:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            var _local_4:Array = _billboardImageLoaders.remove(_local_3.assetName);
            if (((_local_4 == null) || (_local_4.length == 0)))
            {
                return;
            };
            for each (var _local_2:AdImageRequest in _local_4)
            {
                dispatchImageAsset(null, _local_2.roomId, _local_2.objectId, _local_2.objectCategory, _local_2.imageURL, _local_2.clickURL);
            };
        }


    }
}//package com.sulake.habbo.advertisement

// _SafeStr_1390 = "_-5T" (String#38616, DoABC#4)
// _SafeStr_1705 = "_-VD" (String#7365, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3806 = "_-81m" (String#12066, DoABC#4)
// _SafeStr_3807 = "_-R17" (String#10493, DoABC#4)
// _SafeStr_3808 = "_-l1T" (String#10709, DoABC#4)
// _SafeStr_663 = "_-91M" (String#30609, DoABC#4)
// _SafeStr_965 = "_-6V" (String#24797, DoABC#4)



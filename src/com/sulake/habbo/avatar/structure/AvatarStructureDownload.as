// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.structure.AvatarStructureDownload

package com.sulake.habbo.avatar.structure
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core._SafeStr_79;
    import flash.events.Event;
    import com.sulake.habbo.utils.HabboWebTools;

    public class AvatarStructureDownload extends EventDispatcherWrapper 
    {

        public static const STRUCTURE_DONE:String = "AVATAR_STRUCTURE_DONE";

        private var _SafeStr_4232:IStructureData;

        public function AvatarStructureDownload(_arg_1:_SafeStr_21, _arg_2:String, _arg_3:IStructureData)
        {
            _SafeStr_4232 = _arg_3;
            if (_arg_1.hasAsset(_arg_2))
            {
                _SafeStr_14.log(("[AvatarStructureDownload] reload data for url: " + _arg_2));
            };
            var _local_4:URLRequest = new URLRequest(_arg_2);
            var _local_5:AssetLoaderStruct = _arg_1.loadAssetFromFile(_arg_2, _local_4, "text/plain");
            _local_5.addEventListener("AssetLoaderEventComplete", onDataComplete);
            _local_5.addEventListener("AssetLoaderEventError", onDataFailed);
        }

        private function onDataComplete(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            if (((_local_3 == null) || (_local_3.assetLoader == null)))
            {
                return;
            };
            try
            {
                _local_2 = (_local_3.assetLoader.content as String);
                if (((_local_2 == null) || (_local_2.length == 0)))
                {
                    _SafeStr_79.error((((("Could not load avatar structure, got empty data from URL " + _local_3.assetLoader.url) + " data length = ") + _local_2.length) + "."), false, 1);
                };
                _local_4 = new XML(_local_2);
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("[AvatarStructureDownload] Error: " + e.message));
                return;
            };
            if (_local_4 == null)
            {
                _SafeStr_14.log((("[AvatarStructureDownload] XML error: " + _local_3) + " not valid XML"));
                return;
            };
            _SafeStr_4232.appendXML(_local_4);
            dispatchEvent(new Event("AVATAR_STRUCTURE_DONE"));
        }

        private function onDataFailed(_arg_1:Event):void
        {
            var _local_2:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            var _local_3:String = "";
            if (((!(_local_2 == null)) && (!(_local_2.assetLoader == null))))
            {
                _local_3 = _local_2.assetLoader.url;
            };
            HabboWebTools.logEventLog(("figurepartlist download error " + _local_3));
            _SafeStr_79.error(("Could not load avatar structure. Failed to get data from URL " + _local_3), true, 1);
        }


    }
}//package com.sulake.habbo.avatar.structure

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_4232 = "_-pO" (String#17903, DoABC#4)
// _SafeStr_79 = "_-411" (String#2835, DoABC#4)



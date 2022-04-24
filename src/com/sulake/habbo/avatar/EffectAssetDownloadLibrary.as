// by nota

//com.sulake.habbo.avatar.EffectAssetDownloadLibrary

package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import _-x1P._SafeStr_1635;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.assets.AssetLibraryCollection;
    import flash.net.URLRequest;
    import com.sulake.core.utils._SafeStr_39;
    import com.sulake.core._SafeStr_79;
    import com.sulake.core.utils._SafeStr_43;
    import flash.utils.ByteArray;
    import flash.events.Event;

    public class EffectAssetDownloadLibrary extends EventDispatcherWrapper implements _SafeStr_1635 
    {

        private static var STATE_IDLE:int = 0;
        private static var STATE_DOWNLOADING:int = 1;
        private static var STATE_READY:int = 2;

        private var _SafeStr_3734:int;
        private var _name:String;
        private var _revision:String;
        private var _downloadUrl:String;
        private var _assets:IAssetLibrary;
        private var _animation:XML;

        public function EffectAssetDownloadLibrary(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:IAssetLibrary, _arg_5:String)
        {
            _SafeStr_3734 = STATE_IDLE;
            _assets = _arg_4;
            _name = _arg_1;
            _revision = _arg_2;
            _downloadUrl = (_arg_3 + _arg_5);
            _downloadUrl = _downloadUrl.replace("%libname%", _name);
            _downloadUrl = _downloadUrl.replace("%revision%", _revision);
            var _local_6:AssetLibraryCollection = (_assets as AssetLibraryCollection);
            var _local_7:IAssetLibrary = _local_6.getAssetLibraryByUrl((_name + ".swf"));
            if (_local_7 != null)
            {
                _SafeStr_3734 = STATE_READY;
            };
        }

        override public function dispose():void
        {
            super.dispose();
        }

        public function startDownloading():void
        {
            _SafeStr_3734 = STATE_DOWNLOADING;
            var _local_1:URLRequest = new URLRequest(_downloadUrl);
            var _local_2:_SafeStr_39 = new _SafeStr_39();
            _assets.loadFromFile(_local_2, true);
            _local_2.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE", onLoaderComplete);
            _local_2.addEventListener("LIBRARY_LOADER_EVENT_ERROR", onLoaderError);
            _local_2.load(_local_1);
        }

        private function onLoaderError(_arg_1:_SafeStr_43):void
        {
            _SafeStr_79.error(((((((((("Could not load effect asset library " + _name) + " from URL ") + _downloadUrl) + " HTTP status ") + _arg_1.status) + " bytes loaded ") + _arg_1.bytesLoaded) + "/") + _arg_1.bytesTotal), false, 2);
        }

        private function onLoaderComplete(_arg_1:Event):void
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_2:_SafeStr_39 = (_arg_1.target as _SafeStr_39);
            _local_2.removeEventListener("LIBRARY_LOADER_EVENT_COMPLETE", onLoaderComplete);
            _local_2.removeEventListener("LIBRARY_LOADER_EVENT_ERROR", onLoaderError);
            var _local_4:Object = (_local_2.resource as Object).animation;
            if ((_local_4 is XML))
            {
                _animation = (_local_4 as XML);
            }
            else
            {
                if ((_local_4 is Class))
                {
                    _local_5 = (new ((_local_4 as Class))() as ByteArray);
                    _animation = new XML(_local_5.readUTFBytes(_local_5.length));
                }
                else
                {
                    if ((_local_4 is ByteArray))
                    {
                        _local_3 = (_local_4 as ByteArray);
                        _animation = new XML(_local_3.readUTFBytes(_local_3.length));
                    };
                };
            };
            _SafeStr_3734 = STATE_READY;
            dispatchEvent(new Event("complete"));
        }

        public function get name():String
        {
            return (_name);
        }

        public function get isReady():Boolean
        {
            return (_SafeStr_3734 == STATE_READY);
        }

        public function toString():String
        {
            var _local_1:String = _name;
            return (_local_1 + ((isReady) ? "[x]" : "[ ]"));
        }

        public function get animation():XML
        {
            return (_animation);
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_1635 = "_-h" (String#40054, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_39 = "_-N4" (String#4523, DoABC#4)
// _SafeStr_43 = "_-gV" (String#29916, DoABC#4)
// _SafeStr_79 = "_-411" (String#2835, DoABC#4)



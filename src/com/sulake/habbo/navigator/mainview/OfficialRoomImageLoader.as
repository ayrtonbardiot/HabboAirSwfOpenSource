// by nota

//com.sulake.habbo.navigator.mainview.OfficialRoomImageLoader

package com.sulake.habbo.navigator.mainview
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.navigator._SafeStr_1697;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class OfficialRoomImageLoader implements _SafeStr_13 
    {

        private var _navigator:_SafeStr_1697;
        private var _SafeStr_5480:String;
        private var _SafeStr_5275:String;
        private var _SafeStr_5481:_SafeStr_3264;
        private var _disposed:Boolean;

        public function OfficialRoomImageLoader(_arg_1:_SafeStr_1697, _arg_2:String, _arg_3:_SafeStr_3264)
        {
            _navigator = _arg_1;
            _SafeStr_5480 = _arg_2;
            _SafeStr_5481 = _arg_3;
            var _local_4:String = _navigator.getProperty("image.library.url");
            _SafeStr_5275 = (_local_4 + _SafeStr_5480);
            _SafeStr_14.log(("[OFFICIAL ROOM ICON IMAGE DOWNLOADER] : " + _SafeStr_5275));
        }

        public function startLoad():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            if (_navigator.assets.hasAsset(_SafeStr_5480))
            {
                setImage();
            }
            else
            {
                _local_1 = new URLRequest(_SafeStr_5275);
                _local_2 = _navigator.assets.loadAssetFromFile(_SafeStr_5480, _local_1, "image/gif");
                _local_2.addEventListener("AssetLoaderEventComplete", onImageReady);
                _local_2.addEventListener("AssetLoaderEventError", onLoadError);
            };
        }

        private function onImageReady(_arg_1:AssetLoaderEvent):void
        {
            if (_disposed)
            {
                return;
            };
            var _local_2:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            if (_local_2 == null)
            {
                _SafeStr_14.log((("Loading pic from url: " + _SafeStr_5275) + " failed. loaderStruct == null"));
                return;
            };
            setImage();
        }

        private function setImage():void
        {
            var _local_1:* = null;
            if (((((_navigator) && (!(_navigator.disposed))) && (_SafeStr_5481)) && (!(_SafeStr_5481.disposed))))
            {
                _local_1 = _navigator.getButtonImage(_SafeStr_5480, "");
                if (_local_1)
                {
                    _SafeStr_5481.disposesBitmap = false;
                    _SafeStr_5481.bitmap = _local_1;
                    _SafeStr_5481.width = _local_1.width;
                    _SafeStr_5481.height = _local_1.height;
                    _SafeStr_5481.visible = true;
                }
                else
                {
                    _SafeStr_14.log(("OfficialRoomImageLoader - Image not found: " + _SafeStr_5480));
                };
            };
            dispose();
        }

        private function onLoadError(_arg_1:AssetLoaderEvent):void
        {
            _SafeStr_14.log(((("Error loading image: " + _SafeStr_5275) + ", ") + _arg_1));
            dispose();
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            _SafeStr_5481 = null;
            _navigator = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }


    }
}//package com.sulake.habbo.navigator.mainview

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_5275 = "_-J1N" (String#2314, DoABC#4)
// _SafeStr_5480 = "_-22c" (String#9238, DoABC#4)
// _SafeStr_5481 = "_-MP" (String#6540, DoABC#4)



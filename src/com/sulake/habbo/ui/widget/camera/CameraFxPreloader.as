// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.camera.CameraFxPreloader

package com.sulake.habbo.ui.widget.camera
{
    import flash.utils.Dictionary;
    import flash.display.Loader;
    import flash.display.BitmapData;
    import flash.net.URLRequest;
    import flash.display.Bitmap;
    import flash.events.Event;

    public class CameraFxPreloader 
    {

        private static var ASSETS:Dictionary;
        private static var instance:CameraFxPreloader;
        private static var _urls:Array;
        private static var _SafeStr_4591:String;

        private var _SafeStr_6780:Loader;
        private var _SafeStr_8963:Boolean = false;

        public function CameraFxPreloader()
        {
            _SafeStr_6780 = new Loader();
            _SafeStr_6780.contentLoaderInfo.addEventListener("complete", assetLoaded);
            _SafeStr_6780.contentLoaderInfo.addEventListener("ioError", loadFailed);
            loadNextImage();
        }

        public static function init(_arg_1:String, _arg_2:Array):void
        {
            if (!instance)
            {
                ASSETS = new Dictionary();
                _SafeStr_4591 = _arg_1;
                _urls = _arg_2;
                instance = new (CameraFxPreloader)();
            };
        }

        public static function preloadFinished():Boolean
        {
            return ((instance != null) ? instance._SafeStr_8963 : false);
        }

        public static function getImage(_arg_1:String):BitmapData
        {
            return ((ASSETS != null) ? ASSETS[_arg_1] : null);
        }


        private function loadNextImage():void
        {
            var _local_1:* = null;
            if (_urls.length > 0)
            {
                _local_1 = (((_SafeStr_4591 + "Habbo-Stories/") + _urls[0]) + ".png");
                _SafeStr_6780.load(new URLRequest(_local_1));
            }
            else
            {
                _SafeStr_8963 = true;
            };
        }

        private function assetLoaded(_arg_1:Event):void
        {
            ASSETS[_urls.shift()] = Bitmap(_SafeStr_6780.content).bitmapData.clone();
            loadNextImage();
        }

        private function loadFailed(_arg_1:Event):void
        {
            _SafeStr_14.log(("Camera Fx preloading failed for " + _SafeStr_6780.contentLoaderInfo.loaderURL));
            _urls.shift();
            loadNextImage();
        }


    }
}//package com.sulake.habbo.ui.widget.camera

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_4591 = "_-t1s" (String#4581, DoABC#4)
// _SafeStr_6780 = "_-Y1l" (String#9251, DoABC#4)
// _SafeStr_8963 = "_-rn" (String#18016, DoABC#4)



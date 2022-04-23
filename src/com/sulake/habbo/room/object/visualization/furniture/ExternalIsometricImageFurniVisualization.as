// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.furniture.ExternalIsometricImageFurniVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.events.ErrorEvent;
    import flash.display.Loader;
    import flash.system.LoaderContext;
    import flash.net.URLRequest;
    import com.sulake.core.runtime.exceptions.Exception;
    import flash.display.LoaderInfo;
    import flash.display.Bitmap;
    import flash.events.Event;

    public class ExternalIsometricImageFurniVisualization extends IsometricImageFurniVisualization 
    {

        private var _SafeStr_5220:String = null;


        private static function onThumbnailError(_arg_1:ErrorEvent):void
        {
            _SafeStr_14.log(("External Image thumbnail download error: " + _arg_1.toString()));
        }


        override protected function updateModel(_arg_1:Number):Boolean
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:* = null;
            if (object != null)
            {
                _local_4 = getThumbnailURL();
                if (_SafeStr_5220 != _local_4)
                {
                    _SafeStr_5220 = _local_4;
                    if (((!(_SafeStr_5220 == null)) && (!(_SafeStr_5220 == ""))))
                    {
                        _local_2 = new Loader();
                        _local_2.name = _local_4;
                        _local_2.contentLoaderInfo.addEventListener("complete", onThumbnailLoaded);
                        _local_2.contentLoaderInfo.addEventListener("ioError", onThumbnailError);
                        _local_2.contentLoaderInfo.addEventListener("securityError", onThumbnailError);
                        _local_3 = new LoaderContext(true);
                        _local_3.checkPolicyFile = true;
                        _local_2.load(new URLRequest(_local_4), _local_3);
                    }
                    else
                    {
                        setThumbnailImages(null);
                    };
                };
            };
            return (super.updateModel(_arg_1));
        }

        protected function getThumbnailURL():String
        {
            throw (new Exception("This method must be overridden!"));
        }

        private function onThumbnailLoaded(_arg_1:Event):void
        {
            var _local_3:LoaderInfo = (_arg_1.target as LoaderInfo);
            var _local_2:Bitmap = (_local_3.content as Bitmap);
            if (_local_2 != null)
            {
                setThumbnailImages(_local_2.bitmapData);
            }
            else
            {
                setThumbnailImages(null);
            };
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_5220 = "_-kZ" (String#13185, DoABC#4)



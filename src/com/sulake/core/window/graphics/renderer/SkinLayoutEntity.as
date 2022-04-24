// by nota

//com.sulake.core.window.graphics.renderer.SkinLayoutEntity

package com.sulake.core.window.graphics.renderer
{
    import com.sulake.core.window.utils._SafeStr_3239;
    import flash.geom.Rectangle;

    public class SkinLayoutEntity implements _SafeStr_3239 
    {

        public static const SCALE_TYPE_FIXED:uint = 0;
        public static const SCALE_TYPE_MOVE:uint = 1;
        public static const SCALE_TYPE_STRECH:uint = 2;
        public static const SCALE_TYPE_TILED:uint = 4;
        public static const SCALE_TYPE_CENTER:uint = 8;

        private var _SafeStr_3820:uint;
        private var _name:String;
        public var color:uint;
        public var blend:uint;
        public var scaleH:uint;
        public var scaleV:uint;
        public var region:Rectangle;
        public var colorize:Boolean;

        public function SkinLayoutEntity(_arg_1:uint, _arg_2:String)
        {
            _SafeStr_3820 = _arg_1;
            _name = _arg_2;
        }

        public function get id():uint
        {
            return (_SafeStr_3820);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get tags():Array
        {
            return (null);
        }

        public function dispose():void
        {
            region = null;
        }


    }
}//package com.sulake.core.window.graphics.renderer

// _SafeStr_3239 = "_-Uz" (String#1888, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)



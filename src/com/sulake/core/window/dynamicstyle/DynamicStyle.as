// by nota

//com.sulake.core.window.dynamicstyle.DynamicStyle

package com.sulake.core.window.dynamicstyle
{
    import flash.utils.Dictionary;
    import com.sulake.core.window.WindowController;
    import flash.geom.ColorTransform;

    public class DynamicStyle 
    {

        public static const STYLE_LIFTED_HOVER:String = "lifted_hover";
        public static const BRIGHTNESS_AND_SHADOW_UNDER:String = "brightness_and_shadow_under";

        public var name:String;
        public var _SafeStr_6201:Object = {};
        public var defaultStyles:Object = {};
        public var pressedSyles:Object = {};
        public var _SafeStr_6203:Object = {"colorTransform":[1, 1, 1, 0.4, 0, 0, 0, 0]};
        public var _SafeStr_6202:Dictionary = new Dictionary();

        public function DynamicStyle(_arg_1:String="")
        {
            this.name = _arg_1;
        }

        public function getStyleByWindowState(_arg_1:uint):Object
        {
            switch (_arg_1)
            {
                case 16:
                    return (pressedSyles);
                case 4:
                    return (_SafeStr_6201);
                case 0:
                    return (defaultStyles);
                case 32:
                    return (_SafeStr_6203);
            };
            return ({});
        }

        private function getChildDynamicStyleByKey(_arg_1:String):DynamicStyle
        {
            if (_SafeStr_6202[_arg_1])
            {
                return (_SafeStr_6202[_arg_1]);
            };
            return (new DynamicStyle());
        }

        public function getChildStyle(_arg_1:WindowController):DynamicStyle
        {
            for each (var _local_2:String in _arg_1.tags)
            {
                if (_local_2.charAt(0) == "#")
                {
                    return (getChildDynamicStyleByKey(_local_2));
                };
            };
            return (null);
        }

        public function getColorValue(_arg_1:uint):uint
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:int;
            var _local_5:int;
            if (getStyleByWindowState(_arg_1).colorTransform)
            {
                _local_2 = getStyleByWindowState(_arg_1).colorTransform;
                _local_3 = "";
                _local_4 = 0;
                while (_local_4 < 3)
                {
                    _local_5 = ((_local_2[_local_4] * 0xFF) + _local_2[(_local_4 + 4)]);
                    _local_3 = (_local_3 + Math.min(0xFF, _local_5).toString(16));
                    _local_4++;
                };
                return (parseInt(_local_3, 16));
            };
            return (null);
        }

        public function getColorTransform(_arg_1:uint):ColorTransform
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (getStyleByWindowState(_arg_1).colorTransform)
            {
                _local_2 = getStyleByWindowState(_arg_1).colorTransform;
                _local_3 = getStyleByWindowState(_arg_1).tint;
                if (!_local_3)
                {
                    _local_3 = [0xFF, 0xFF, 0xFF];
                };
                return (new ColorTransform(((_local_2[0] * _local_3[0]) / 0xFF), ((_local_2[1] * _local_3[1]) / 0xFF), ((_local_2[2] * _local_3[2]) / 0xFF), _local_2[3], _local_2[4], _local_2[5], _local_2[6], _local_2[7]));
            };
            return (new ColorTransform());
        }


    }
}//package com.sulake.core.window.dynamicstyle

// _SafeStr_6201 = "_-kz" (String#8984, DoABC#4)
// _SafeStr_6202 = "_-H1K" (String#9047, DoABC#4)
// _SafeStr_6203 = "_-VZ" (String#14105, DoABC#4)



// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.camera.CameraEffect

package com.sulake.habbo.ui.widget.camera
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.utils.StringUtil;
    import flash.filters.ColorMatrixFilter;
    import flash.filters.BitmapFilter;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window._SafeStr_3109;

    public class CameraEffect 
    {

        private static const DEFAULT_EFFECT_STRENGTH:Number = 0.5;
        public static const TYPE_COLORMATRIX:String = "colormatrix";
        public static const _SafeStr_8962:String = "composite";
        public static const TYPE_FRAME:String = "frame";

        private static var _SafeStr_5396:_SafeStr_24;
        private static var _SafeStr_6674:Array = [];
        private static var _SafeStr_6404:int = 1;
        private static var _SafeStr_4020:_SafeStr_18;

        public var type:String;
        public var matrixArray:Array;
        public var _SafeStr_5600:String;
        public var name:String;
        public var description:String;
        public var value:int;
        public var isOn:Boolean = false;
        public var _SafeStr_5598:int = 0;
        public var button:_SafeStr_3133;

        public function CameraEffect(_arg_1:String, _arg_2:String, _arg_3:Array, _arg_4:String, _arg_5:int)
        {
            this.name = _arg_1;
            this.description = _SafeStr_4020.getLocalization(("camera.effect.name." + _arg_1), _arg_1);
            this.type = _arg_2;
            this._SafeStr_5600 = _arg_4;
            this.matrixArray = _arg_3;
            this._SafeStr_5598 = _arg_5;
        }

        public static function resetAllEffects():void
        {
            for each (var _local_1:CameraEffect in _SafeStr_5396)
            {
                _local_1.value = (0.5 * _SafeStr_6404);
                _local_1.setChosen(false);
            };
        }

        public static function setMaxValue(_arg_1:int):void
        {
            _SafeStr_6404 = _arg_1;
        }

        public static function getEffects(_arg_1:String, _arg_2:_SafeStr_18):_SafeStr_24
        {
            var _local_3:* = null;
            if (!_SafeStr_5396)
            {
                if (_arg_1 != null)
                {
                    _local_3 = _arg_1.split(",");
                    for each (var _local_4:String in _local_3)
                    {
                        _SafeStr_6674.push(StringUtil.trim(_local_4));
                    };
                };
                _SafeStr_4020 = _arg_2;
                initEffects();
            };
            return (_SafeStr_5396);
        }

        private static function initEffects():void
        {
            _SafeStr_5396 = new _SafeStr_24();
            addEffect("dark_sepia", "colormatrix", [0.4, 0.4, 0.1, 0, 110, 0.3, 0.4, 0.1, 0, 30, 0.3, 0.2, 0.1, 0, 0, 0, 0, 0, 1, 0], null);
            addEffect("increase_saturation", "colormatrix", [2, -0.5, -0.5, 0, 0, -0.5, 2, -0.5, 0, 0, -0.5, -0.5, 2, 0, 0, 0, 0, 0, 1, 0], null);
            addEffect("increase_contrast", "colormatrix", [1.5, 0, 0, 0, -50, 0, 1.5, 0, 0, -50, 0, 0, 1.5, 0, -50, 0, 0, 0, 1.5, 0], null);
            addEffect("shadow_multiply_02", "composite", null, "multiply");
            addEffect("color_1", "colormatrix", [0.393, 0.769, 0.189, 0, 0, 0.349, 0.686, 0.168, 0, 0, 0.272, 0.534, 0.131, 0, 0, 0, 0, 0, 1, 0], null, 1);
            addEffect("hue_bright_sat", "colormatrix", [1, 0.6, 0.2, 0, -50, 0.2, 1, 0.6, 0, -50, 0.6, 0.2, 1, 0, -50, 0, 0, 0, 1, 0], null, 1);
            addEffect("hearts_hardlight_02", "composite", null, "hardlight", 1);
            addEffect("texture_overlay", "composite", null, "overlay", 1);
            addEffect("pinky_nrm", "composite", null, "normal", 1);
            addEffect("color_2", "colormatrix", [0.333, 0.333, 0.333, 0, 0, 0.333, 0.333, 0.333, 0, 0, 0.333, 0.333, 0.333, 0, 0, 0, 0, 0, 1, 0], null, 2);
            addEffect("night_vision", "colormatrix", [0, 0, 0, 0, 0, 0, 1.1, 0, 0, -50, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0], null, 2);
            addEffect("stars_hardlight_02", "composite", null, "hardlight", 2);
            addEffect("coffee_mpl", "composite", null, "multiply", 2);
            addEffect("security_hardlight", "composite", null, "hardlight", 3);
            addEffect("bluemood_mpl", "composite", null, "multiply", 3);
            addEffect("rusty_mpl", "composite", null, "multiply", 3);
            addEffect("decr_conrast", "colormatrix", [0.5, 0, 0, 0, 50, 0, 0.5, 0, 0, 50, 0, 0, 0.5, 0, 50, 0, 0, 0, 1, 0], null, 4);
            addEffect("green_2", "colormatrix", [0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, 90, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0], null, 4);
            addEffect("alien_hrd", "composite", null, "hardlight", 4);
            addEffect("color_3", "colormatrix", [0.609, 0.609, 0.082, 0, 0, 0.309, 0.609, 0.082, 0, 0, 0.309, 0.609, 0.082, 0, 0, 0, 0, 0, 1, 0], null, 5);
            addEffect("color_4", "colormatrix", [0.8, -0.8, 1, 0, 70, 0.8, -0.8, 1, 0, 70, 0.8, -0.8, 1, 0, 70, 0, 0, 0, 1, 0], null, 5);
            addEffect("toxic_hrd", "composite", null, "hardlight", 5);
            addEffect("hypersaturated", "colormatrix", [2, -1, 0, 0, 0, -1, 2, 0, 0, 0, 0, -1, 2, 0, 0, 0, 0, 0, 1, 0], null, 6);
            addEffect("Yellow", "colormatrix", [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0], null, 6);
            addEffect("misty_hrd", "composite", null, "hardlight", 6);
            addEffect("x_ray", "colormatrix", [0, 1.2, 0, 0, -100, 0, 2, 0, 0, -120, 0, 2, 0, 0, -120, 0, 0, 0, 1, 0], null, 7);
            addEffect("decrease_saturation", "colormatrix", [0.7, 0.2, 0.2, 0, 0, 0.2, 0.7, 0.2, 0, 0, 0.2, 0.2, 0.7, 0, 0, 0, 0, 0, 1, 0], null, 7);
            addEffect("drops_mpl", "composite", null, "multiply", 8);
            addEffect("shiny_hrd", "composite", null, "hardlight", 9);
            addEffect("glitter_hrd", "composite", null, "hardlight", 10);
            addEffect("frame_gold", "frame", null, null, 999);
            addEffect("frame_gray_4", "frame", null, null, 999);
            addEffect("frame_black_2", "frame", null, null, 999);
            addEffect("frame_wood_2", "frame", null, null, 999);
            addEffect("finger_nrm", "frame", null, null, 999);
            addEffect("color_5", "colormatrix", [3.309, 0.609, 1.082, 0.2, 0, 0.309, 0.609, 0.082, 0, 0, 1.309, 0.609, 0.082, 0, 0, 0, 0, 0, 1, 0], null, 999);
            addEffect("black_white_negative", "colormatrix", [-0.5, -0.5, -0.5, 0, 0xFF, -0.5, -0.5, -0.5, 0, 0xFF, -0.5, -0.5, -0.5, 0, 0xFF, 0, 0, 0, 1, 0], null, 999);
            addEffect("blue", "colormatrix", [0.5, 0.5, 0.5, 0, -255, 0.5, 0.5, 0.5, 0, -170, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 1, 0], null, 999);
            addEffect("red", "colormatrix", [0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, -170, 0.5, 0.5, 0.5, 0, -170, 0, 0, 0, 1, 0], null, 999);
            addEffect("green", "colormatrix", [0.5, 0.5, 0.5, 0, -170, 0.5, 0.5, 0.5, 0, 0, 0.5, 0.5, 0.5, 0, -170, 0, 0, 0, 1, 0], null, 999);
        }

        private static function addEffect(_arg_1:String, _arg_2:String, _arg_3:Array, _arg_4:String, _arg_5:int=0):void
        {
            if (_SafeStr_6674.indexOf(_arg_1) >= 0)
            {
                _SafeStr_5396[_arg_1] = new CameraEffect(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
            };
        }


        public function getEffectStrength():Number
        {
            return (value / _SafeStr_6404);
        }

        public function allowsOnlyOneInstance():Boolean
        {
            return (type == "frame");
        }

        public function usesEffectStrength():Boolean
        {
            return (!(type == "frame"));
        }

        public function getColorMatrixFilter(_arg_1:Boolean=false):BitmapFilter
        {
            var _local_5:int;
            if (_arg_1)
            {
                return (new ColorMatrixFilter(matrixArray));
            };
            var _local_4:Array = [];
            var _local_3:Array = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
            _local_5 = 0;
            while (_local_5 < matrixArray.length)
            {
                _local_4.push(((matrixArray[_local_5] * getEffectStrength()) + (_local_3[_local_5] * (1 - getEffectStrength()))));
                _local_5++;
            };
            return (new ColorMatrixFilter(_local_4));
        }

        public function setChosen(_arg_1:Boolean):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            isOn = _arg_1;
            if (button)
            {
                setSelectionHighlight(isOn);
                _local_3 = (button.findChildByName("remove_effect_button") as IRegionWindow);
                _local_3.visible = isOn;
                if (!allowsOnlyOneInstance())
                {
                    _local_2 = (button.findChildByName("active_indicator") as _SafeStr_3109);
                    _local_2.visible = isOn;
                };
            };
        }

        private function setSelectionHighlight(_arg_1:Boolean):void
        {
            var _local_2:* = null;
            if (button)
            {
                _local_2 = (button.findChildByName("selected_indicator") as _SafeStr_3109);
                _local_2.visible = _arg_1;
            };
        }

        public function turnOffHighlight():void
        {
            setSelectionHighlight(false);
        }


    }
}//package com.sulake.habbo.ui.widget.camera

// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4020 = "_-el" (String#1659, DoABC#4)
// _SafeStr_5396 = "_-gj" (String#3064, DoABC#4)
// _SafeStr_5598 = "_-4U" (String#14991, DoABC#4)
// _SafeStr_5600 = "_-o1Y" (String#21919, DoABC#4)
// _SafeStr_6404 = "_-U12" (String#2486, DoABC#4)
// _SafeStr_6674 = "_-z1M" (String#15556, DoABC#4)
// _SafeStr_8962 = "_-wz" (String#34564, DoABC#4)



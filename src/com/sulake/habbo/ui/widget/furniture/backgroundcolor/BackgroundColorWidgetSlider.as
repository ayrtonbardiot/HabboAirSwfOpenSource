// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorWidgetSlider

package com.sulake.habbo.ui.widget.furniture.backgroundcolor
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;

    public class BackgroundColorWidgetSlider 
    {

        private static const _SafeStr_6403:int = 0;
        private static const _SafeStr_6404:int = 0xFF;

        private var _SafeStr_4981:BackgroundColorFurniWidget;
        private var _SafeStr_5880:_SafeStr_3133;
        private var _SafeStr_4118:String;
        private var _SafeStr_5881:BitmapData;
        private var _sliderButton:BitmapData;
        private var _referenceWidth:int;
        private var _SafeStr_6580:int;

        public function BackgroundColorWidgetSlider(_arg_1:BackgroundColorFurniWidget, _arg_2:String, _arg_3:_SafeStr_3133, _arg_4:int=0)
        {
            var _local_5:* = null;
            super();
            _SafeStr_4981 = _arg_1;
            _SafeStr_4118 = _arg_2;
            _SafeStr_5880 = _arg_3;
            _local_5 = BitmapDataAsset(_arg_1.assets.getAssetByName("dimmer_slider_base"));
            _SafeStr_5881 = BitmapData(_local_5.content);
            _local_5 = BitmapDataAsset(_arg_1.assets.getAssetByName("dimmer_slider_button"));
            _sliderButton = BitmapData(_local_5.content);
            displaySlider();
            setValue(_arg_4);
        }

        public function dispose():void
        {
            _SafeStr_4981 = null;
            _SafeStr_5880 = null;
            _SafeStr_5881 = null;
            _sliderButton = null;
        }

        public function setValue(_arg_1:int):void
        {
            if (_SafeStr_5880 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _SafeStr_5880.findChildByName("slider_button");
            if (_local_2 != null)
            {
                _local_2.x = getSliderPosition(_arg_1);
            };
        }

        private function getSliderPosition(_arg_1:int):int
        {
            return (int((_referenceWidth * ((_arg_1 - 0) / (0xFF - 0)))));
        }

        private function getValue(_arg_1:Number):int
        {
            return (int(((_arg_1 / _referenceWidth) * (0xFF - 0))) + 0);
        }

        private function buttonProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            _SafeStr_4981.setParameterCallback(_SafeStr_4118, getValue(_arg_2.x));
        }

        private function displaySlider():void
        {
            var _local_2:* = null;
            var _local_1:* = null;
            if (_SafeStr_5880 == null)
            {
                return;
            };
            _local_1 = (_SafeStr_5880.findChildByName("slider_base") as _SafeStr_3264);
            if (((!(_local_1 == null)) && (!(_SafeStr_5881 == null))))
            {
                _local_1.bitmap = new BitmapData(_SafeStr_5881.width, _SafeStr_5881.height, true, 0xFFFFFF);
                _local_1.bitmap.copyPixels(_SafeStr_5881, _SafeStr_5881.rect, new Point(0, 0), null, null, true);
            };
            _local_2 = (_SafeStr_5880.findChildByName("slider_movement_area") as _SafeStr_3133);
            if (_local_2 != null)
            {
                _local_1 = (_local_2.findChildByName("slider_button") as _SafeStr_3264);
                if (((!(_local_1 == null)) && (!(_sliderButton == null))))
                {
                    _local_1.bitmap = new BitmapData(_sliderButton.width, _sliderButton.height, true, 0xFFFFFF);
                    _local_1.bitmap.copyPixels(_sliderButton, _sliderButton.rect, new Point(0, 0), null, null, true);
                    _local_1.procedure = buttonProcedure;
                    _referenceWidth = (_local_2.width - _local_1.width);
                };
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.backgroundcolor

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4118 = "_-M1c" (String#6160, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5880 = "_-t1i" (String#1458, DoABC#4)
// _SafeStr_5881 = "_-x1x" (String#1822, DoABC#4)
// _SafeStr_6403 = "_-X1I" (String#2306, DoABC#4)
// _SafeStr_6404 = "_-U12" (String#2486, DoABC#4)
// _SafeStr_6580 = "_-u1B" (String#13592, DoABC#4)



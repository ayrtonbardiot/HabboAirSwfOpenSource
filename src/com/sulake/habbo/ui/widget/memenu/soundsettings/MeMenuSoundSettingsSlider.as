// by nota

//com.sulake.habbo.ui.widget.memenu.soundsettings.MeMenuSoundSettingsSlider

package com.sulake.habbo.ui.widget.memenu.soundsettings
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;

    public class MeMenuSoundSettingsSlider 
    {

        private var _SafeStr_6951:MeMenuSoundSettingsItem;
        private var _SafeStr_5880:_SafeStr_3133;
        private var _SafeStr_5881:BitmapData;
        private var _sliderButton:BitmapData;
        private var _referenceWidth:int;
        private var _SafeStr_6403:Number = 0;
        private var _SafeStr_6404:Number = 1;

        public function MeMenuSoundSettingsSlider(_arg_1:MeMenuSoundSettingsItem, _arg_2:_SafeStr_3133, _arg_3:_SafeStr_21, _arg_4:Number=0, _arg_5:Number=1)
        {
            _SafeStr_6951 = _arg_1;
            _SafeStr_5880 = _arg_2;
            _SafeStr_6403 = _arg_4;
            _SafeStr_6404 = _arg_5;
            storeAssets(_arg_3);
            displaySlider();
        }

        public function dispose():void
        {
            _SafeStr_6951 = null;
            _SafeStr_5880 = null;
            _SafeStr_5881 = null;
            _sliderButton = null;
        }

        public function setValue(_arg_1:Number):void
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

        private function getSliderPosition(_arg_1:Number):int
        {
            return (int((_referenceWidth * ((_arg_1 - _SafeStr_6403) / (_SafeStr_6404 - _SafeStr_6403)))));
        }

        private function getValue(_arg_1:Number):Number
        {
            return (((_arg_1 / _referenceWidth) * (_SafeStr_6404 - _SafeStr_6403)) + _SafeStr_6403);
        }

        private function buttonProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WE_RELOCATED")
            {
                return;
            };
            _SafeStr_6951.saveVolume(getValue(_arg_2.x), false);
        }

        private function displaySlider():void
        {
            var _local_3:* = null;
            var _local_1:* = null;
            var _local_2:* = null;
            if (_SafeStr_5880 == null)
            {
                return;
            };
            _local_2 = (_SafeStr_5880.findChildByName("slider_base") as _SafeStr_3264);
            if (((!(_local_2 == null)) && (!(_SafeStr_5881 == null))))
            {
                _local_2.bitmap = new BitmapData(_SafeStr_5881.width, _SafeStr_5881.height, true, 0xFFFFFF);
                _local_2.bitmap.copyPixels(_SafeStr_5881, _SafeStr_5881.rect, new Point(0, 0), null, null, true);
            };
            _local_3 = (_SafeStr_5880.findChildByName("slider_movement_area") as _SafeStr_3133);
            if (_local_3 != null)
            {
                _local_1 = (_local_3.findChildByName("slider_button") as _SafeStr_3133);
                if (_local_1 != null)
                {
                    _local_2 = (_local_1.findChildByName("slider_bitmap") as _SafeStr_3264);
                    if (((!(_local_2 == null)) && (!(_sliderButton == null))))
                    {
                        _local_2.bitmap = new BitmapData(_sliderButton.width, _sliderButton.height, true, 0xFFFFFF);
                        _local_2.bitmap.copyPixels(_sliderButton, _sliderButton.rect, new Point(0, 0), null, null, true);
                        _local_1.procedure = buttonProcedure;
                        _referenceWidth = (_local_3.width - _local_2.width);
                    };
                };
            };
        }

        private function storeAssets(_arg_1:_SafeStr_21):void
        {
            var _local_2:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            _local_2 = BitmapDataAsset(_arg_1.getAssetByName("memenu_settings_slider_base"));
            _SafeStr_5881 = BitmapData(_local_2.content);
            _local_2 = BitmapDataAsset(_arg_1.getAssetByName("memenu_settings_slider_button"));
            _sliderButton = BitmapData(_local_2.content);
        }


    }
}//package com.sulake.habbo.ui.widget.memenu.soundsettings

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_5880 = "_-t1i" (String#1458, DoABC#4)
// _SafeStr_5881 = "_-x1x" (String#1822, DoABC#4)
// _SafeStr_6403 = "_-X1I" (String#2306, DoABC#4)
// _SafeStr_6404 = "_-U12" (String#2486, DoABC#4)
// _SafeStr_6951 = "_-Ys" (String#6324, DoABC#4)



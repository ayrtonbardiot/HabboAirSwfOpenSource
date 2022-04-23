// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.toolbar.memenu.soundsettings.MeMenuSoundSettingsSlider

package com.sulake.habbo.toolbar.memenu.soundsettings
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class MeMenuSoundSettingsSlider 
    {

        private var _SafeStr_6951:*;
        private var _SafeStr_5880:_SafeStr_3133;
        private var _referenceWidth:int;
        private var _SafeStr_6403:Number = 0;
        private var _SafeStr_6404:Number = 1;

        public function MeMenuSoundSettingsSlider(_arg_1:*, _arg_2:_SafeStr_3133, _arg_3:_SafeStr_21, _arg_4:Number=0, _arg_5:Number=1)
        {
            _SafeStr_6951 = _arg_1;
            _SafeStr_5880 = _arg_2;
            _SafeStr_6403 = _arg_4;
            _SafeStr_6404 = _arg_5;
            displaySlider();
        }

        public function dispose():void
        {
            _SafeStr_6951 = null;
            _SafeStr_5880 = null;
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
            var _local_2:* = null;
            var _local_1:* = null;
            if (_SafeStr_5880 == null)
            {
                return;
            };
            _local_2 = (_SafeStr_5880.findChildByName("slider_movement_area") as _SafeStr_3133);
            if (_local_2 != null)
            {
                _local_1 = (_local_2.findChildByName("slider_button") as _SafeStr_3133);
                if (_local_1 != null)
                {
                    _local_1.procedure = buttonProcedure;
                    _referenceWidth = (_local_2.width - _local_1.width);
                };
            };
        }


    }
}//package com.sulake.habbo.toolbar.memenu.soundsettings

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_5880 = "_-t1i" (String#1458, DoABC#4)
// _SafeStr_6403 = "_-X1I" (String#2306, DoABC#4)
// _SafeStr_6404 = "_-U12" (String#2486, DoABC#4)
// _SafeStr_6951 = "_-Ys" (String#6324, DoABC#4)



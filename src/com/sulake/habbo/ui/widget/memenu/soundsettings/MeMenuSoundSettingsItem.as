// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.memenu.soundsettings.MeMenuSoundSettingsItem

package com.sulake.habbo.ui.widget.memenu.soundsettings
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;

    public class MeMenuSoundSettingsItem implements _SafeStr_13 
    {

        public static const TYPE_UI_VOLUME:int = 0;
        public static const TYPE_FURNI_VOLUME:int = 1;
        public static const TYPE_TRAX_VOLUME:int = 2;

        private var _SafeStr_4028:int;
        private var _volume:Number;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5574:MeMenuSoundSettingsSlider;
        private var _SafeStr_6670:MeMenuSoundSettingsView;

        public function MeMenuSoundSettingsItem(_arg_1:MeMenuSoundSettingsView, _arg_2:int, _arg_3:_SafeStr_3133):void
        {
            var _local_4:* = null;
            super();
            _SafeStr_4028 = _arg_2;
            _SafeStr_6670 = _arg_1;
            _window = _arg_3;
            _SafeStr_5574 = new MeMenuSoundSettingsSlider(this, (_window.findChildByName("volume_container") as _SafeStr_3133), _SafeStr_6670.widget.assets, 0, 1);
            _local_4 = _window.findChildByName("sounds_off");
            if (_local_4 != null)
            {
                _local_4.addEventListener("WME_CLICK", onButtonClicked);
                _local_4.addEventListener("WME_OVER", onButtonOver);
                _local_4.addEventListener("WME_OUT", onButtonOut);
            };
            _local_4 = _window.findChildByName("sounds_on");
            if (_local_4 != null)
            {
                _local_4.addEventListener("WME_CLICK", onButtonClicked);
                _local_4.addEventListener("WME_OVER", onButtonOver);
                _local_4.addEventListener("WME_OUT", onButtonOut);
            };
            updateSoundIcons();
        }

        public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_5574)
                {
                    _SafeStr_5574.dispose();
                    _SafeStr_5574 = null;
                };
                if (_window)
                {
                    _window.dispose();
                    _window = null;
                };
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_6670 == null);
        }

        public function saveVolume(_arg_1:Number, _arg_2:Boolean):void
        {
            _volume = _arg_1;
            switch (_SafeStr_4028)
            {
                case 0:
                    _SafeStr_6670.saveVolume(_arg_1, -1, -1, _arg_2);
                    break;
                case 1:
                    _SafeStr_6670.saveVolume(-1, _arg_1, -1, _arg_2);
                    break;
                case 2:
                    _SafeStr_6670.saveVolume(-1, -1, _arg_1, _arg_2);
                default:
            };
            updateSoundIcons();
        }

        private function updateSoundIcons():void
        {
            if (_volume == 0)
            {
                setBitmapWrapperContent("sounds_on_icon", _SafeStr_6670.soundsOnIconWhite);
                setBitmapWrapperContent("sounds_off_icon", _SafeStr_6670.soundsOffIconColor);
            }
            else
            {
                setBitmapWrapperContent("sounds_on_icon", _SafeStr_6670.soundsOnIconColor);
                setBitmapWrapperContent("sounds_off_icon", _SafeStr_6670.soundsOffIconWhite);
            };
        }

        private function onButtonOver(_arg_1:WindowMouseEvent):void
        {
            var _local_2:_SafeStr_3109 = (_arg_1.target as _SafeStr_3109);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "sounds_off_icon":
                case "sounds_off":
                    setBitmapWrapperContent("sounds_off_icon", _SafeStr_6670.soundsOffIconColor);
                    return;
                case "sounds_on_icon":
                case "sounds_on":
                    setBitmapWrapperContent("sounds_on_icon", _SafeStr_6670.soundsOnIconColor);
                    return;
            };
        }

        private function onButtonOut(_arg_1:WindowMouseEvent):void
        {
            var _local_2:_SafeStr_3109 = (_arg_1.target as _SafeStr_3109);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "sounds_off":
                    if (_volume != 0)
                    {
                        setBitmapWrapperContent("sounds_off_icon", _SafeStr_6670.soundsOffIconWhite);
                    };
                    return;
                case "sounds_on":
                    if (_volume != 1)
                    {
                        setBitmapWrapperContent("sounds_on_icon", _SafeStr_6670.soundsOnIconWhite);
                    };
                    return;
            };
        }

        private function onButtonClicked(_arg_1:WindowMouseEvent):void
        {
            var _local_2:_SafeStr_3109 = (_arg_1.target as _SafeStr_3109);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "sounds_off":
                    saveVolume(0, false);
                    return;
                case "sounds_on":
                    saveVolume(1, false);
                    return;
                default:
                    _SafeStr_14.log(("Me Menu Settings, Sound settings item: unknown button: " + _local_3));
                    return;
            };
        }

        private function setBitmapWrapperContent(_arg_1:String, _arg_2:BitmapData):void
        {
            var _local_3:_SafeStr_3264 = (_window.findChildByName(_arg_1) as _SafeStr_3264);
            if (((!(_local_3 == null)) && (!(_arg_2 == null))))
            {
                _local_3.bitmap = _arg_2.clone();
            };
        }

        public function setValue(_arg_1:Number):void
        {
            _SafeStr_5574.setValue(_arg_1);
            updateSoundIcons();
        }


    }
}//package com.sulake.habbo.ui.widget.memenu.soundsettings

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_5574 = "_-dM" (String#1109, DoABC#4)
// _SafeStr_6670 = "_-71j" (String#2595, DoABC#4)



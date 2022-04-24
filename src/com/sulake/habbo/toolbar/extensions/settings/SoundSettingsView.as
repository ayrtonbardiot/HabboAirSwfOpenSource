// by nota

//com.sulake.habbo.toolbar.extensions.settings.SoundSettingsView

package com.sulake.habbo.toolbar.extensions.settings
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class SoundSettingsView 
    {

        private var _window:_SafeStr_3133;
        private var _SafeStr_5580:SoundSettingsItem;
        private var _SafeStr_5581:SoundSettingsItem;
        private var _SafeStr_5582:SoundSettingsItem;
        private var _soundsOffIconColor:BitmapData;
        private var _soundsOffIconWhite:BitmapData;
        private var _soundsOnIconColor:BitmapData;
        private var _soundsOnIconWhite:BitmapData;
        private var _genericVolume:Number = 1;
        private var _furniVolume:Number = 1;
        private var _traxVolume:Number = 1;
        private var _toolbar:HabboToolbar;

        public function SoundSettingsView(_arg_1:HabboToolbar)
        {
            _toolbar = _arg_1;
            createWindow();
        }

        public function dispose():void
        {
            saveVolume(_genericVolume, _furniVolume, _traxVolume);
            if (_window != null)
            {
                _window.dispose();
            };
            _window = null;
            if (_SafeStr_5580 != null)
            {
                _SafeStr_5580.dispose();
            };
            _SafeStr_5580 = null;
            if (_SafeStr_5581 != null)
            {
                _SafeStr_5581.dispose();
            };
            _SafeStr_5581 = null;
            if (_SafeStr_5582 != null)
            {
                _SafeStr_5582.dispose();
            };
            _SafeStr_5582 = null;
            if (_soundsOffIconColor)
            {
                _soundsOffIconColor.dispose();
                _soundsOffIconColor = null;
            };
            if (_soundsOffIconWhite)
            {
                _soundsOffIconWhite.dispose();
                _soundsOffIconWhite = null;
            };
            if (_soundsOnIconColor)
            {
                _soundsOnIconColor.dispose();
                _soundsOnIconColor = null;
            };
            if (_soundsOnIconWhite)
            {
                _soundsOnIconWhite.dispose();
                _soundsOnIconWhite = null;
            };
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function updateSettings():void
        {
            _genericVolume = _toolbar.soundManager.genericVolume;
            _furniVolume = _toolbar.soundManager.furniVolume;
            _traxVolume = _toolbar.soundManager.traxVolume;
            if (_SafeStr_5580 != null)
            {
                _SafeStr_5580.setValue(_genericVolume);
            };
            if (_SafeStr_5581 != null)
            {
                _SafeStr_5581.setValue(_furniVolume);
            };
            if (_SafeStr_5582 != null)
            {
                _SafeStr_5582.setValue(_traxVolume);
            };
        }

        private function createWindow():void
        {
            var _local_1:* = null;
            var _local_3:int;
            var _local_2:XmlAsset = (_toolbar.assets.getAssetByName("me_menu_sound_settings_xml") as XmlAsset);
            _window = (_toolbar.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            _local_3 = 0;
            while (_local_3 < _window.numChildren)
            {
                _local_1 = _window.getChildAt(_local_3);
                _local_1.addEventListener("WME_CLICK", onButtonClicked);
                _local_3++;
            };
            _SafeStr_5580 = new SoundSettingsItem(this, 0, uiVolumeContainer);
            _SafeStr_5581 = new SoundSettingsItem(this, 1, furniVolumeContainer);
            _SafeStr_5582 = new SoundSettingsItem(this, 2, traxVolumeContainer);
            updateSettings();
        }

        private function onButtonClicked(_arg_1:WindowMouseEvent):void
        {
            var _local_2:_SafeStr_3109 = (_arg_1.target as _SafeStr_3109);
            var _local_3:String = _local_2.name;
            _SafeStr_14.log(_local_3);
            switch (_local_3)
            {
                case "back_btn":
                    dispose();
                    return;
                default:
                    _SafeStr_14.log(("Me Menu Settings View: unknown button: " + _local_3));
                    return;
            };
        }

        public function saveVolume(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Boolean=true):void
        {
            var _local_6:Number = ((_arg_2 != -1) ? _arg_2 : _furniVolume);
            var _local_5:Number = ((_arg_1 != -1) ? _arg_1 : _genericVolume);
            var _local_7:Number = ((_arg_3 != -1) ? _arg_3 : _traxVolume);
            if (_arg_4)
            {
                if (_toolbar == null)
                {
                    return;
                };
                _toolbar.soundManager.furniVolume = _local_6;
                _toolbar.soundManager.genericVolume = _local_5;
                _toolbar.soundManager.traxVolume = _local_7;
            }
            else
            {
                _toolbar.soundManager.previewVolume(_local_5, _local_6, _local_7);
            };
        }

        public function updateUnseenItemCount(_arg_1:String, _arg_2:int):void
        {
        }

        public function get uiVolumeContainer():_SafeStr_3133
        {
            return (_window.findChildByName("ui_volume_container") as _SafeStr_3133);
        }

        public function get furniVolumeContainer():_SafeStr_3133
        {
            return (_window.findChildByName("furni_volume_container") as _SafeStr_3133);
        }

        public function get traxVolumeContainer():_SafeStr_3133
        {
            return (_window.findChildByName("trax_volume_container") as _SafeStr_3133);
        }

        public function get soundsOffIconColor():BitmapData
        {
            return (_soundsOffIconColor);
        }

        public function get soundsOffIconWhite():BitmapData
        {
            return (_soundsOffIconWhite);
        }

        public function get soundsOnIconColor():BitmapData
        {
            return (_soundsOnIconColor);
        }

        public function get soundsOnIconWhite():BitmapData
        {
            return (_soundsOnIconWhite);
        }

        public function get toolbar():HabboToolbar
        {
            return (_toolbar);
        }


    }
}//package com.sulake.habbo.toolbar.extensions.settings

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_5580 = "_-E1F" (String#2990, DoABC#4)
// _SafeStr_5581 = "_-QP" (String#3031, DoABC#4)
// _SafeStr_5582 = "_-D" (String#3012, DoABC#4)



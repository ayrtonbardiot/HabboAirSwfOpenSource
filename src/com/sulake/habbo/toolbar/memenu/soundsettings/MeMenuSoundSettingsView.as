// by nota

//com.sulake.habbo.toolbar.memenu.soundsettings.MeMenuSoundSettingsView

package com.sulake.habbo.toolbar.memenu.soundsettings
{
    import com.sulake.habbo.toolbar.memenu.MeMenuSettingsMenuView;
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import com.sulake.habbo.toolbar.ToolbarView;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.toolbar.memenu.MeMenuController;

    public class MeMenuSoundSettingsView 
    {

        private var _SafeStr_4981:MeMenuSettingsMenuView;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5580:MeMenuSoundSettingsItem;
        private var _SafeStr_5581:MeMenuSoundSettingsItem;
        private var _SafeStr_5582:MeMenuSoundSettingsItem;
        private var _soundsOffIconColor:BitmapData;
        private var _soundsOffIconWhite:BitmapData;
        private var _soundsOnIconColor:BitmapData;
        private var _soundsOnIconWhite:BitmapData;
        private var _genericVolume:Number = 1;
        private var _furniVolume:Number = 1;
        private var _traxVolume:Number = 1;
        private var _SafeStr_4389:ToolbarView;


        public function init(_arg_1:MeMenuSettingsMenuView, _arg_2:ToolbarView):void
        {
            _SafeStr_4389 = _arg_2;
            _SafeStr_4981 = _arg_1;
            createWindow();
        }

        public function dispose():void
        {
            saveVolume(_genericVolume, _furniVolume, _traxVolume);
            _SafeStr_4981 = null;
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
            _genericVolume = _SafeStr_4981.widget.toolbar.soundManager.genericVolume;
            _furniVolume = _SafeStr_4981.widget.toolbar.soundManager.furniVolume;
            _traxVolume = _SafeStr_4981.widget.toolbar.soundManager.traxVolume;
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
            var _local_2:XmlAsset = (_SafeStr_4981.widget.toolbar.assets.getAssetByName("me_menu_sound_settings_xml") as XmlAsset);
            _window = (_SafeStr_4981.widget.toolbar.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            _window.x = (_SafeStr_4389.window.width + 10);
            _window.y = (_SafeStr_4389.window.bottom - _window.height);
            _local_3 = 0;
            while (_local_3 < _window.numChildren)
            {
                _local_1 = _window.getChildAt(_local_3);
                _local_1.addEventListener("WME_CLICK", onButtonClicked);
                _local_3++;
            };
            _SafeStr_5580 = new MeMenuSoundSettingsItem(this, 0, uiVolumeContainer);
            _SafeStr_5581 = new MeMenuSoundSettingsItem(this, 1, furniVolumeContainer);
            _SafeStr_5582 = new MeMenuSoundSettingsItem(this, 2, traxVolumeContainer);
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
                    _SafeStr_4981.window.visible = true;
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
                if (_SafeStr_4981 == null)
                {
                    return;
                };
                _SafeStr_4981.widget.toolbar.soundManager.furniVolume = _local_6;
                _SafeStr_4981.widget.toolbar.soundManager.genericVolume = _local_5;
                _SafeStr_4981.widget.toolbar.soundManager.traxVolume = _local_7;
            }
            else
            {
                _SafeStr_4981.widget.toolbar.soundManager.previewVolume(_local_5, _local_6, _local_7);
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

        public function get widget():MeMenuController
        {
            return (_SafeStr_4981.widget);
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


    }
}//package com.sulake.habbo.toolbar.memenu.soundsettings

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4389 = "_-3p" (String#1625, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5580 = "_-E1F" (String#2990, DoABC#4)
// _SafeStr_5581 = "_-QP" (String#3031, DoABC#4)
// _SafeStr_5582 = "_-D" (String#3012, DoABC#4)



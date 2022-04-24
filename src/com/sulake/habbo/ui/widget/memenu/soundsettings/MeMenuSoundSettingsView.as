// by nota

//com.sulake.habbo.ui.widget.memenu.soundsettings.MeMenuSoundSettingsView

package com.sulake.habbo.ui.widget.memenu.soundsettings
{
    import com.sulake.habbo.ui.widget.memenu.IMeMenuView;
    import com.sulake.habbo.ui.widget.memenu.MeMenuWidget;
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.widget.events.RoomWidgetSettingsUpdateEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetSettingsMessage;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetStoreSettingsMessage;

    public class MeMenuSoundSettingsView implements IMeMenuView 
    {

        private var _SafeStr_4981:MeMenuWidget;
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


        public function init(_arg_1:MeMenuWidget, _arg_2:String):void
        {
            _SafeStr_4981 = _arg_1;
            createWindow(_arg_2);
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

        public function updateSettings(_arg_1:RoomWidgetSettingsUpdateEvent):void
        {
            _genericVolume = _arg_1.uiVolume;
            _furniVolume = _arg_1.furniVolume;
            _traxVolume = _arg_1.traxVolume;
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

        private function createWindow(_arg_1:String):void
        {
            var _local_2:* = null;
            var _local_5:int;
            var _local_4:* = null;
            var _local_3:XmlAsset = (_SafeStr_4981.assets.getAssetByName("memenu_settings") as XmlAsset);
            if (_local_3)
            {
                _window = (_SafeStr_4981.windowManager.buildFromXML((_local_3.content as XML)) as _SafeStr_3133);
            };
            if (_window == null)
            {
                throw (new Error("Failed to construct sound settings window from XML!"));
            };
            _window.name = _arg_1;
            _local_5 = 0;
            while (_local_5 < _window.numChildren)
            {
                _local_2 = _window.getChildAt(_local_5);
                _local_2.addEventListener("WME_CLICK", onButtonClicked);
                _local_5++;
            };
            _local_4 = (_SafeStr_4981.assets.getAssetByName("sounds_off_color") as BitmapDataAsset);
            if (((!(_local_4 == null)) && (!(_local_4.content == null))))
            {
                _soundsOffIconColor = (_local_4.content as BitmapData).clone();
            };
            _local_4 = (_SafeStr_4981.assets.getAssetByName("sounds_off_white") as BitmapDataAsset);
            if (((!(_local_4 == null)) && (!(_local_4.content == null))))
            {
                _soundsOffIconWhite = (_local_4.content as BitmapData).clone();
            };
            _local_4 = (_SafeStr_4981.assets.getAssetByName("sounds_on_color") as BitmapDataAsset);
            if (((!(_local_4 == null)) && (!(_local_4.content == null))))
            {
                _soundsOnIconColor = (_local_4.content as BitmapData).clone();
            };
            _local_4 = (_SafeStr_4981.assets.getAssetByName("sounds_on_white") as BitmapDataAsset);
            if (((!(_local_4 == null)) && (!(_local_4.content == null))))
            {
                _soundsOnIconWhite = (_local_4.content as BitmapData).clone();
            };
            _SafeStr_5580 = new MeMenuSoundSettingsItem(this, 0, uiVolumeContainer);
            _SafeStr_5581 = new MeMenuSoundSettingsItem(this, 1, furniVolumeContainer);
            _SafeStr_5582 = new MeMenuSoundSettingsItem(this, 2, traxVolumeContainer);
            _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetGetSettingsMessage("RWGSM_GET_SETTINGS"));
        }

        private function onButtonClicked(_arg_1:WindowMouseEvent):void
        {
            var _local_2:_SafeStr_3109 = (_arg_1.target as _SafeStr_3109);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "back_btn":
                    _SafeStr_4981.changeView("me_menu_settings_view");
                    return;
                default:
                    _SafeStr_14.log(("Me Menu Settings View: unknown button: " + _local_3));
                    return;
            };
        }

        public function saveVolume(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Boolean=true):void
        {
            var _local_5:* = null;
            if (_arg_4)
            {
                _local_5 = new RoomWidgetStoreSettingsMessage("RWSSM_STORE_SOUND");
            }
            else
            {
                _local_5 = new RoomWidgetStoreSettingsMessage("RWSSM_PREVIEW_SOUND");
            };
            _local_5.genericVolume = ((_arg_1 != -1) ? _arg_1 : _genericVolume);
            _local_5.furniVolume = ((_arg_2 != -1) ? _arg_2 : _furniVolume);
            _local_5.traxVolume = ((_arg_3 != -1) ? _arg_3 : _traxVolume);
            _SafeStr_4981.messageListener.processWidgetMessage(_local_5);
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

        public function get widget():MeMenuWidget
        {
            return (_SafeStr_4981);
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
}//package com.sulake.habbo.ui.widget.memenu.soundsettings

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5580 = "_-E1F" (String#2990, DoABC#4)
// _SafeStr_5581 = "_-QP" (String#3031, DoABC#4)
// _SafeStr_5582 = "_-D" (String#3012, DoABC#4)



// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.toolbar.memenu.MeMenuSettingsMenuView

package com.sulake.habbo.toolbar.memenu
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.toolbar.ToolbarView;
    import com.sulake.habbo.toolbar.memenu.soundsettings.MeMenuSoundSettingsView;
    import com.sulake.habbo.toolbar.memenu.chatsettings.MeMenuChatSettingsView;
    import com.sulake.core.assets.XmlAsset;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class MeMenuSettingsMenuView 
    {

        private var _SafeStr_4981:MeMenuController;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4389:ToolbarView;
        private var _SafeStr_6592:MeMenuSoundSettingsView;
        private var _SafeStr_6593:MeMenuChatSettingsView;


        public function init(_arg_1:MeMenuController, _arg_2:ToolbarView):void
        {
            _SafeStr_4389 = _arg_2;
            _SafeStr_4981 = _arg_1;
            createWindow();
        }

        public function dispose():void
        {
            if (_SafeStr_6592 != null)
            {
                _SafeStr_6592.dispose();
                _SafeStr_6592 = null;
            };
            if (_SafeStr_6593 != null)
            {
                _SafeStr_6593.dispose();
                _SafeStr_6593 = null;
            };
            _SafeStr_4981 = null;
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        private function createWindow():void
        {
            var _local_1:XmlAsset = (_SafeStr_4981.toolbar.assets.getAssetByName("me_menu_settings_menu_xml") as XmlAsset);
            if (_local_1)
            {
                _window = (_SafeStr_4981.toolbar.windowManager.buildFromXML((_local_1.content as XML)) as _SafeStr_3133);
            };
            if (_window == null)
            {
                throw (new Error("Failed to construct settings window from XML!"));
            };
            _window.procedure = eventHandler;
            _window.x = (_SafeStr_4389.window.width + 10);
            _window.y = (_SafeStr_4389.window.bottom - _window.height);
            if (((!(ExternalInterface.available)) || (!(_SafeStr_4981.toolbar.getProperty("has.identity") == "1"))))
            {
                _window.findChildByName("character_settings").disable();
            }
            else
            {
                _window.findChildByName("identity_text").visible = false;
            };
            _window.findChildByName("chat_settings").visible = true;
        }

        private function eventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "character_settings":
                    HabboWebTools.openAvatars();
                    return;
                case "sound_settings":
                    _SafeStr_6592 = new MeMenuSoundSettingsView();
                    _SafeStr_6592.init(this, _SafeStr_4389);
                    _window.visible = false;
                    return;
                case "chat_settings":
                    _SafeStr_6593 = new MeMenuChatSettingsView();
                    _SafeStr_6593.init(this, _SafeStr_4389);
                    return;
                case "back":
                    _SafeStr_4981.window.visible = true;
                    dispose();
                    return;
            };
        }

        public function updateUnseenItemCount(_arg_1:String, _arg_2:int):void
        {
        }

        public function get widget():MeMenuController
        {
            return (_SafeStr_4981);
        }


    }
}//package com.sulake.habbo.toolbar.memenu

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4389 = "_-3p" (String#1625, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6592 = "_-r1h" (String#9809, DoABC#4)
// _SafeStr_6593 = "_-DS" (String#9325, DoABC#4)



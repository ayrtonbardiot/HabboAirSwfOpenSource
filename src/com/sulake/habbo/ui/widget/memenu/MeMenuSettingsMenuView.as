// by nota

//com.sulake.habbo.ui.widget.memenu.MeMenuSettingsMenuView

package com.sulake.habbo.ui.widget.memenu
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.XmlAsset;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class MeMenuSettingsMenuView implements IMeMenuView 
    {

        private var _SafeStr_4981:MeMenuWidget;
        private var _window:_SafeStr_3133;


        public function init(_arg_1:MeMenuWidget, _arg_2:String):void
        {
            _SafeStr_4981 = _arg_1;
            createWindow(_arg_2);
        }

        public function dispose():void
        {
            _SafeStr_4981 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        private function createWindow(_arg_1:String):void
        {
            var _local_2:XmlAsset = (_SafeStr_4981.assets.getAssetByName("memenu_settings_menu") as XmlAsset);
            if (_local_2)
            {
                _window = (_SafeStr_4981.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            };
            if (_window == null)
            {
                throw (new Error("Failed to construct settings window from XML!"));
            };
            _window.name = _arg_1;
            _window.procedure = eventHandler;
            if (((!(ExternalInterface.available)) || (!(_SafeStr_4981.config.getProperty("has.identity") == "1"))))
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
                    _SafeStr_4981.hide();
                    return;
                case "sound_settings":
                    _SafeStr_4981.changeView("me_menu_sound_settings");
                    return;
                case "chat_settings":
                    _SafeStr_4981.changeView("me_menu_chat_settings");
                    return;
                case "back":
                    _SafeStr_4981.changeView("me_menu_top_view");
                    return;
            };
        }

        public function updateUnseenItemCount(_arg_1:String, _arg_2:int):void
        {
        }


    }
}//package com.sulake.habbo.ui.widget.memenu

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)



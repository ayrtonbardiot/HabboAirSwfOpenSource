// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.memenu.chatsettings.MeMenuChatSettingsView

package com.sulake.habbo.ui.widget.memenu.chatsettings
{
    import com.sulake.habbo.ui.widget.memenu.IMeMenuView;
    import com.sulake.habbo.ui.widget.memenu.MeMenuWidget;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetStoreSettingsMessage;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class MeMenuChatSettingsView implements IMeMenuView 
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
            var _local_2:RoomWidgetStoreSettingsMessage = new RoomWidgetStoreSettingsMessage("RWSSM_STORE_CHAT");
            var _local_1:_SafeStr_3158 = (_window.findChildByName("prefer_old_chat_checkbox") as _SafeStr_3158);
            _local_2.forceOldChat = ((!(_local_1 == null)) && (_local_1.isSelected));
            _SafeStr_4981.messageListener.processWidgetMessage(_local_2);
            _window.dispose();
            _window = null;
            _SafeStr_4981 = null;
        }

        private function createWindow(_arg_1:String):void
        {
            var _local_4:int;
            var _local_2:* = null;
            var _local_3:XmlAsset = (_SafeStr_4981.assets.getAssetByName("memenu_chat_settings") as XmlAsset);
            if (_local_3)
            {
                _window = (_SafeStr_4981.windowManager.buildFromXML((_local_3.content as XML)) as _SafeStr_3133);
            };
            if (_window == null)
            {
                throw (new Error("Failed to construct sound settings window from XML!"));
            };
            _window.name = _arg_1;
            _local_4 = 0;
            _local_2 = null;
            while (_local_4 < _window.numChildren)
            {
                _local_2 = _window.getChildAt(_local_4);
                _local_2.addEventListener("WME_CLICK", onButtonClicked);
                _local_4++;
            };
            _SafeStr_3158(_window.findChildByName("prefer_old_chat_checkbox")).isSelected = _SafeStr_4981.handler.container.freeFlowChat.isDisabledInPreferences;
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
            };
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function updateUnseenItemCount(_arg_1:String, _arg_2:int):void
        {
        }


    }
}//package com.sulake.habbo.ui.widget.memenu.chatsettings

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)



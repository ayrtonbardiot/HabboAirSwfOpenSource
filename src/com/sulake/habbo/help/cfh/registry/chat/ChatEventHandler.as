// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.help.cfh.registry.chat.ChatEventHandler

package com.sulake.habbo.help.cfh.registry.chat
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.help.HabboHelp;
    import com.sulake.habbo.session._SafeStr_3241;
    import _-Ja._SafeStr_1569;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;

    public class ChatEventHandler implements _SafeStr_13 
    {

        private var _SafeStr_4147:HabboHelp;

        public function ChatEventHandler(_arg_1:HabboHelp)
        {
            _SafeStr_4147 = _arg_1;
            _SafeStr_4147.roomSessionManager.events.addEventListener("RSCE_CHAT_EVENT", onRoomChat);
        }

        public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_4147)
                {
                    _SafeStr_4147.roomSessionManager.events.removeEventListener("RSCE_CHAT_EVENT", onRoomChat);
                    _SafeStr_4147 = null;
                };
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4147 == null);
        }

        private function onRoomChat(_arg_1:RoomSessionChatEvent):void
        {
            var _local_2:_SafeStr_3241 = _SafeStr_4147.roomSessionManager.getSession(_arg_1.session.roomId).userDataManager.getUserDataByIndex(_arg_1.userId);
            var _local_3:_SafeStr_1569 = _SafeStr_4147.navigator.enteredGuestRoomData;
            if ((((!(_local_2)) || (!(_local_2.type == 1))) || (!(_local_3))))
            {
                return;
            };
            var _local_4:String = ((_local_3) ? _local_3.roomName : "Unknown Room");
            _SafeStr_4147.chatRegistry.addItem(_arg_1.session.roomId, _local_4, _local_2.webID, _local_2.name, _arg_1.text);
        }


    }
}//package com.sulake.habbo.help.cfh.registry.chat

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)



// by nota

//com.sulake.habbo.freeflowchat.data.ChatEventHandler

package com.sulake.habbo.freeflowchat.data
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IVector3d;
    import flash.utils.getTimer;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import com.sulake.habbo.game.events.GameChatEvent;

    public class ChatEventHandler implements _SafeStr_13 
    {

        public static const CHAT_STYLE_SNOWWAR_RED:int = 120;
        public static const CHAT_STYLE_SNOWWAR_BLUE:int = 121;

        private var _SafeStr_4147:HabboFreeFlowChat;
        private var _SafeStr_5090:uint = 0;
        private var _SafeStr_5091:uint = 0;

        public function ChatEventHandler(_arg_1:HabboFreeFlowChat)
        {
            _SafeStr_4147 = _arg_1;
            _SafeStr_4147.roomSessionManager.events.addEventListener("RSCE_CHAT_EVENT", onRoomChat);
            if (_SafeStr_4147.gameManager)
            {
                _SafeStr_4147.gameManager.events.addEventListener("gce_game_chat", gameEventHandler);
            };
        }

        public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_4147)
                {
                    _SafeStr_4147.roomSessionManager.events.removeEventListener("RSCE_CHAT_EVENT", onRoomChat);
                    _SafeStr_4147.gameManager.events.removeEventListener("gce_game_chat", gameEventHandler);
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
            var _local_3:IRoomObject = _SafeStr_4147.roomEngine.getRoomObject(_arg_1.session.roomId, _arg_1.userId, 100);
            var _local_4:IVector3d;
            if (_local_3 != null)
            {
                _local_4 = _local_3.getLocation();
            };
            var _local_2:uint = getTimer();
            if (_local_2 == _SafeStr_5090)
            {
                _SafeStr_5091++;
            }
            else
            {
                _SafeStr_5091 = 0;
            };
            _SafeStr_4147.insertChat(new ChatItem(_arg_1, (_local_2 + _SafeStr_5091), _local_4, _arg_1.extraParam));
            _SafeStr_5090 = _local_2;
        }

        private function gameEventHandler(_arg_1:GameChatEvent):void
        {
            var _local_3:int = ((_arg_1.teamId == 1) ? 121 : 120);
            var _local_2:RoomSessionChatEvent = new RoomSessionChatEvent("RSCE_CHAT_EVENT", null, _arg_1.userId, _arg_1.message, 0, _local_3);
            _SafeStr_4147.insertChat(new ChatItem(_local_2, getTimer(), null, 0, _arg_1.locX, _arg_1.color, _arg_1.figure, _arg_1.name));
        }


    }
}//package com.sulake.habbo.freeflowchat.data

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_5090 = "_-3j" (String#22205, DoABC#4)
// _SafeStr_5091 = "_-FT" (String#11323, DoABC#4)



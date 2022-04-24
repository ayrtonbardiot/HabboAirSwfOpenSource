// by nota

//com.sulake.habbo.freeflowchat.data.RoomSessionEventHandler

package com.sulake.habbo.freeflowchat.data
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import com.sulake.habbo.session.events.RoomSessionEvent;

    public class RoomSessionEventHandler implements _SafeStr_13 
    {

        private var _SafeStr_4147:HabboFreeFlowChat;

        public function RoomSessionEventHandler(_arg_1:HabboFreeFlowChat)
        {
            _SafeStr_4147 = _arg_1;
            _SafeStr_4147.roomSessionManager.events.addEventListener("RSE_CREATED", onRoomSessionCreated);
            _SafeStr_4147.roomSessionManager.events.addEventListener("RSE_ENDED", onRoomSessionEnded);
        }

        public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_4147)
                {
                    _SafeStr_4147.roomSessionManager.events.removeEventListener("RSE_CREATED", onRoomSessionCreated);
                    _SafeStr_4147.roomSessionManager.events.removeEventListener("RSE_ENDED", onRoomSessionEnded);
                    _SafeStr_4147 = null;
                };
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4147 == null);
        }

        private function onRoomSessionCreated(_arg_1:RoomSessionEvent):void
        {
            _SafeStr_4147.roomEntered();
        }

        private function onRoomSessionEnded(_arg_1:RoomSessionEvent):void
        {
            _SafeStr_4147.roomLeft();
        }


    }
}//package com.sulake.habbo.freeflowchat.data

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)



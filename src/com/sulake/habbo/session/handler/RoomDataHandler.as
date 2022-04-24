// by nota

//com.sulake.habbo.session.handler.RoomDataHandler

package com.sulake.habbo.session.handler
{
    import _-Ja._SafeStr_843;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import _-31H._SafeStr_1082;
    import com.sulake.habbo.session.IRoomSession;
    import _-Ja._SafeStr_1569;
    import com.sulake.habbo.session.events.RoomSessionPropertyUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class RoomDataHandler extends BaseHandler 
    {

        public function RoomDataHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addMessageEvent(new _SafeStr_843(onRoomResult));
        }

        private function onRoomResult(_arg_1:IMessageEvent):void
        {
            var _local_5:_SafeStr_843 = (_arg_1 as _SafeStr_843);
            if (_local_5 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1082 = _local_5.getParser();
            if (_local_2.roomForward)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            var _local_4:_SafeStr_1569 = _local_2.data;
            _local_3.tradeMode = _local_4.tradeMode;
            _local_3.isGuildRoom = (!(_local_4.habboGroupId == 0));
            _local_3.doorMode = _local_4.doorMode;
            _local_3.arePetsAllowed = _local_4.allowPets;
            _local_3.roomModerationSettings = _local_2.roomModerationSettings;
            listener.events.dispatchEvent(new RoomSessionPropertyUpdateEvent("RSDUE_ALLOW_PETS", _local_3));
            listener.events.dispatchEvent(new RoomSessionEvent("RSE_ROOM_DATA", _local_3));
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_1082 = "_-51j" (String#11299, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)
// _SafeStr_843 = "_-W1I" (String#3535, DoABC#4)



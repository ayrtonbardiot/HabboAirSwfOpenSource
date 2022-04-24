// by nota

//com.sulake.habbo.session.handler.RoomChatHandler

package com.sulake.habbo.session.handler
{
    import _-Nk._SafeStr_180;
    import _-Nk._SafeStr_360;
    import _-Nk._SafeStr_445;
    import _-W1K._SafeStr_752;
    import _-W1K._SafeStr_146;
    import _-W1K._SafeStr_594;
    import _-Nk._SafeStr_863;
    import _-W1K._SafeStr_192;
    import _-Nk._SafeStr_1023;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1159;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session._SafeStr_3241;
    import _-NF._SafeStr_1272;

    public class RoomChatHandler extends BaseHandler 
    {

        public function RoomChatHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addMessageEvent(new _SafeStr_180(onRoomChat));
            _arg_1.addMessageEvent(new _SafeStr_360(onRoomWhisper));
            _arg_1.addMessageEvent(new _SafeStr_445(onRoomShout));
            _arg_1.addMessageEvent(new _SafeStr_752(onRespectNotification));
            _arg_1.addMessageEvent(new _SafeStr_146(onPetRespectNotification));
            _arg_1.addMessageEvent(new _SafeStr_594(onPetSupplementedNotification));
            _arg_1.addMessageEvent(new _SafeStr_863(onFloodControl));
            _arg_1.addMessageEvent(new _SafeStr_192(onHandItemNotification));
            _arg_1.addMessageEvent(new _SafeStr_1023(onRemainingMutePeriod));
        }

        private function onRoomChat(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_6:int;
            var _local_3:* = null;
            if (((listener) && (listener.events)))
            {
                _local_2 = (_arg_1 as _SafeStr_180);
                if (((_local_2) && (_local_2.getParser())))
                {
                    _local_4 = listener.getSession(_SafeStr_3937);
                    if (_local_4 == null)
                    {
                        return;
                    };
                    _local_5 = "RSCE_CHAT_EVENT";
                    _local_6 = 0;
                    _local_3 = _local_2.getParser();
                    if (_local_3.trackingId != -1)
                    {
                        _local_4.receivedChatWithTrackingId(_local_3.trackingId);
                    };
                    listener.events.dispatchEvent(new RoomSessionChatEvent(_local_5, _local_4, _local_3.userId, _local_3.text, _local_6, _local_3.styleId, _local_3.links));
                };
            };
        }

        private function onRespectNotification(_arg_1:IMessageEvent):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_7:int;
            var _local_3:* = null;
            var _local_6:* = null;
            var _local_2:_SafeStr_752 = (_arg_1 as _SafeStr_752);
            if (((listener) && (listener.events)))
            {
                _local_4 = listener.getSession(_SafeStr_3937);
                if (_local_4 == null)
                {
                    return;
                };
                _local_5 = "RSCE_CHAT_EVENT";
                _local_7 = 3;
                _local_3 = _local_4.userDataManager.getUserData(_local_2.userId);
                if (_local_3 == null)
                {
                    return;
                };
                _local_6 = "";
                listener.events.dispatchEvent(new RoomSessionChatEvent(_local_5, _local_4, _local_3.roomObjectId, _local_6, _local_7, 1));
            };
        }

        private function onPetRespectNotification(_arg_1:_SafeStr_146):void
        {
            if ((((_arg_1 == null) || (listener == null)) || (listener.events == null)))
            {
                return;
            };
            var _local_3:_SafeStr_1159 = _arg_1.getParser();
            if (_local_3 == null)
            {
                return;
            };
            var _local_4:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_4 == null)
            {
                return;
            };
            var _local_5:String = "RSCE_CHAT_EVENT";
            var _local_6:int = 4;
            if (_local_3.isTreat())
            {
                _local_6 = 6;
            };
            var _local_2:_SafeStr_3241 = _local_4.userDataManager.getPetUserData(_local_3.petData.id);
            if (_local_2 == null)
            {
                return;
            };
            listener.events.dispatchEvent(new RoomSessionChatEvent(_local_5, _local_4, _local_2.roomObjectId, "", _local_6, 1));
        }

        private function onPetSupplementedNotification(_arg_1:_SafeStr_594):void
        {
            if ((((_arg_1 == null) || (listener == null)) || (listener.events == null)))
            {
                return;
            };
            var _local_3:_SafeStr_1272 = _arg_1.getParser();
            if (_local_3 == null)
            {
                return;
            };
            var _local_4:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_4 == null)
            {
                return;
            };
            var _local_7:String = "RSCE_CHAT_EVENT";
            var _local_8:int = 7;
            switch (_local_3.supplementType)
            {
                case 2:
                    _local_8 = 7;
                    break;
                case 3:
                    _local_8 = 8;
                    break;
                case 4:
                    _local_8 = 9;
                default:
            };
            var _local_2:_SafeStr_3241 = _local_4.userDataManager.getPetUserData(_local_3.petId);
            if (_local_2 == null)
            {
                return;
            };
            var _local_6:int = -1;
            var _local_5:_SafeStr_3241 = _local_4.userDataManager.getUserData(_local_3.userId);
            if (_local_5 != null)
            {
                _local_6 = _local_5.roomObjectId;
            };
            listener.events.dispatchEvent(new RoomSessionChatEvent(_local_7, _local_4, _local_2.roomObjectId, "", _local_8, 1, null, _local_6));
        }

        private function onHandItemNotification(_arg_1:_SafeStr_192):void
        {
            var _local_2:* = null;
            if (((listener) && (listener.events)))
            {
                _local_2 = listener.getSession(_SafeStr_3937);
                if (_local_2)
                {
                    listener.events.dispatchEvent(new RoomSessionChatEvent("RSCE_CHAT_EVENT", _local_2, _arg_1.giverUserId, "", 5, 1, null, _arg_1.handItemType));
                };
            };
        }

        private function onRemainingMutePeriod(_arg_1:_SafeStr_1023):void
        {
            var _local_2:* = null;
            if (((listener) && (listener.events)))
            {
                _local_2 = listener.getSession(_SafeStr_3937);
                if (_local_2)
                {
                    listener.events.dispatchEvent(new RoomSessionChatEvent("RSCE_CHAT_EVENT", _local_2, _local_2.ownUserRoomId, "", 10, 1, null, _arg_1.secondsRemaining));
                };
            };
        }

        private function onRoomWhisper(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_6:int;
            var _local_3:* = null;
            if (((listener) && (listener.events)))
            {
                _local_2 = (_arg_1 as _SafeStr_360);
                if (((_local_2) && (_local_2.getParser())))
                {
                    _local_4 = listener.getSession(_SafeStr_3937);
                    if (_local_4 == null)
                    {
                        return;
                    };
                    _local_5 = "RSCE_CHAT_EVENT";
                    _local_6 = 1;
                    _local_3 = _local_2.getParser();
                    listener.events.dispatchEvent(new RoomSessionChatEvent(_local_5, _local_4, _local_3.userId, _local_3.text, _local_6, _local_3.styleId, _local_3.links));
                };
            };
        }

        private function onRoomShout(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_6:int;
            var _local_3:* = null;
            if (((listener) && (listener.events)))
            {
                _local_2 = (_arg_1 as _SafeStr_445);
                if (((_local_2) && (_local_2.getParser())))
                {
                    _local_4 = listener.getSession(_SafeStr_3937);
                    if (_local_4 == null)
                    {
                        return;
                    };
                    _local_5 = "RSCE_CHAT_EVENT";
                    _local_6 = 2;
                    _local_3 = _local_2.getParser();
                    listener.events.dispatchEvent(new RoomSessionChatEvent(_local_5, _local_4, _local_3.userId, _local_3.text, _local_6, _local_3.styleId, _local_3.links));
                };
            };
        }

        private function onFloodControl(_arg_1:IMessageEvent):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_2:int;
            if (((listener) && (listener.events)))
            {
                _local_3 = (_arg_1 as _SafeStr_863).getParser();
                _local_4 = listener.getSession(_SafeStr_3937);
                if (_local_4 == null)
                {
                    return;
                };
                _local_2 = _local_3.seconds;
                _SafeStr_14.log((("received flood control event for " + _local_2) + " seconds"));
                listener.events.dispatchEvent(new RoomSessionChatEvent("RSCE_FLOOD_EVENT", _local_4, -1, ("" + _local_2), 0, 0, null));
            };
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_1023 = "_-i12" (String#23326, DoABC#4)
// _SafeStr_1159 = "_-pS" (String#32221, DoABC#4)
// _SafeStr_1259 = "_-D1h" (String#12208, DoABC#4)
// _SafeStr_1272 = "_-11k" (String#35255, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1456 = "_-5G" (String#38578, DoABC#4)
// _SafeStr_146 = "_-CF" (String#23596, DoABC#4)
// _SafeStr_180 = "_-F16" (String#10084, DoABC#4)
// _SafeStr_192 = "_-i1I" (String#23240, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_360 = "_-hg" (String#9011, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)
// _SafeStr_445 = "_-C3" (String#9312, DoABC#4)
// _SafeStr_594 = "_-S1w" (String#27065, DoABC#4)
// _SafeStr_752 = "_-X1q" (String#9381, DoABC#4)
// _SafeStr_863 = "_-G1n" (String#28181, DoABC#4)



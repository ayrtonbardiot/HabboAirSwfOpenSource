// by nota

//com.sulake.habbo.session.handler.RoomSessionHandler

package com.sulake.habbo.session.handler
{
    import _-y1x._SafeStr_1035;
    import _-y1x._SafeStr_346;
    import _-y1x._SafeStr_844;
    import _-y1x._SafeStr_605;
    import _-Ja._SafeStr_972;
    import _-y1x._SafeStr_888;
    import _-y1x._SafeStr_536;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import _-l1n._SafeStr_1087;
    import _-l1n._SafeStr_1418;
    import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
    import _-l1n._SafeStr_1131;
    import com.sulake.core.utils.ErrorReportStorage;
    import _-31H._SafeStr_1438;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-l1n._SafeStr_1514;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.events.RoomSessionQueueEvent;
    import _-l1n._SafeStr_1367;

    public class RoomSessionHandler extends BaseHandler 
    {

        public static const _SafeStr_8920:String = "RS_CONNECTED";
        public static const _SafeStr_8921:String = "RS_READY";
        public static const _SafeStr_8922:String = "RS_DISCONNECTED";

        public function RoomSessionHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addMessageEvent(new _SafeStr_1035(onRoomConnected));
            _arg_1.addMessageEvent(new _SafeStr_346(onFlatAccessible));
            _arg_1.addMessageEvent(new _SafeStr_844(onRoomReady));
            _arg_1.addMessageEvent(new _SafeStr_605(onRoomDisconnected));
            _arg_1.addMessageEvent(new _SafeStr_972(onFlatAccessDenied));
            _arg_1.addMessageEvent(new _SafeStr_888(onRoomQueueStatus));
            _arg_1.addMessageEvent(new _SafeStr_536(onYouAreSpectator));
        }

        private function onRoomConnected(_arg_1:_SafeStr_1035):void
        {
            var _local_2:_SafeStr_1087 = _arg_1.getParser();
            if (_local_2 == null)
            {
                return;
            };
            if (listener)
            {
                listener.sessionUpdate(_local_2.flatId, "RS_CONNECTED");
            };
        }

        private function onFlatAccessible(_arg_1:_SafeStr_346):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_1418 = _arg_1.getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_4:String = _local_2.userName;
            if (((!(_local_4 == null)) && (_local_4.length > 0)))
            {
                if (((listener) && (listener.events)))
                {
                    _local_3 = listener.getSession(_local_2.flatId);
                    if (_local_3 != null)
                    {
                        listener.events.dispatchEvent(new RoomSessionDoorbellEvent("RSDE_ACCEPTED", _local_3, _local_4));
                    };
                };
            };
        }

        private function onRoomReady(_arg_1:_SafeStr_844):void
        {
            var _local_2:_SafeStr_1131 = _arg_1.getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:int = _local_2.roomId;
            ErrorReportStorage.addDebugData("RoomID", ("Room id: " + _local_3));
            if (listener)
            {
                listener.sessionReinitialize(_local_3, _local_3);
                listener.sessionUpdate(_local_3, "RS_READY");
            };
        }

        private function onFlatAccessDenied(_arg_1:_SafeStr_972):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_1438 = _arg_1.getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_4:String = _local_2.userName;
            if (((_local_4 == null) || (_local_4.length == 0)))
            {
                if (listener)
                {
                    listener.sessionUpdate(_local_2.flatId, "RS_DISCONNECTED");
                };
            }
            else
            {
                if (((listener) && (listener.events)))
                {
                    _local_3 = listener.getSession(_local_2.flatId);
                    if (_local_3 != null)
                    {
                        listener.events.dispatchEvent(new RoomSessionDoorbellEvent("RSDE_REJECTED", _local_3, _local_4));
                    };
                };
            };
        }

        private function onRoomDisconnected(_arg_1:IMessageEvent):void
        {
            var _local_2:int = _SafeStr_3937;
            ErrorReportStorage.addDebugData("RoomID", "");
            if (listener)
            {
                listener.sessionUpdate(_local_2, "RS_DISCONNECTED");
            };
        }

        private function onRoomQueueStatus(_arg_1:_SafeStr_888):void
        {
            var _local_5:* = null;
            var _local_6:* = null;
            var _local_2:* = null;
            if (((listener == null) || (listener.events == null)))
            {
                return;
            };
            var _local_3:_SafeStr_1514 = _arg_1.getParser();
            if (_local_3 == null)
            {
                return;
            };
            var _local_4:IRoomSession = listener.getSession(_local_3.flatId);
            if (_local_4 == null)
            {
                return;
            };
            var _local_8:Array = _local_3.getQueueSetTargets();
            var _local_9:int = _local_3.activeTarget;
            for each (var _local_10:int in _local_8)
            {
                _local_5 = _local_3.getQueueSet(_local_10);
                _local_6 = new RoomSessionQueueEvent(_local_4, _local_5.name, _local_5.target, (_local_5.target == _local_9));
                _local_2 = _local_5.queueTypes;
                for each (var _local_7:String in _local_2)
                {
                    _local_6.addQueue(_local_7, _local_5.getQueueSize(_local_7));
                };
                listener.events.dispatchEvent(_local_6);
            };
        }

        private function onYouAreSpectator(_arg_1:_SafeStr_536):void
        {
            if (listener == null)
            {
                return;
            };
            var _local_2:_SafeStr_1367 = _arg_1.getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_local_2.flatId);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.isSpectatorMode = true;
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_1035 = "_-9B" (String#10355, DoABC#4)
// _SafeStr_1087 = "_-c12" (String#37493, DoABC#4)
// _SafeStr_1131 = "_-k1c" (String#17697, DoABC#4)
// _SafeStr_1367 = "_-oC" (String#32163, DoABC#4)
// _SafeStr_1418 = "_-n19" (String#24362, DoABC#4)
// _SafeStr_1438 = "_-1v" (String#22414, DoABC#4)
// _SafeStr_1514 = "_-p1K" (String#39124, DoABC#4)
// _SafeStr_1528 = "_-220" (String#34261, DoABC#4)
// _SafeStr_346 = "_-Z6" (String#6604, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)
// _SafeStr_536 = "_-l18" (String#22990, DoABC#4)
// _SafeStr_605 = "_-zC" (String#4018, DoABC#4)
// _SafeStr_844 = "_-9H" (String#4703, DoABC#4)
// _SafeStr_888 = "_-er" (String#24318, DoABC#4)
// _SafeStr_8920 = "_-219" (String#33978, DoABC#4)
// _SafeStr_8921 = "_-A1r" (String#33961, DoABC#4)
// _SafeStr_8922 = "_-d" (String#40057, DoABC#4)
// _SafeStr_972 = "_-aI" (String#6424, DoABC#4)



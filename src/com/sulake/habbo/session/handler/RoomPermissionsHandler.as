// by nota

//com.sulake.habbo.session.handler.RoomPermissionsHandler

package com.sulake.habbo.session.handler
{
    import _-r1a._SafeStr_762;
    import _-r1a._SafeStr_662;
    import _-r1a._SafeStr_474;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import _-k1x._SafeStr_1170;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-k1x._SafeStr_1126;

    public class RoomPermissionsHandler extends BaseHandler 
    {

        public function RoomPermissionsHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addMessageEvent(new _SafeStr_762(onYouAreController));
            _arg_1.addMessageEvent(new _SafeStr_662(onYouAreNotController));
            _arg_1.addMessageEvent(new _SafeStr_474(onYouAreOwner));
        }

        private function onYouAreController(_arg_1:IMessageEvent):void
        {
            var _local_4:_SafeStr_762 = (_arg_1 as _SafeStr_762);
            if (_local_4 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1170 = _local_4.getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_local_2.flatId);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.roomControllerLevel = _local_2.roomControllerLevel;
        }

        private function onYouAreNotController(_arg_1:IMessageEvent):void
        {
            var _local_4:_SafeStr_662 = (_arg_1 as _SafeStr_662);
            if (_local_4 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1126 = _local_4.getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_local_2.flatId);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.roomControllerLevel = 0;
        }

        private function onYouAreOwner(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_474 = (_arg_1 as _SafeStr_474);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.isRoomOwner = true;
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_1126 = "_-eK" (String#31837, DoABC#4)
// _SafeStr_1170 = "_-Mm" (String#39395, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)
// _SafeStr_474 = "_-w1M" (String#9691, DoABC#4)
// _SafeStr_662 = "_-Ma" (String#18955, DoABC#4)
// _SafeStr_762 = "_-C1m" (String#18471, DoABC#4)



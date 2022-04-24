// by nota

//com.sulake.habbo.session.handler.GenericErrorHandler

package com.sulake.habbo.session.handler
{
    import _-yL._SafeStr_461;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import _-K1r._SafeStr_1282;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class GenericErrorHandler extends BaseHandler 
    {

        public function GenericErrorHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addMessageEvent(new _SafeStr_461(onGenericError));
        }

        private function onGenericError(_arg_1:IMessageEvent):void
        {
            var _local_4:* = null;
            var _local_2:_SafeStr_1282 = (_arg_1 as _SafeStr_461).getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            switch (_local_2.errorCode)
            {
                case 4008:
                    _local_4 = "RSEME_KICKED";
                    break;
                default:
                    return;
            };
            if (((listener) && (listener.events)))
            {
                listener.events.dispatchEvent(new RoomSessionErrorMessageEvent(_local_4, _local_3));
            };
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_1282 = "_-Q5" (String#31389, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)
// _SafeStr_461 = "_-Q17" (String#7013, DoABC#4)



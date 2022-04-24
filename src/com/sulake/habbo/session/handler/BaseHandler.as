// by nota

//com.sulake.habbo.session.handler.BaseHandler

package com.sulake.habbo.session.handler
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;

    public class BaseHandler implements _SafeStr_13 
    {

        private var _connection:IConnection;
        private var _SafeStr_3733:IRoomHandlerListener;
        private var _disposed:Boolean = false;
        public var _SafeStr_3937:int;

        public function BaseHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            _connection = _arg_1;
            _SafeStr_3733 = _arg_2;
        }

        public function dispose():void
        {
            _connection = null;
            _SafeStr_3733 = null;
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get connection():IConnection
        {
            return (_connection);
        }

        public function get listener():IRoomHandlerListener
        {
            return (_SafeStr_3733);
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3733 = "_-a1J" (String#2230, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)



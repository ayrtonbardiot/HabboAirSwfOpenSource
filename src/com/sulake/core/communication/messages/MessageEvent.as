// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.communication.messages.MessageEvent

package com.sulake.core.communication.messages
{
    import com.sulake.core.communication.connection.IConnection;

    public class MessageEvent implements IMessageEvent 
    {

        protected var _callback:Function;
        protected var _connection:IConnection;
        private var _SafeStr_8027:Class;
        protected var _SafeStr_7012:IMessageParser;

        public function MessageEvent(_arg_1:Function, _arg_2:Class)
        {
            _callback = _arg_1;
            _SafeStr_8027 = _arg_2;
        }

        public function dispose():void
        {
            _callback = null;
            _SafeStr_8027 = null;
            _connection = null;
            _SafeStr_7012 = null;
        }

        public function get callback():Function
        {
            return (_callback);
        }

        public function set connection(_arg_1:IConnection):void
        {
            _connection = _arg_1;
        }

        public function get connection():IConnection
        {
            return (_connection);
        }

        public function get parserClass():Class
        {
            return (_SafeStr_8027);
        }

        public function get parser():IMessageParser
        {
            return (_SafeStr_7012);
        }

        public function set parser(_arg_1:IMessageParser):void
        {
            _SafeStr_7012 = _arg_1;
        }


    }
}//package com.sulake.core.communication.messages

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_8027 = "_-916" (String#7155, DoABC#3)



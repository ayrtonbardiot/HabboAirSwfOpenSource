// by nota

//com.sulake.habbo.ui.handler._SafeStr_3374

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniConfirmWidget;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-X7._SafeStr_441;
    import _-X7._SafeStr_941;
    import _-X7._SafeStr_514;
    import _-6q._SafeStr_379;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;

    public class _SafeStr_3374 implements IRoomWidgetHandler 
    {

        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _SafeStr_4981:FriendFurniConfirmWidget;
        private var _connection:IConnection;
        private var _SafeStr_6367:IMessageEvent = null;
        private var _SafeStr_6368:IMessageEvent = null;
        private var _SafeStr_6369:IMessageEvent = null;


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
        }

        public function set widget(_arg_1:FriendFurniConfirmWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (((_connection) && (_SafeStr_6367)))
                {
                    _connection.removeMessageEvent(_SafeStr_6367);
                    _connection.removeMessageEvent(_SafeStr_6368);
                    _connection.removeMessageEvent(_SafeStr_6369);
                    _connection = null;
                };
                _SafeStr_4981 = null;
                _container = null;
                _disposed = true;
            };
        }

        public function set connection(_arg_1:IConnection):void
        {
            _connection = _arg_1;
            if (!_SafeStr_6367)
            {
                _SafeStr_6367 = new _SafeStr_441(onStartConfirmation);
                _SafeStr_6368 = new _SafeStr_941(onOtherLockConfirmed);
                _SafeStr_6369 = new _SafeStr_514(onCancelLock);
                _connection.addMessageEvent(_SafeStr_6367);
                _connection.addMessageEvent(_SafeStr_6368);
                _connection.addMessageEvent(_SafeStr_6369);
            };
        }

        public function sendLockConfirm(_arg_1:int, _arg_2:Boolean):void
        {
            _connection.send(new _SafeStr_379(_arg_1, _arg_2));
        }

        private function onStartConfirmation(_arg_1:_SafeStr_441):void
        {
            _SafeStr_4981.open(_arg_1.getParser().stuffId, _arg_1.getParser().isOwner);
        }

        private function onOtherLockConfirmed(_arg_1:_SafeStr_941):void
        {
            _SafeStr_4981.otherConfirmed(_arg_1.getParser().stuffId);
        }

        private function onCancelLock(_arg_1:_SafeStr_514):void
        {
            _SafeStr_4981.close(_arg_1.getParser().stuffId);
        }

        public function get type():String
        {
            return ("");
        }

        public function getProcessedEvents():Array
        {
            return (null);
        }

        public function processEvent(_arg_1:Event):void
        {
        }

        public function getWidgetMessages():Array
        {
            return ([]);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return (null);
        }

        public function update():void
        {
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_3374 = "_-n9" (String#8833, DoABC#4)
// _SafeStr_379 = "_-Rh" (String#29243, DoABC#4)
// _SafeStr_441 = "_-m8" (String#24390, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_514 = "_-R1j" (String#26470, DoABC#4)
// _SafeStr_6367 = "_-E1P" (String#11074, DoABC#4)
// _SafeStr_6368 = "_-U1T" (String#15377, DoABC#4)
// _SafeStr_6369 = "_-31T" (String#15317, DoABC#4)
// _SafeStr_941 = "_-T1n" (String#26075, DoABC#4)



// by nota

//com.sulake.habbo.ui.handler._SafeStr_3304

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.rentablespace.RentableSpaceDisplayWidget;
    import _-81g._SafeStr_763;
    import _-81g._SafeStr_563;
    import _-81g._SafeStr_586;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import flash.events.Event;
    import _-z1k._SafeStr_1357;
    import _-z1k._SafeStr_1310;
    import _-02a._SafeStr_599;
    import _-02a._SafeStr_209;
    import _-02a._SafeStr_267;

    public class _SafeStr_3304 implements IRoomWidgetHandler 
    {

        private var _container:IRoomWidgetHandlerContainer;
        private var _SafeStr_4981:RentableSpaceDisplayWidget;
        private var _SafeStr_5703:_SafeStr_763;
        private var _SafeStr_5704:_SafeStr_563;
        private var _SafeStr_5705:_SafeStr_586;


        public function get type():String
        {
            return ("RWE_RENTABLESPACE");
        }

        public function set widget(_arg_1:RentableSpaceDisplayWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
            _SafeStr_5703 = new _SafeStr_763(onRentableSpaceStatusMessage);
            _container.connection.addMessageEvent(_SafeStr_5703);
            _SafeStr_5704 = new _SafeStr_563(onRentableSpaceRentOkMessage);
            _container.connection.addMessageEvent(_SafeStr_5704);
            _SafeStr_5705 = new _SafeStr_586(onRentableSpaceRentFailedMessage);
            _container.connection.addMessageEvent(_SafeStr_5705);
        }

        public function getWidgetMessages():Array
        {
            return (null);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return (null);
        }

        public function getProcessedEvents():Array
        {
            return ([]);
        }

        public function processEvent(_arg_1:Event):void
        {
            if (_container.roomEngine == null)
            {
                return;
            };
            var _local_3:RoomEngineToWidgetEvent = (_arg_1 as RoomEngineToWidgetEvent);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:IRoomObject = _container.roomEngine.getRoomObject(_local_3.roomId, _local_3.objectId, _local_3.category);
            switch (_arg_1.type)
            {
                case "RETWE_OPEN_WIDGET":
                    if (_local_2 != null)
                    {
                        _SafeStr_4981.show(_local_2);
                    };
                    return;
                case "RETWE_CLOSE_WIDGET":
                    _SafeStr_4981.hide(_local_2);
                    return;
            };
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_5703 != null)
            {
                _container.connection.removeMessageEvent(_SafeStr_5703);
                _SafeStr_5703 = null;
            };
            if (_SafeStr_5704 != null)
            {
                _container.connection.removeMessageEvent(_SafeStr_5704);
                _SafeStr_5704 = null;
            };
            if (_SafeStr_5705 != null)
            {
                _container.connection.removeMessageEvent(_SafeStr_5705);
                _SafeStr_5705 = null;
            };
            _container = null;
        }

        public function get disposed():Boolean
        {
            return (_container == null);
        }

        public function onRentableSpaceRentOkMessage(_arg_1:_SafeStr_563):void
        {
            _SafeStr_4981.updateWidgetState();
        }

        public function onRentableSpaceRentFailedMessage(_arg_1:_SafeStr_586):void
        {
            var _local_2:_SafeStr_1357 = _arg_1.getParser();
            _SafeStr_4981.showErrorView(_local_2.reason);
        }

        public function onRentableSpaceStatusMessage(_arg_1:_SafeStr_763):void
        {
            var _local_2:_SafeStr_1310 = _arg_1.getParser();
            _SafeStr_4981.populateRentInfo(_local_2.rented, _local_2.canRent, _local_2.canRentErrorCode, _local_2.renterId, _local_2.renterName, _local_2.timeRemaining, _local_2.price);
        }

        public function getRentableSpaceStatus(_arg_1:int):void
        {
            _container.connection.send(new _SafeStr_599(_arg_1));
        }

        public function cancelRent(_arg_1:int):void
        {
            _container.connection.send(new _SafeStr_209(_arg_1));
        }

        public function rentSpace(_arg_1:int):void
        {
            _container.connection.send(new _SafeStr_267(_arg_1));
        }

        public function getUsersClubLevel():int
        {
            return (_container.sessionDataManager.clubLevel);
        }

        public function getUsersCreditAmount():int
        {
            return (_container.catalog.getPurse().credits);
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_1310 = "_-02b" (String#35266, DoABC#4)
// _SafeStr_1357 = "_-17" (String#39101, DoABC#4)
// _SafeStr_209 = "_-01Z" (String#28591, DoABC#4)
// _SafeStr_267 = "_-N12" (String#30660, DoABC#4)
// _SafeStr_3304 = "_-cO" (String#11463, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_563 = "_-c1j" (String#17152, DoABC#4)
// _SafeStr_5703 = "_-Dx" (String#9289, DoABC#4)
// _SafeStr_5704 = "_-o1g" (String#9903, DoABC#4)
// _SafeStr_5705 = "_-F1c" (String#10272, DoABC#4)
// _SafeStr_586 = "_-aN" (String#19057, DoABC#4)
// _SafeStr_599 = "_-hQ" (String#30830, DoABC#4)
// _SafeStr_763 = "_-b1o" (String#15847, DoABC#4)



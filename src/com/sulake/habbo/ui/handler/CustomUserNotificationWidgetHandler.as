// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler.CustomUserNotificationWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.requirementsmissing.CustomUserNotificationWidget;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-81g._SafeStr_270;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class CustomUserNotificationWidgetHandler implements IRoomWidgetHandler 
    {

        private var _container:IRoomWidgetHandlerContainer = null;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_4981:CustomUserNotificationWidget;
        private var _SafeStr_6294:IMessageEvent;


        public function get type():String
        {
            return ("RWE_CUSTOM_USER_NOTIFICATION");
        }

        public function set widget(_arg_1:CustomUserNotificationWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
            if (!_SafeStr_6294)
            {
                _SafeStr_6294 = new _SafeStr_270(onFurnitureUsageRequirementMissingMessage);
                _container.connection.addMessageEvent(_SafeStr_6294);
            };
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
        }

        public function getWidgetMessages():Array
        {
            return ([]);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return (null);
        }

        public function getProcessedEvents():Array
        {
            return (null);
        }

        public function processEvent(_arg_1:Event):void
        {
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            if (!disposed)
            {
                if (((_container.connection) && (_SafeStr_6294)))
                {
                    _container.connection.removeMessageEvent(_SafeStr_6294);
                };
                _SafeStr_6294 = null;
                _SafeStr_4981 = null;
                _container = null;
                _SafeStr_4036 = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function onFurnitureUsageRequirementMissingMessage(_arg_1:_SafeStr_270):void
        {
            var _local_2:int = _arg_1.getParser().code;
            if (_SafeStr_4981)
            {
                switch (_local_2)
                {
                    case 1:
                        _SafeStr_4981.open("costumehopper");
                        return;
                    case 2:
                        _SafeStr_4981.open("viphopper");
                        return;
                    case 3:
                        _SafeStr_4981.open("vipgate");
                        return;
                    case 4:
                        _SafeStr_4981.open("respectfailedstage");
                        return;
                    case 5:
                        _SafeStr_4981.open("respectfailedaudience");
                    default:
                };
            };
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_270 = "_-Mc" (String#13500, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6294 = "_-VY" (String#7953, DoABC#4)



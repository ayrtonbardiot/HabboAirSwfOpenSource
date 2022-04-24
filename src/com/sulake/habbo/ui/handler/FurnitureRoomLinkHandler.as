// by nota

//com.sulake.habbo.ui.handler.FurnitureRoomLinkHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import _-Ja._SafeStr_843;
    import _-31H._SafeStr_1082;
    import _-Ja._SafeStr_1569;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
    import _-M1k._SafeStr_525;
    import flash.events.Event;

    public class FurnitureRoomLinkHandler implements IRoomWidgetHandler 
    {

        private static const INTERNAL_LINK_KEY:String = "internalLink";

        private var _container:IRoomWidgetHandlerContainer;
        private var _confirmDialog:_SafeStr_3198;
        private var _communicationManagerMessageEvents:Vector.<IMessageEvent> = new Vector.<IMessageEvent>();
        private var _communicationManager:IHabboCommunicationManager;
        private var _SafeStr_6321:int = 0;
        private var _SafeStr_5272:String;


        public function get type():String
        {
            return ("RWE_ROOM_LINK");
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
        }

        public function set communicationManager(_arg_1:IHabboCommunicationManager):void
        {
            _communicationManager = _arg_1;
            _communicationManagerMessageEvents.push(_communicationManager.addHabboConnectionMessageEvent(new _SafeStr_843(onRoomInfo)));
        }

        private function onRoomInfo(_arg_1:IMessageEvent):void
        {
            var event = _arg_1;
            var p:_SafeStr_1082 = _SafeStr_843(event).getParser();
            var roomData:_SafeStr_1569 = p.data;
            if (((roomData) && (roomData.flatId == _SafeStr_6321)))
            {
                _SafeStr_6321 = 0;
                var message:String = "${room.link.confirmation.message}";
                var roomName:String = roomData.roomName;
                var ownerName:String = roomData.ownerName;
                message = _container.localization.getLocalization("room.link.confirmation.message");
                if (((!(message == null)) && (message.indexOf("%%room_name%%") > -1)))
                {
                    message = message.replace("%%room_name%%", roomName);
                };
                if (((!(message == null)) && (message.indexOf("%%room_owner%%") > -1)))
                {
                    message = message.replace("%%room_owner%%", ownerName);
                };
                _confirmDialog = _container.windowManager.confirm("${room.link.confirmation.title}", message, (0x10 | 0x20), function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
                {
                    if (((!(_container.roomEngine == null)) && (_arg_2.type == "WE_OK")))
                    {
                        if (((!(_SafeStr_5272 == null)) && (_SafeStr_5272.length > 0)))
                        {
                            (_container.roomEngine as Component).context.createLinkEvent(("navigator/goto/" + _SafeStr_5272));
                        };
                    };
                    _arg_1.dispose();
                });
            };
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
            return (["RETWE_REQUEST_ROOM_LINK"]);
        }

        public function processEvent(_arg_1:Event):void
        {
            var _local_5:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            switch (_arg_1.type)
            {
                case "RETWE_REQUEST_ROOM_LINK":
                    _local_5 = (_arg_1 as RoomEngineToWidgetEvent);
                    if (((!(_arg_1 == null)) && (!(_container.roomEngine == null))))
                    {
                        _local_2 = _container.roomEngine.getRoomObject(_local_5.roomId, _local_5.objectId, _local_5.category);
                        if (_local_2 != null)
                        {
                            _local_4 = _local_2.getModel();
                            _local_3 = _local_4.getStringToStringMap("furniture_data").getValue("internalLink");
                            if (((_local_3 == null) || (_local_3.length == 0)))
                            {
                                _local_3 = _local_4.getString("furniture_internal_link");
                            };
                            if (_local_3 == null) break;
                            if (((!(_container.navigator == null)) && (!(_container.localization == null))))
                            {
                                if (_confirmDialog != null)
                                {
                                    _confirmDialog.dispose();
                                    _confirmDialog = null;
                                };
                                _SafeStr_5272 = _local_3;
                                _SafeStr_6321 = parseInt(_local_3, 10);
                                _communicationManager.connection.send(new _SafeStr_525(_SafeStr_6321, false, false));
                            }
                            else
                            {
                                (_container.roomEngine as Component).context.createLinkEvent(("navigator/goto/" + _local_3));
                            };
                        };
                    };
                    return;
            };
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            if (_communicationManager)
            {
                for each (var _local_1:IMessageEvent in _communicationManagerMessageEvents)
                {
                    _communicationManager.removeHabboConnectionMessageEvent(_local_1);
                };
                _communicationManagerMessageEvents = null;
                _communicationManager = null;
            };
            if (_confirmDialog != null)
            {
                _confirmDialog.dispose();
                _confirmDialog = null;
            };
            _container = null;
        }

        public function get disposed():Boolean
        {
            return (_container == null);
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_1082 = "_-51j" (String#11299, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_525 = "_-c1I" (String#3620, DoABC#4)
// _SafeStr_5272 = "_-Bm" (String#2658, DoABC#4)
// _SafeStr_6321 = "_-mz" (String#10688, DoABC#4)
// _SafeStr_843 = "_-W1I" (String#3535, DoABC#4)



// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler._SafeStr_3305

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniEngravingWidget;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;

    public class _SafeStr_3305 implements IRoomWidgetHandler 
    {

        private var _SafeStr_4036:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _SafeStr_4981:FriendFurniEngravingWidget = null;


        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get type():String
        {
            return ("RWE_FRIEND_FURNI_ENGRAVING");
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
        }

        public function set widget(_arg_1:FriendFurniEngravingWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
            _container = null;
            _SafeStr_4981 = null;
        }

        public function getProcessedEvents():Array
        {
            return (["RETWE_REQUEST_FRIEND_FURNITURE_ENGRAVING"]);
        }

        public function processEvent(_arg_1:Event):void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_5:* = null;
            var _local_3:* = null;
            if (((disposed) || (_arg_1 == null)))
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "RETWE_REQUEST_FRIEND_FURNITURE_ENGRAVING":
                    _local_4 = RoomEngineObjectEvent(_arg_1);
                    _local_2 = _container.roomEngine.getRoomObject(_local_4.roomId, _local_4.objectId, _local_4.category);
                    if (_local_2 != null)
                    {
                        _local_5 = _local_2.getModel();
                        if (_local_5 != null)
                        {
                            _local_3 = new StringArrayStuffData();
                            _local_3.initializeFromRoomObjectModel(_local_5);
                            _SafeStr_4981.open(_local_2.getId(), _local_5.getNumber("furniture_friendfurni_engraving_type"), _local_3);
                        };
                    };
                    return;
            };
        }

        public function update():void
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


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_3305 = "_-pV" (String#10325, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)



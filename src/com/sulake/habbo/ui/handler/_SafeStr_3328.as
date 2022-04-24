// by nota

//com.sulake.habbo.ui.handler._SafeStr_3328

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.CustomStackHeightWidget;
    import _-81g._SafeStr_670;
    import _-z1k._SafeStr_1246;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
    import flash.events.Event;
    import com.sulake.room.object.IRoomObject;

    public class _SafeStr_3328 implements IRoomWidgetHandler 
    {

        private var _container:IRoomWidgetHandlerContainer;
        private var _SafeStr_4981:CustomStackHeightWidget;
        private var _SafeStr_5936:int = -1;


        public function set widget(_arg_1:CustomStackHeightWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        public function get type():String
        {
            return ("RWE_CUSTOM_STACK_HEIGHT");
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
            _container.connection.addMessageEvent(new _SafeStr_670(onStackHeightUpdate));
        }

        private function onStackHeightUpdate(_arg_1:_SafeStr_670):void
        {
            var _local_2:_SafeStr_1246 = _arg_1.getParser();
            if (((_SafeStr_4981) && (validateRights())))
            {
                _SafeStr_4981.updateHeight(_local_2.furniId, _local_2.height);
            };
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
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
            var _local_3:* = null;
            var _local_2:* = null;
            switch (_arg_1.type)
            {
                case "RETWE_OPEN_WIDGET":
                    _local_3 = (_arg_1 as RoomEngineToWidgetEvent);
                    if (((!(_arg_1 == null)) && (!(_container.roomEngine == null))))
                    {
                        _SafeStr_5936 = _local_3.objectId;
                        _local_2 = _container.roomEngine.getRoomObject(_local_3.roomId, _local_3.objectId, _local_3.category);
                        if (((_local_2) && (validateRights(_local_2))))
                        {
                            if (_SafeStr_4981)
                            {
                                _SafeStr_4981.open(_SafeStr_5936, _local_2.getLocation().z);
                            };
                        };
                    };
                    return;
                case "RETWE_CLOSE_WIDGET":
                    _local_3 = (_arg_1 as RoomEngineToWidgetEvent);
                    if ((((!(_arg_1 == null)) && (!(_container.roomEngine == null))) && (!(_SafeStr_4981 == null))))
                    {
                        if (_SafeStr_5936 == _local_3.objectId)
                        {
                            _SafeStr_4981.hide();
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
            _container = null;
            _SafeStr_4981 = null;
        }

        public function get disposed():Boolean
        {
            return (_container == null);
        }

        private function validateRights(_arg_1:IRoomObject=null):Boolean
        {
            var _local_2:Boolean = _container.roomSession.isRoomOwner;
            var _local_3:* = (_container.roomSession.roomControllerLevel >= 1);
            var _local_4:Boolean = _container.sessionDataManager.isAnyRoomController;
            var _local_5:Boolean = ((_arg_1) && (_container.isOwnerOfFurniture(_arg_1)));
            return ((((_local_2) || (_local_4)) || (_local_3)) || (_local_5));
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_1246 = "_-uA" (String#34404, DoABC#4)
// _SafeStr_3328 = "_-Hk" (String#9140, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5936 = "_-g8" (String#14295, DoABC#4)
// _SafeStr_670 = "_-Ia" (String#23495, DoABC#4)



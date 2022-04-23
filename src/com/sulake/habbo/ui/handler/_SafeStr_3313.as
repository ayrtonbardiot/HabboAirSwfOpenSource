// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler._SafeStr_3313

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.highscore.HighScoreDisplayWidget;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.room.object.data._SafeStr_1671;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;

    public class _SafeStr_3313 implements IRoomWidgetHandler 
    {

        private var _SafeStr_4036:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _SafeStr_4981:HighScoreDisplayWidget = null;
        private var _SafeStr_5757:RoomEngineObjectEvent = null;


        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get type():String
        {
            return ("RWE_HIGH_SCORE_DISPLAY");
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
        }

        public function set widget(_arg_1:HighScoreDisplayWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
            _container.addUpdateListener(this);
        }

        public function dispose():void
        {
            if (_container)
            {
                _container.removeUpdateListener(this);
            };
            _SafeStr_4036 = true;
            _container = null;
            _SafeStr_4981 = null;
        }

        public function getProcessedEvents():Array
        {
            return (["RETWE_REQUEST_HIGH_SCORE_DISPLAY", "RETWE_REQUEST_HIDE_HIGH_SCORE_DISPLAY"]);
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
                case "RETWE_REQUEST_HIGH_SCORE_DISPLAY":
                    _local_4 = RoomEngineObjectEvent(_arg_1);
                    _local_2 = _container.roomEngine.getRoomObject(_local_4.roomId, _local_4.objectId, _local_4.category);
                    if (_local_2 != null)
                    {
                        _local_5 = _local_2.getModel();
                        if (_local_5 != null)
                        {
                            _local_3 = new _SafeStr_1671();
                            _local_3.initializeFromRoomObjectModel(_local_5);
                            _SafeStr_4981.open(_local_4.objectId, _local_4.roomId, _local_3);
                        };
                        _SafeStr_5757 = _local_4;
                    };
                    return;
                case "RETWE_REQUEST_HIDE_HIGH_SCORE_DISPLAY":
                    _local_4 = RoomEngineObjectEvent(_arg_1);
                    if (((_local_4.roomId == _SafeStr_4981.roomId) && (_local_4.objectId == _SafeStr_4981.roomObjId)))
                    {
                        _SafeStr_4981.close();
                    };
                    return;
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

        public function update():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            if (((((_SafeStr_5757) && (_SafeStr_4981.isOpen)) && (_SafeStr_4981.roomId == _SafeStr_5757.roomId)) && (_SafeStr_4981.roomObjId == _SafeStr_5757.objectId)))
            {
                _local_1 = _container.roomEngine.getRoomObject(_SafeStr_5757.roomId, _SafeStr_5757.objectId, _SafeStr_5757.category);
                if (_local_1 != null)
                {
                    _local_2 = _container.roomEngine.getRoomObjectScreenLocation(_SafeStr_5757.roomId, _SafeStr_5757.objectId, _SafeStr_5757.category);
                    if (_local_2 != null)
                    {
                        _SafeStr_4981.setRelativePositionToRoomObjectAt(_local_2.x, _local_2.y);
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_1671 = "_-D1S" (String#18983, DoABC#4)
// _SafeStr_3313 = "_-RQ" (String#7768, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5757 = "_-J1i" (String#6220, DoABC#4)



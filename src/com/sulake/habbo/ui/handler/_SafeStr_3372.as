﻿// by nota

//com.sulake.habbo.ui.handler._SafeStr_3372

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.video.VimeoDisplayWidget;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import flash.events.Event;
    import com.sulake.core.utils._SafeStr_24;
    import _-j1G._SafeStr_624;

    public class _SafeStr_3372 implements IRoomWidgetHandler 
    {

        private static const VIDEO_ID_KEY:String = "videoId";

        private var _container:IRoomWidgetHandlerContainer;
        private var _SafeStr_4981:VimeoDisplayWidget;


        public function get type():String
        {
            return ("RWE_VIMEO");
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
        }

        public function set widget(_arg_1:VimeoDisplayWidget):void
        {
            _SafeStr_4981 = _arg_1;
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
            var _local_5:Boolean;
            var _local_2:* = null;
            if (_container.roomEngine == null)
            {
                return;
            };
            var _local_4:RoomEngineToWidgetEvent = (_arg_1 as RoomEngineToWidgetEvent);
            if (_local_4 == null)
            {
                return;
            };
            var _local_3:IRoomObject = _container.roomEngine.getRoomObject(_local_4.roomId, _local_4.objectId, _local_4.category);
            switch (_arg_1.type)
            {
                case "RETWE_OPEN_WIDGET":
                    if (_local_3 != null)
                    {
                        _local_5 = _container.sessionDataManager.hasSecurity(5);
                        _local_2 = _local_3.getModel().getStringToStringMap("furniture_data").getValue("videoId");
                        _SafeStr_4981.show(_local_3, _local_5, _local_2);
                    };
                    return;
                case "RETWE_CLOSE_WIDGET":
                    _SafeStr_4981.hide(_local_3);
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
            _container = null;
        }

        public function get disposed():Boolean
        {
            return (_container == null);
        }

        public function setVideo(_arg_1:IRoomObject, _arg_2:int):void
        {
            var _local_3:_SafeStr_24 = new _SafeStr_24();
            _local_3.add("videoId", _arg_2.toString());
            _container.connection.send(new _SafeStr_624(_arg_1.getId(), _local_3));
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3372 = "_-yN" (String#10916, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_624 = "_-I1v" (String#13654, DoABC#4)



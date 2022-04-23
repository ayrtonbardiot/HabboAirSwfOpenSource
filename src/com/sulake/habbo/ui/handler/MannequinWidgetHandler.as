﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler.MannequinWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.widget.furniture.mannequin.MannequinWidget;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import flash.events.Event;

    public class MannequinWidgetHandler implements IRoomWidgetHandler 
    {

        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_4981:MannequinWidget;
        private var _container:IRoomWidgetHandlerContainer;


        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function dispose():void
        {
            if (!_SafeStr_4036)
            {
                container = null;
                _SafeStr_4036 = true;
            };
        }

        public function get type():String
        {
            return ("RWE_MANNEQUIN");
        }

        public function set widget(_arg_1:MannequinWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
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
            var _local_1:Array = [];
            _local_1.push("RETWE_REQUEST_MANNEQUIN");
            return (_local_1);
        }

        public function processEvent(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_7:* = null;
            switch (_arg_1.type)
            {
                case "RETWE_REQUEST_MANNEQUIN":
                    _local_2 = (_arg_1 as RoomEngineObjectEvent);
                    _local_3 = _container.roomEngine.getRoomObject(_local_2.roomId, _local_2.objectId, _local_2.category);
                    _local_5 = _local_3.getModel();
                    _local_4 = _local_5.getString("furniture_mannequin_figure");
                    _local_6 = _local_5.getString("furniture_mannequin_gender");
                    _local_7 = _local_5.getString("furniture_mannequin_name");
                    if (((!(_local_4 == null)) && (!(_local_6 == null))))
                    {
                        _SafeStr_4981.open(_local_3.getId(), _local_4, _local_6, _local_7);
                    };
                    return;
            };
        }

        public function update():void
        {
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)



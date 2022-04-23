﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler.UserChooserWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.ui.widget.events.ChooserItem;
    import com.sulake.habbo.ui.widget.events.RoomWidgetChooserContentEvent;
    import flash.events.Event;

    public class UserChooserWidgetHandler implements IRoomWidgetHandler 
    {

        private var _container:IRoomWidgetHandlerContainer = null;
        private var _SafeStr_4036:Boolean = false;


        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get type():String
        {
            return ("RWE_USER_CHOOSER");
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
            _container = null;
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
        }

        public function getWidgetMessages():Array
        {
            var _local_1:Array = [];
            _local_1.push("RWRWM_USER_CHOOSER");
            _local_1.push("RWROM_SELECT_OBJECT");
            return (_local_1);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:* = null;
            if (_arg_1 == null)
            {
                return (null);
            };
            switch (_arg_1.type)
            {
                case "RWRWM_USER_CHOOSER":
                    handleUserChooserRequest();
                    break;
                case "RWROM_SELECT_OBJECT":
                    _local_2 = (_arg_1 as RoomWidgetRoomObjectMessage);
                    if (_local_2 == null)
                    {
                        return (null);
                    };
                    if (_local_2.category == 100)
                    {
                        _container.roomEngine.selectRoomObject(_container.roomSession.roomId, _local_2.id, _local_2.category);
                    };
            };
            return (null);
        }

        private function compareItems(_arg_1:ChooserItem, _arg_2:ChooserItem):int
        {
            if ((((((_arg_1 == null) || (_arg_2 == null)) || (_arg_1.name == _arg_2.name)) || (_arg_1.name.length == 0)) || (_arg_2.name.length == 0)))
            {
                return (1);
            };
            var _local_3:Array = new Array(_arg_1.name.toUpperCase(), _arg_2.name.toUpperCase()).sort();
            if (_local_3.indexOf(_arg_1.name.toUpperCase()) == 0)
            {
                return (-1);
            };
            return (1);
        }

        private function handleUserChooserRequest():void
        {
            var _local_2:* = null;
            var _local_4:int;
            var _local_1:* = null;
            if ((((_container == null) || (_container.roomSession == null)) || (_container.roomEngine == null)))
            {
                return;
            };
            if (_container.roomSession.userDataManager == null)
            {
                return;
            };
            var _local_6:int = _container.roomSession.roomId;
            var _local_5:Array = [];
            var _local_3:int = _container.roomEngine.getRoomObjectCount(_local_6, 100);
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = _container.roomEngine.getRoomObjectWithIndex(_local_6, _local_4, 100);
                _local_1 = _container.roomSession.userDataManager.getUserDataByIndex(_local_2.getId());
                if (_local_1 != null)
                {
                    _local_5.push(new ChooserItem(_local_1.roomObjectId, 100, _local_1.name));
                };
                _local_4++;
            };
            _local_5.sort(compareItems);
            _container.events.dispatchEvent(new RoomWidgetChooserContentEvent("RWCCE_USER_CHOOSER_CONTENT", _local_5));
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


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)



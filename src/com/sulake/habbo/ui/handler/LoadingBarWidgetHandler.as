﻿// by nota

//com.sulake.habbo.ui.handler.LoadingBarWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class LoadingBarWidgetHandler implements IRoomWidgetHandler 
    {

        private var _SafeStr_4036:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get type():String
        {
            return ("RWE_LOADINGBAR");
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
            _container = null;
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
            var _local_1:Array = [];
            _local_1.push("RWLBUE_SHOW_LOADING_BAR");
            _local_1.push("RWLBUW_HIDE_LOADING_BAR");
            return (_local_1);
        }

        public function processEvent(_arg_1:Event):void
        {
            if (((_container == null) || (_container.events == null)))
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "RWLBUE_SHOW_LOADING_BAR":
                    _container.events.dispatchEvent(_arg_1);
                    return;
                case "RWLBUW_HIDE_LOADING_BAR":
                    _container.events.dispatchEvent(_arg_1);
                    return;
            };
        }

        public function update():void
        {
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)



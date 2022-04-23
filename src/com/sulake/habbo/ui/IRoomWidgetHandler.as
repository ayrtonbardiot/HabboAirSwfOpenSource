// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.IRoomWidgetHandler

package com.sulake.habbo.ui
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public /*dynamic*/ interface IRoomWidgetHandler extends _SafeStr_13 
    {

        function get type():String;
        function set container(_arg_1:IRoomWidgetHandlerContainer):void;
        function getWidgetMessages():Array;
        function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent;
        function getProcessedEvents():Array;
        function processEvent(_arg_1:Event):void;
        function update():void;

    }
}//package com.sulake.habbo.ui

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)



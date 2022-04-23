// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.IRoomWidgetMessageListener

package com.sulake.habbo.ui.widget
{
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;

    public /*dynamic*/ interface IRoomWidgetMessageListener 
    {

        function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent;

    }
}//package com.sulake.habbo.ui.widget


﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler._SafeStr_3316

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.habbo.ui.widget.events.RoomWidgetAchievementResolutionTrophyDataUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class _SafeStr_3316 implements IRoomWidgetHandler 
    {

        private var _SafeStr_4036:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get type():String
        {
            return ("RWE_FURNI_ACHIEVEMENT_RESOLUTION_ENGRAVING");
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
            return (["RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING", "RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED", "RWFWM_WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING"]);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_12:* = null;
            var _local_6:* = null;
            var _local_7:* = null;
            var _local_3:* = null;
            var _local_11:* = null;
            var _local_2:* = null;
            var _local_8:* = null;
            var _local_9:* = null;
            var _local_10:* = null;
            if (((disposed) || (_arg_1 == null)))
            {
                return (null);
            };
            switch (_arg_1.type)
            {
                case "RWFWM_WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING":
                case "RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING":
                    _local_5 = (_arg_1 as RoomWidgetFurniToWidgetMessage);
                    _local_4 = _container.roomEngine.getRoomObject(_local_5.roomId, _local_5.id, _local_5.category);
                    if (_local_4 != null)
                    {
                        _local_12 = _local_4.getModel();
                        if (_local_12 != null)
                        {
                            _local_6 = new StringArrayStuffData();
                            _local_6.initializeFromRoomObjectModel(_local_12);
                            _local_7 = _container.localization.getBadgeName(_local_6.getValue(1));
                            _local_3 = ("\r\n" + _container.localization.getBadgeDesc(_local_6.getValue(1)));
                            _local_11 = _local_6.getValue(2);
                            _local_2 = _local_6.getValue(3);
                            _local_8 = ((_arg_1.type == "RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING") ? "resolution.engraving.text" : "badge.display.engraving.text");
                            _local_9 = _container.localization.getLocalizationWithParams(_local_8, "%badgename%", "badgename", _local_7, "badgedesc", _local_3);
                            if (_local_9 == null)
                            {
                                _local_9 = _local_7;
                            };
                            _local_10 = new RoomWidgetAchievementResolutionTrophyDataUpdateEvent("RWARTDUE_TROPHY_DATA", 0, _local_11, _local_2, _local_9, 0);
                            _container.events.dispatchEvent(_local_10);
                        };
                    };
                    break;
                case "RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED":
                    _container.windowManager.simpleAlert("${resolution.failed.title}", "${resolution.failed.subtitle}", "${resolution.failed.text}", null, null, null, "help_error_state");
            };
            return (null);
        }

        public function getProcessedEvents():Array
        {
            return ([]);
        }

        public function processEvent(_arg_1:Event):void
        {
        }

        public function update():void
        {
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_3316 = "_-61H" (String#14285, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)



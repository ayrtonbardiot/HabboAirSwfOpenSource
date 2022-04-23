// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.inroom.RoomEventInfoCtrl

package com.sulake.habbo.navigator.inroom
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.navigator._SafeStr_1697;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.session.IRoomSession;
    import _-Ja._SafeStr_1574;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class RoomEventInfoCtrl implements _SafeStr_13 
    {

        private static const TOOLBAR_EXTENSION_ID:String = "room_event_info";

        private var _navigator:_SafeStr_1697;
        private var _window:_SafeStr_3133;
        private var _expanded:Boolean = true;

        public function RoomEventInfoCtrl(_arg_1:_SafeStr_1697)
        {
            _navigator = _arg_1;
        }

        private function get enabled():Boolean
        {
            var _local_1:Boolean = ((_navigator.getInteger("new.identity", 0) == 0) || (!(_navigator.getBoolean("new.identity.hide.ui"))));
            return ((_navigator.getBoolean("eventinfo.enabled")) && (_local_1));
        }

        public function dispose():void
        {
            if (_navigator)
            {
                _navigator.toolbar.extensionView.detachExtension("room_event_info");
            };
            _navigator = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_navigator == null);
        }

        public function refresh():void
        {
            if ((((_navigator.toolbar == null) || (_navigator.toolbar.extensionView == null)) || (!(enabled))))
            {
                return;
            };
            var _local_5:* = (!(_navigator.data.roomEventData == null));
            var _local_8:Boolean = ((_navigator.data.currentRoomOwner) || (_navigator.data.eventMod));
            var _local_10:int = _navigator.data.currentRoomId;
            var _local_11:IRoomSession = _navigator.roomSessionManager.getSession(_local_10);
            if (!_local_11)
            {
                return;
            };
            if (_local_11.roomControllerLevel == 1)
            {
                _local_8 = true;
            };
            var _local_2:Boolean = _navigator.data.currentRoomOwner;
            if ((((!(_local_5)) && (!(_local_2))) && (!(_local_8))))
            {
                _navigator.toolbar.extensionView.detachExtension("room_event_info");
                return;
            };
            prepareWindow();
            var _local_7:Boolean = (((_expanded) && (_local_5)) && (_local_2));
            _window.findChildByName("event_bg_owner").visible = _local_7;
            var _local_1:Boolean = (((_expanded) && (_local_5)) && (!(_local_2)));
            _window.findChildByName("event_bg_visitor").visible = _local_1;
            var _local_3:Boolean = ((!(_expanded)) || (!(_local_5)));
            _window.findChildByName("event_bg_contracted").visible = _local_3;
            var _local_4:Boolean = (((_expanded) && (_local_5)) && (_local_8));
            _window.findChildByName("modify_link_region").visible = _local_4;
            _window.findChildByName("extend_event_region").visible = ((_local_4) && (canExtend()));
            var _local_12:Boolean = ((!(_local_5)) && (_local_8));
            _window.findChildByName("get_event").visible = _local_12;
            _window.findChildByName("create_link").visible = false;
            var _local_6:Boolean = (((_expanded) && (_local_5)) && (!(_local_8)));
            _window.findChildByName("in_progress_txt").visible = _local_6;
            var _local_9:Boolean = ((_expanded) && (_local_5));
            _window.findChildByName("desc_txt").visible = _local_9;
            _window.findChildByName("header_txt").visible = _local_5;
            _window.visible = (((_local_5) && ((((((_local_7) || (_local_1)) || (_local_3)) || (_local_4)) || (_local_6)) || (_local_9))) || (_local_12));
            if (_local_5)
            {
                _window.findChildByName("header_txt").caption = _navigator.data.roomEventData.eventName;
                _window.findChildByName("desc_txt").caption = _navigator.data.roomEventData.eventDescription;
            };
            _navigator.toolbar.extensionView.attachExtension("room_event_info", _window, -1, ["next_quest_timer", "quest_tracker"]);
            _window.x = 0;
            _window.y = 0;
            _window.height = (((_expanded) && (_local_5)) ? _window.findChildByName("event_bg_visitor").height : _window.findChildByName("event_bg_contracted").height);
        }

        private function canExtend():Boolean
        {
            var _local_2:_SafeStr_1574 = _navigator.data.roomEventData;
            if (_local_2 == null)
            {
                return (false);
            };
            if (!_navigator.getBoolean("roomad.limit_total_time"))
            {
                return (true);
            };
            var _local_5:Date = new Date();
            var _local_1:Number = _local_5.getTime();
            var _local_6:Date = _local_2.expirationDate;
            var _local_3:int = _navigator.getInteger("room_ad.duration.minutes", 120);
            var _local_4:int = _navigator.getInteger("room_ad.maximum_total_time.minutes", 10080);
            return ((_local_6.getTime() + ((_local_3 * 60) * 1000)) < (_local_1 + ((_local_4 * 60) * 1000)));
        }

        private function onGetEventClick(_arg_1:_SafeStr_3116):void
        {
            if (_navigator.data.roomEventData != null)
            {
                _expanded = (!(_expanded));
                refresh();
            }
            else
            {
                _navigator.openCatalogRoomAdsPage();
            };
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            };
            _window = _SafeStr_3133(_navigator.getXmlWindow("iro_event_info"));
            _window.findChildByName("modify_link_region").procedure = onModify;
            _window.findChildByName("extend_event_region").procedure = onExtend;
            _window.findChildByName("bg_region").addEventListener("WME_CLICK", onGetEventClick);
        }

        public function close():void
        {
            if (((!(_window == null)) && (_window.visible)))
            {
                _window.visible = false;
                _navigator.toolbar.extensionView.detachExtension("room_event_info");
            };
        }

        private function onModify(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _navigator.roomEventViewCtrl.show();
            };
        }

        private function onExtend(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = _navigator.data.roomEventData;
                _navigator.openCatalogRoomAdsExtendPage(_local_3.eventName, _local_3.eventDescription, _local_3.expirationDate, _local_3.categoryId);
            };
        }

        public function set expanded(_arg_1:Boolean):void
        {
            _expanded = _arg_1;
        }


    }
}//package com.sulake.habbo.navigator.inroom

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1574 = "_-e1X" (String#10654, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)



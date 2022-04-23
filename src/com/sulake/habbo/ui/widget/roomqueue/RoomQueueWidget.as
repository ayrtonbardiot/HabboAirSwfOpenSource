// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.roomqueue.RoomQueueWidget

package com.sulake.habbo.ui.widget.roomqueue
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomQueueUpdateEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomQueueMessage;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class RoomQueueWidget extends RoomWidgetBase 
    {

        private var _window:_SafeStr_3263;
        private var _config:_SafeStr_19;
        private var _queuePosition:int;
        private var _SafeStr_4059:Boolean;
        private var _SafeStr_4056:String;
        private var _SafeStr_4058:Boolean;
        private var _SafeStr_4057:Boolean;

        public function RoomQueueWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18, _arg_5:_SafeStr_19)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _config = _arg_5;
        }

        override public function dispose():void
        {
            removeWindow();
            _config = null;
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWRQUE_VISITOR_QUEUE_STATUS", onQueueStatus);
            _arg_1.addEventListener("RWRQUE_SPECTATOR_QUEUE_STATUS", onQueueStatus);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWRQUE_VISITOR_QUEUE_STATUS", onQueueStatus);
            _arg_1.removeEventListener("RWRQUE_SPECTATOR_QUEUE_STATUS", onQueueStatus);
        }

        private function removeWindow():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function onQueueStatus(_arg_1:RoomWidgetRoomQueueUpdateEvent):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            if (_arg_1.isActive)
            {
                _SafeStr_4056 = _arg_1.type;
                _SafeStr_4058 = false;
                _queuePosition = _arg_1.position;
            }
            else
            {
                _SafeStr_4058 = true;
            };
            _SafeStr_4059 = _arg_1.hasHabboClub;
            _SafeStr_4057 = _arg_1.isClubQueue;
            localizations.registerParameter("room.queue.position", "position", _queuePosition.toString());
            localizations.registerParameter("room.queue.position.hc", "position", _queuePosition.toString());
            localizations.registerParameter("room.queue.spectator.position", "position", _queuePosition.toString());
            localizations.registerParameter("room.queue.spectator.position.hc", "position", _queuePosition.toString());
            showInterface();
        }

        private function createWindow():Boolean
        {
            if (_window != null)
            {
                return (true);
            };
            var _local_2:XmlAsset = (assets.getAssetByName("room_queue") as XmlAsset);
            _window = (windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3263);
            if (_window == null)
            {
                return (false);
            };
            _window.visible = false;
            var _local_1:_SafeStr_3109 = _window.findChildByTag("close");
            if (_local_1 != null)
            {
                _local_1.addEventListener("WME_CLICK", exitQueue);
            };
            _local_1 = _window.findChildByName("cancel_button");
            if (_local_1 != null)
            {
                _local_1.addEventListener("WME_CLICK", exitQueue);
            };
            _local_1 = _window.findChildByName("link_text");
            if (_local_1 != null)
            {
                _local_1.addEventListener("WME_CLICK", openLink);
            };
            _local_1 = _window.findChildByName("change_button");
            if (_local_1 != null)
            {
                _local_1.addEventListener("WME_CLICK", changeQueue);
            };
            _window.center();
            return (true);
        }

        private function showInterface():void
        {
            if (!createWindow())
            {
                return;
            };
            var _local_3:ITextWindow = (_window.findChildByName("info_text") as ITextWindow);
            var _local_4:_SafeStr_3122 = (_window.findChildByName("change_button") as _SafeStr_3122);
            var _local_2:_SafeStr_3109 = _window.findChildByName("spectator_info");
            if ((((!(_local_3 == null)) && (!(_local_4 == null))) && (!(_local_2 == null))))
            {
                switch (_SafeStr_4056)
                {
                    case "RWRQUE_VISITOR_QUEUE_STATUS":
                        _local_3.caption = ((_SafeStr_4057) ? "${room.queue.position.hc}" : "${room.queue.position}");
                        _local_4.caption = "${room.queue.spectatormode}";
                        _local_2.visible = _SafeStr_4058;
                        break;
                    case "RWRQUE_SPECTATOR_QUEUE_STATUS":
                        _local_3.caption = ((_SafeStr_4057) ? "${room.queue.spectator.position.hc}" : "${room.queue.spectator.position}");
                        _local_4.caption = "${room.queue.back}";
                        _local_2.visible = false;
                };
                _local_4.visible = _SafeStr_4058;
            };
            var _local_1:_SafeStr_3133 = (_window.findChildByName("club_container") as _SafeStr_3133);
            if (_local_1 != null)
            {
                _local_1.visible = (!(_SafeStr_4059));
            };
            _window.visible = true;
        }

        private function exitQueue(_arg_1:WindowMouseEvent):void
        {
            if (messageListener == null)
            {
                return;
            };
            var _local_2:RoomWidgetRoomQueueMessage = new RoomWidgetRoomQueueMessage("RWRQM_EXIT_QUEUE");
            messageListener.processWidgetMessage(_local_2);
            removeWindow();
        }

        private function openLink(_arg_1:WindowMouseEvent):void
        {
            messageListener.processWidgetMessage(new RoomWidgetRoomQueueMessage("RWRQM_CLUB_LINK"));
        }

        private function changeQueue(_arg_1:WindowMouseEvent):void
        {
            var _local_2:* = null;
            if (messageListener == null)
            {
                return;
            };
            if (_SafeStr_4056 == "RWRQUE_VISITOR_QUEUE_STATUS")
            {
                _local_2 = new RoomWidgetRoomQueueMessage("RWRQM_CHANGE_TO_SPECTATOR_QUEUE");
            }
            else
            {
                _local_2 = new RoomWidgetRoomQueueMessage("RWRQM_CHANGE_TO_VISITOR_QUEUE");
            };
            messageListener.processWidgetMessage(_local_2);
            removeWindow();
        }


    }
}//package com.sulake.habbo.ui.widget.roomqueue

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4056 = "_-W5" (String#15455, DoABC#4)
// _SafeStr_4057 = "_-Y1f" (String#8287, DoABC#4)
// _SafeStr_4058 = "_-FQ" (String#11438, DoABC#4)
// _SafeStr_4059 = "_-81" (String#22157, DoABC#4)



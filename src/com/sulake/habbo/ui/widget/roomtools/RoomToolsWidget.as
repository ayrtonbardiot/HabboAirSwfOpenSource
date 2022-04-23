// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.roomtools.RoomToolsWidget

package com.sulake.habbo.ui.widget.roomtools
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import __AS3__.vec.Vector;
    import _-Ja._SafeStr_1569;
    import com.sulake.habbo.ui.IRoomDesktop;
    import com.sulake.habbo.freeflowchat._SafeStr_1703;
    import flash.utils.Timer;
    import com.sulake.habbo.utils.StringUtil;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.ui.RoomUI;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.handler.RoomToolsWidgetHandler;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.ui.widget.chatinput.RoomChatInputWidget;

    public class RoomToolsWidget extends RoomWidgetBase 
    {

        private static const ROOM_HISTORY_MAX_LENGTH:int = 10;

        private static var _visitedRooms:Vector.<_SafeStr_1569> = new Vector.<_SafeStr_1569>();
        private static var _SafeStr_4394:int;

        private var _currentRoomName:String = "";
        private var _SafeStr_4389:RoomToolsToolbarCtrl;
        private var _SafeStr_4392:RoomToolsInfoCtrl;
        private var _SafeStr_4393:IRoomDesktop;
        private var _SafeStr_4390:_SafeStr_1703;
        private var _SafeStr_4391:Timer;

        public function RoomToolsWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:RoomUI)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4.localization);
            handler.widget = this;
            _SafeStr_4393 = _arg_4.getDesktop("hard_coded_room_id");
            _SafeStr_4390 = _arg_4.freeFlowChat;
            _SafeStr_4392 = new RoomToolsInfoCtrl(this, _arg_2, _arg_3);
            _SafeStr_4389 = new RoomToolsToolbarCtrl(this, _arg_2, _arg_3);
            _SafeStr_4389.updateRoomHistoryButtons();
            _SafeStr_4389.setChatHistoryButton(((!(_SafeStr_4390)) || (!(_SafeStr_4390.isDisabledInPreferences))));
            var _local_5:String = _arg_4.getProperty("camera.launch.ui.position");
            _SafeStr_4389.setCameraButton(((handler.container.sessionDataManager.isPerkAllowed("CAMERA")) && ((StringUtil.isBlank(_local_5)) || (_local_5 == "room-menu"))));
            _SafeStr_4389.setLikeButton(handler.canRate);
            _SafeStr_4389.setCollapsed(((handler.sessionDataManager.isNoob) || (!(handler.sessionDataManager.uiFlags & 0x02))));
        }

        override public function dispose():void
        {
            if (_SafeStr_4391)
            {
                _SafeStr_4391.stop();
                _SafeStr_4391 = null;
            };
            if (_SafeStr_4389)
            {
                _SafeStr_4389.dispose();
                _SafeStr_4389 = null;
            };
            if (_SafeStr_4392)
            {
                _SafeStr_4392.dispose();
                _SafeStr_4392 = null;
            };
            _SafeStr_4390 = null;
            _SafeStr_4393 = null;
            super.dispose();
        }

        public function updateRoomData(_arg_1:_SafeStr_1569):void
        {
            for each (var _local_2:_SafeStr_1569 in _visitedRooms)
            {
                if (_local_2.flatId == _arg_1.flatId)
                {
                    _local_2.roomName = _arg_1.roomName;
                };
            };
        }

        public function storeRoomData(_arg_1:_SafeStr_1569):void
        {
            for each (var _local_2:_SafeStr_1569 in _visitedRooms)
            {
                if (_local_2.flatId == _arg_1.flatId)
                {
                    return;
                };
            };
            _visitedRooms.push(_arg_1);
            if (_visitedRooms.length > 10)
            {
                _visitedRooms.shift();
            };
            _SafeStr_4394 = (_visitedRooms.length - 1);
            if (_SafeStr_4389)
            {
                _SafeStr_4389.setLikeButton(handler.canRate);
            };
        }

        public function showRoomInfo(_arg_1:Boolean, _arg_2:String, _arg_3:String, _arg_4:Array):void
        {
            if (!_SafeStr_4392)
            {
                return;
            };
            _currentRoomName = _arg_2;
            _SafeStr_4392.showRoomInfo(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        public function enterNewRoom(_arg_1:int):void
        {
            if (((!(_SafeStr_4389)) || (!(_SafeStr_4392))))
            {
                return;
            };
            var _local_3:int;
            for each (var _local_2:_SafeStr_1569 in _visitedRooms)
            {
                if (_local_2.flatId == _arg_1)
                {
                    _SafeStr_4394 = _local_3;
                };
                _local_3++;
            };
            _SafeStr_4389.disableRoomHistoryButtons();
            if (_SafeStr_4391 != null)
            {
                _SafeStr_4391.stop();
            };
            _SafeStr_4391 = new Timer(2000, 1);
            _SafeStr_4391.addEventListener("timer", roomButtonTimerEventHandler);
            _SafeStr_4391.start();
            _SafeStr_4392.setElementVisible("tags", true);
        }

        private function roomButtonTimerEventHandler(_arg_1:TimerEvent):void
        {
            var _local_2:Timer = (_arg_1.target as Timer);
            if (_local_2)
            {
                _local_2.stop();
                _local_2.removeEventListener("timer", roomButtonTimerEventHandler);
            };
            if (_SafeStr_4389)
            {
                _SafeStr_4389.updateRoomHistoryButtons();
            };
        }

        public function setCollapsed(_arg_1:Boolean):void
        {
            if (_SafeStr_4389)
            {
                _SafeStr_4389.setCollapsed(_arg_1);
            };
            if (_SafeStr_4392)
            {
                _SafeStr_4392.setToolbarCollapsed(_arg_1);
            };
        }

        public function get handler():RoomToolsWidgetHandler
        {
            return (_SafeStr_3914 as RoomToolsWidgetHandler);
        }

        public function getIconLocation(_arg_1:String):_SafeStr_3109
        {
            return (_SafeStr_4389.window.findChildByName(_arg_1));
        }

        public function getWidgetAreaWidth():int
        {
            return ((_SafeStr_4389) ? _SafeStr_4389.right : 0);
        }

        public function getChatInputY():int
        {
            if (!_SafeStr_4393)
            {
                return (0);
            };
            var _local_1:RoomChatInputWidget = (_SafeStr_4393.getWidget("RWE_CHAT_INPUT_WIDGET") as RoomChatInputWidget);
            if (!_local_1)
            {
                return (0);
            };
            return (_local_1.getChatInputY());
        }

        public function getRoomToolbarRight():int
        {
            return ((_SafeStr_4389) ? _SafeStr_4389.right : 0);
        }

        public function goToNextRoom():void
        {
            var _local_1:int = (_SafeStr_4394 + 1);
            var _local_2:int = _visitedRooms.length;
            if (_local_1 > _local_2)
            {
                _local_1 = _local_2;
            };
            handler.goToPrivateRoom(_visitedRooms[_local_1].flatId);
            _SafeStr_4389.disableRoomHistoryButtons();
        }

        public function goToPreviousRoom():void
        {
            var _local_1:int = (_SafeStr_4394 - 1);
            if (_local_1 < 0)
            {
                _local_1 = 0;
            };
            handler.goToPrivateRoom(_visitedRooms[_local_1].flatId);
            _SafeStr_4389.disableRoomHistoryButtons();
        }

        public function get freeFlowChat():_SafeStr_1703
        {
            return (_SafeStr_4390);
        }

        public function get visitedRooms():Vector.<_SafeStr_1569>
        {
            return (_visitedRooms);
        }

        public function get currentRoomIndex():int
        {
            return (_SafeStr_4394);
        }

        public function get currentRoomName():String
        {
            return (_currentRoomName);
        }


    }
}//package com.sulake.habbo.ui.widget.roomtools

// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1703 = "_-Q1U" (String#4333, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4389 = "_-3p" (String#1625, DoABC#4)
// _SafeStr_4390 = "_-HB" (String#9048, DoABC#4)
// _SafeStr_4391 = "_-Y1Z" (String#6865, DoABC#4)
// _SafeStr_4392 = "_-11i" (String#5782, DoABC#4)
// _SafeStr_4393 = "_-U1" (String#3797, DoABC#4)
// _SafeStr_4394 = "_-ME" (String#9107, DoABC#4)



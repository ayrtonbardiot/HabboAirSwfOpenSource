﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.doorbell.DoorbellWidget

package com.sulake.habbo.ui.widget.doorbell
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window._SafeStr_3109;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetDoorbellEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetLetUserInMessage;

    public class DoorbellWidget extends RoomWidgetBase 
    {

        private static const MAX_USERS_ON_DOORBELL_LIST:int = 50;

        private var _users:Array;
        private var _SafeStr_3882:DoorbellView;

        public function DoorbellWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_3882 = new DoorbellView(this);
            _users = [];
        }

        override public function get mainWindow():_SafeStr_3109
        {
            return (_SafeStr_3882.mainWindow);
        }

        public function get users():Array
        {
            return (_users);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
            _users = null;
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWDE_RINGING", onDoorbellRinging);
            _arg_1.addEventListener("RWDE_REJECTED", onDoorbellHandled);
            _arg_1.addEventListener("RWDE_ACCEPTED", onDoorbellHandled);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWDE_RINGING", onDoorbellRinging);
            _arg_1.removeEventListener("RWDE_REJECTED", onDoorbellHandled);
            _arg_1.removeEventListener("RWDE_ACCEPTED", onDoorbellHandled);
        }

        private function onDoorbellRinging(_arg_1:RoomWidgetDoorbellEvent):void
        {
            addUser(_arg_1.userName);
        }

        private function onDoorbellHandled(_arg_1:RoomWidgetDoorbellEvent):void
        {
            removeUser(_arg_1.userName);
        }

        public function addUser(_arg_1:String):void
        {
            if (_users.indexOf(_arg_1) != -1)
            {
                return;
            };
            if (_users.length >= 50)
            {
                deny(_arg_1);
                return;
            };
            _users.push(_arg_1);
            _SafeStr_3882.update();
        }

        public function removeUser(_arg_1:String):void
        {
            var _local_2:int = _users.indexOf(_arg_1);
            if (_local_2 == -1)
            {
                return;
            };
            _users.splice(_local_2, 1);
            _SafeStr_3882.update();
        }

        public function accept(_arg_1:String):void
        {
            var _local_2:RoomWidgetLetUserInMessage = new RoomWidgetLetUserInMessage(_arg_1, true);
            messageListener.processWidgetMessage(_local_2);
            removeUser(_arg_1);
        }

        public function deny(_arg_1:String):void
        {
            var _local_2:RoomWidgetLetUserInMessage = new RoomWidgetLetUserInMessage(_arg_1, false);
            messageListener.processWidgetMessage(_local_2);
            removeUser(_arg_1);
        }

        public function denyAll():void
        {
            while (_users.length > 0)
            {
                deny(_users[0]);
            };
        }


    }
}//package com.sulake.habbo.ui.widget.doorbell

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)



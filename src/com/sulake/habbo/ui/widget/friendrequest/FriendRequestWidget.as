// by nota

//com.sulake.habbo.ui.widget.friendrequest.FriendRequestWidget

package com.sulake.habbo.ui.widget.friendrequest
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.runtime.Component;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization._SafeStr_18;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFriendRequestUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetObjectLocationMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserLocationUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFriendRequestMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;

    public class FriendRequestWidget extends RoomWidgetBase implements _SafeStr_41 
    {

        private var _SafeStr_4147:Component;
        private var _SafeStr_4369:_SafeStr_24;

        public function FriendRequestWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:IAssetLibrary, _arg_4:_SafeStr_18, _arg_5:Component)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_4147 = _arg_5;
            _SafeStr_4369 = new _SafeStr_24();
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_4147)
            {
                _SafeStr_4147.removeUpdateReceiver(this);
                _SafeStr_4147 = null;
            };
            if (_SafeStr_4369)
            {
                for each (var _local_1:FriendRequestDialog in _SafeStr_4369)
                {
                    _local_1.dispose();
                    _local_1 = null;
                };
                _SafeStr_4369.dispose();
                _SafeStr_4369 = null;
            };
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (!_arg_1)
            {
                return;
            };
            _arg_1.addEventListener("RWFRUE_SHOW_FRIEND_REQUEST", eventHandler);
            _arg_1.addEventListener("RWFRUE_HIDE_FRIEND_REQUEST", eventHandler);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWFRUE_SHOW_FRIEND_REQUEST", eventHandler);
            _arg_1.removeEventListener("RWFRUE_HIDE_FRIEND_REQUEST", eventHandler);
        }

        private function eventHandler(_arg_1:RoomWidgetFriendRequestUpdateEvent):void
        {
            if (!_arg_1)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "RWFRUE_SHOW_FRIEND_REQUEST":
                    addRequest(_arg_1.requestId, new FriendRequestDialog(this, _arg_1.requestId, _arg_1.userId, _arg_1.userName));
                    break;
                case "RWFRUE_HIDE_FRIEND_REQUEST":
                    removeRequest(_arg_1.requestId);
            };
            checkUpdateNeed();
        }

        public function checkUpdateNeed():void
        {
            if (!_SafeStr_4147)
            {
                return;
            };
            if (((_SafeStr_4369) && (_SafeStr_4369.length > 0)))
            {
                _SafeStr_4147.registerUpdateReceiver(this, 10);
            }
            else
            {
                _SafeStr_4147.removeUpdateReceiver(this);
            };
        }

        public function update(_arg_1:uint):void
        {
            var _local_3:* = null;
            if (!_SafeStr_4369)
            {
                return;
            };
            for each (var _local_2:FriendRequestDialog in _SafeStr_4369)
            {
                if (_local_2)
                {
                    _local_3 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION", _local_2.userId, 1)) as RoomWidgetUserLocationUpdateEvent);
                    if (_local_3)
                    {
                        _local_2.targetRect = _local_3.rectangle;
                    };
                };
            };
        }

        public function acceptRequest(_arg_1:int):void
        {
            if (!messageListener)
            {
                return;
            };
            messageListener.processWidgetMessage(new RoomWidgetFriendRequestMessage("RWFRM_ACCEPT", _arg_1));
            removeRequest(_arg_1);
        }

        public function declineRequest(_arg_1:int):void
        {
            if (!messageListener)
            {
                return;
            };
            messageListener.processWidgetMessage(new RoomWidgetFriendRequestMessage("RWFRM_DECLINE", _arg_1));
            removeRequest(_arg_1);
        }

        public function ignoreRequest(_arg_1:int):void
        {
            removeRequest(_arg_1);
        }

        private function addRequest(_arg_1:int, _arg_2:FriendRequestDialog):void
        {
            if (((!(_SafeStr_4369)) || (!(_arg_2))))
            {
                return;
            };
            _SafeStr_4369.add(_arg_1, _arg_2);
        }

        private function removeRequest(_arg_1:int):void
        {
            if (!_SafeStr_4369)
            {
                return;
            };
            var _local_2:FriendRequestDialog = (_SafeStr_4369.getValue(_arg_1) as FriendRequestDialog);
            if (!_local_2)
            {
                return;
            };
            _SafeStr_4369.remove(_arg_1);
            _local_2.dispose();
            checkUpdateNeed();
        }

        public function showProfile(_arg_1:int, _arg_2:String):void
        {
            messageListener.processWidgetMessage(new RoomWidgetOpenProfileMessage("RWOPEM_OPEN_USER_PROFILE", _arg_1, _arg_2));
        }


    }
}//package com.sulake.habbo.ui.widget.friendrequest

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_4369 = "_-cz" (String#2498, DoABC#4)



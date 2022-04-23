// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.furniture.stickie.SpamWallPostItFurniWidget

package com.sulake.habbo.ui.widget.furniture.stickie
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetStickieDataUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetSpamWallPostItEditEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetSpamWallPostItFinishEditingMessage;

    public class SpamWallPostItFurniWidget extends StickieFurniWidget 
    {

        private var _location:String = "";

        public function SpamWallPostItFurniWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21=null)
        {
            _windowName = "spamwall_postit_container";
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function dispose():void
        {
            _SafeStr_4157 = -1;
            _location = "";
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            _arg_1.addEventListener("RWSWPUE_OPEN_EDITOR", onEditPostItRequest);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWSWPUE_OPEN_EDITOR", onEditPostItRequest);
        }

        override protected function onObjectUpdate(_arg_1:RoomWidgetStickieDataUpdateEvent):void
        {
        }

        private function onEditPostItRequest(_arg_1:RoomWidgetSpamWallPostItEditEvent):void
        {
            hideInterface(false);
            _SafeStr_4157 = _arg_1.objectId;
            _location = _arg_1.location;
            _SafeStr_4652 = _arg_1.objectType;
            _text = "";
            _SafeStr_4653 = "FFFF33";
            _SafeStr_4360 = true;
            showInterface();
        }

        override protected function sendUpdate():void
        {
            var _local_1:* = null;
            if (_SafeStr_4157 != -1)
            {
                storeTextFromField();
                _SafeStr_14.log("Spamwall Post-It Widget Send Update");
                if (messageListener != null)
                {
                    _local_1 = new RoomWidgetSpamWallPostItFinishEditingMessage("RWSWPFEE_SEND_POSTIT_DATA", _SafeStr_4157, _location, _text, _SafeStr_4653);
                    messageListener.processWidgetMessage(_local_1);
                };
                hideInterface(false);
            };
        }

        override protected function sendSetColor(_arg_1:uint):void
        {
            storeTextFromField();
            var _local_2:String = _arg_1.toString(16).toUpperCase();
            if (_local_2.length > 6)
            {
                _local_2 = _local_2.slice((_local_2.length - 6), _local_2.length);
            };
            if (_local_2 == _SafeStr_4653)
            {
                return;
            };
            _SafeStr_4653 = _local_2;
            showInterface();
        }

        override protected function sendDelete():void
        {
            hideInterface(false);
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.stickie

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4652 = "_-61C" (String#3402, DoABC#4)
// _SafeStr_4653 = "_-m10" (String#3030, DoABC#4)



// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.chooser.UserChooserWidget

package com.sulake.habbo.ui.widget.chooser
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetChooserContentEvent;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;

    public class UserChooserWidget extends ChooserWidgetBase 
    {

        private const STATE_USER_CHOOSER_CLOSED:int = 0;
        private const STATE_USER_CHOOSER_OPEN:int = 1;

        private var _SafeStr_5134:ChooserView;

        public function UserChooserWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21=null, _arg_4:_SafeStr_18=null)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        override public function get state():int
        {
            if (((!(_SafeStr_5134 == null)) && (_SafeStr_5134.isOpen())))
            {
                return (1);
            };
            return (0);
        }

        override public function initialize(_arg_1:int=0):void
        {
            var _local_2:* = null;
            super.initialize(_arg_1);
            if (_arg_1 == 1)
            {
                _local_2 = new RoomWidgetRequestWidgetMessage("RWRWM_USER_CHOOSER");
                messageListener.processWidgetMessage(_local_2);
            };
        }

        override public function dispose():void
        {
            if (_SafeStr_5134 != null)
            {
                _SafeStr_5134.dispose();
                _SafeStr_5134 = null;
            };
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWCCE_USER_CHOOSER_CONTENT", onChooserContent);
            _arg_1.addEventListener("RWROUE_USER_REMOVED", onUpdateUserChooser);
            _arg_1.addEventListener("RWROUE_USER_ADDED", onUpdateUserChooser);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWCCE_USER_CHOOSER_CONTENT", onChooserContent);
            _arg_1.removeEventListener("RWROUE_USER_REMOVED", onUpdateUserChooser);
            _arg_1.removeEventListener("RWROUE_USER_ADDED", onUpdateUserChooser);
        }

        private function onChooserContent(_arg_1:RoomWidgetChooserContentEvent):void
        {
            if (((_arg_1 == null) || (_arg_1.items == null)))
            {
                return;
            };
            if (_SafeStr_5134 == null)
            {
                _SafeStr_5134 = new ChooserView(this, "${widget.chooser.user.title}");
            };
            _SafeStr_5134.populate(_arg_1.items, false);
        }

        private function onUpdateUserChooser(_arg_1:RoomWidgetRoomObjectUpdateEvent):void
        {
            var event = _arg_1;
            if (((_SafeStr_5134 == null) || (!(_SafeStr_5134.isOpen()))))
            {
                return;
            };
            var delayedAction:Timer = new Timer(100, 1);
            delayedAction.addEventListener("timer", function (_arg_1:TimerEvent):void
            {
                if (disposed)
                {
                    return;
                };
                messageListener.processWidgetMessage(new RoomWidgetRequestWidgetMessage("RWRWM_USER_CHOOSER"));
            });
            delayedAction.start();
        }


    }
}//package com.sulake.habbo.ui.widget.chooser

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_5134 = "_-6A" (String#5582, DoABC#4)



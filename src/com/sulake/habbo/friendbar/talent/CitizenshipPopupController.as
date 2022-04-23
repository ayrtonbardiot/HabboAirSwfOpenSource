// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.talent.CitizenshipPopupController

package com.sulake.habbo.friendbar.talent
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.window.utils.IModalDialog;
    import _-Ol._SafeStr_484;
    import flash.utils.Timer;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.events.TimerEvent;
    import com.sulake.core.window._SafeStr_3133;
    import _-f1P._SafeStr_953;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class CitizenshipPopupController implements _SafeStr_13 
    {

        private var _habboTalent:HabboTalent;
        private var _SafeStr_4003:IModalDialog;
        private var _disposed:Boolean;
        private var _SafeStr_5528:_SafeStr_484;
        private var _seenPopupDuringSession:Boolean;

        public function CitizenshipPopupController(_arg_1:HabboTalent)
        {
            _habboTalent = _arg_1;
            _SafeStr_5528 = new _SafeStr_484(onRoomEnter);
            _habboTalent.communicationManager.addHabboConnectionMessageEvent(_SafeStr_5528);
        }

        private function onRoomEnter(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            if ((((_habboTalent.newIdentity) && (!(_seenPopupDuringSession))) && (_habboTalent.getBoolean("new.user.citizenship.popup.enabled"))))
            {
                _local_2 = new Timer(10000, 1);
                _local_2.addEventListener("timer", onCitizenshipPopup);
                _local_2.start();
            };
        }

        private function onCitizenshipPopup(_arg_1:TimerEvent):void
        {
            removeRoomEnterListener();
            show();
            _seenPopupDuringSession = true;
        }

        private function removeRoomEnterListener():void
        {
            if (((!(_habboTalent == null)) && (!(_habboTalent.disposed))))
            {
                _habboTalent.communicationManager.removeHabboConnectionMessageEvent(_SafeStr_5528);
            };
            _SafeStr_5528 = null;
        }

        public function show():void
        {
            hide();
            _SafeStr_4003 = _habboTalent.getModalXmlWindow("citizenship_welcome");
            _SafeStr_4003.rootWindow.procedure = onWindowEvent;
            _SafeStr_3133(_SafeStr_4003.rootWindow).findChildByName("header_button_close").visible = false;
        }

        private function hide():void
        {
            if (((!(_SafeStr_4003 == null)) && (!(_SafeStr_4003.disposed))))
            {
                _SafeStr_4003.dispose();
                _SafeStr_4003 = null;
            };
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                hide();
                removeRoomEnterListener();
                _habboTalent = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        private function onWindowEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if ((((_SafeStr_4003 == null) || (_SafeStr_4003.disposed)) || (!(_arg_1.type == "WME_CLICK"))))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "postpone_citizenship":
                    hide();
                    return;
                case "show_citizenship":
                    hide();
                    _habboTalent.tracking.trackTalentTrackOpen("citizenship", "citizenshippopup");
                    _habboTalent.send(new _SafeStr_953("citizenship"));
                    return;
            };
        }


    }
}//package com.sulake.habbo.friendbar.talent

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4003 = "_-Qd" (String#802, DoABC#4)
// _SafeStr_484 = "_-4N" (String#2464, DoABC#4)
// _SafeStr_5528 = "_-i1X" (String#10468, DoABC#4)
// _SafeStr_953 = "_-a1w" (String#3282, DoABC#4)



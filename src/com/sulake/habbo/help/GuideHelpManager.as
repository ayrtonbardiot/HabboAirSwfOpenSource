// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.help.GuideHelpManager

package com.sulake.habbo.help
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.help.guidehelp.HelpController;
    import com.sulake.habbo.help.guidehelp.GuideSessionController;
    import flash.utils.Timer;
    import _-Ol._SafeStr_484;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.events.TimerEvent;
    import _-w1o._SafeStr_1589;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;

    public class GuideHelpManager implements _SafeStr_13 
    {

        private var _habboHelp:HabboHelp;
        private var _SafeStr_5279:HelpController;
        private var _SafeStr_5280:GuideSessionController;
        private var _SafeStr_5281:ChatReviewReporterFeedbackCtrl;
        private var _disposed:Boolean = false;
        private var _seenTourPopupDuringSession:Boolean;
        private var _SafeStr_8627:int;
        private var _panicRoomName:String;
        private var _SafeStr_5126:Timer;

        public function GuideHelpManager(_arg_1:HabboHelp)
        {
            _habboHelp = _arg_1;
            _SafeStr_5279 = new HelpController(this);
            _SafeStr_5280 = new GuideSessionController(this);
            _SafeStr_5281 = new ChatReviewReporterFeedbackCtrl(_habboHelp);
            _habboHelp.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_484(onRoomEnter));
        }

        public function get habboHelp():HabboHelp
        {
            return (_habboHelp);
        }

        private function onRoomEnter(_arg_1:IMessageEvent):void
        {
            if (((((_habboHelp.newUserTourEnabled) && (_habboHelp.newIdentity)) && (!(_seenTourPopupDuringSession))) && (!(_habboHelp.sessionDataManager.isRealNoob))))
            {
                _SafeStr_5126 = new Timer(getTourPopupDelay(), 1);
                _SafeStr_5126.addEventListener("timer", onTourPopup);
                _SafeStr_5126.start();
                _habboHelp.tracking.trackEventLog("Help", "", "tour.new_user.create", "", getTourPopupDelay());
                _habboHelp.trackGoogle("newbieTourWindow", "timer_popupCreated");
            };
        }

        private function onTourPopup(_arg_1:TimerEvent):void
        {
            if (_disposed)
            {
                return;
            };
            _habboHelp.tracking.trackEventLog("Help", "", "tour.new_user.show", "", getTourPopupDelay());
            _habboHelp.trackGoogle("newbieTourWindow", "timer_popupShown");
            openTourPopup();
        }

        public function openTourPopup():void
        {
            _SafeStr_5279.openTourPopup();
            _seenTourPopupDuringSession = true;
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            if (_SafeStr_5279)
            {
                _SafeStr_5279.dispose();
                _SafeStr_5279 = null;
            };
            if (_SafeStr_5280)
            {
                _SafeStr_5280.dispose();
                _SafeStr_5280 = null;
            };
            if (_SafeStr_5281)
            {
                _SafeStr_5281.dispose();
                _SafeStr_5281 = null;
            };
            if (_SafeStr_5126)
            {
                _SafeStr_5126.reset();
                _SafeStr_5126 = null;
            };
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function showGuideTool():void
        {
            _SafeStr_5280.showGuideTool();
        }

        public function showPendingTicket(_arg_1:_SafeStr_1589):void
        {
            _SafeStr_5279.showPendingTicket(_arg_1);
        }

        public function createHelpRequest(_arg_1:uint):void
        {
            _SafeStr_5280.createHelpRequest(_arg_1);
        }

        public function openReportWindow():void
        {
            _SafeStr_5280.openReportWindow();
        }

        public function showFeedback(_arg_1:String):void
        {
            _SafeStr_5281.show(_arg_1);
        }

        private function getTourPopupDelay():int
        {
            return (_habboHelp.getInteger("guide.help.new.user.tour.popup.delay", 30) * 1000);
        }

        public function onHabboToolbarEvent(_arg_1:HabboToolbarEvent):void
        {
            if (_arg_1.type == "HTE_TOOLBAR_CLICK")
            {
                switch (_arg_1.iconId)
                {
                    case "HTIE_ICON_HELP":
                        _habboHelp.toggleNewHelpWindow();
                        return;
                    case "HTIE_ICON_GUIDE":
                        showGuideTool();
                        return;
                };
            };
        }


    }
}//package com.sulake.habbo.help

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1589 = "_-8d" (String#30719, DoABC#4)
// _SafeStr_484 = "_-4N" (String#2464, DoABC#4)
// _SafeStr_5126 = "_-UT" (String#4274, DoABC#4)
// _SafeStr_5279 = "_-w1S" (String#8097, DoABC#4)
// _SafeStr_5280 = "_-Yj" (String#7499, DoABC#4)
// _SafeStr_5281 = "_-V10" (String#9522, DoABC#4)
// _SafeStr_8627 = "_-vu" (String#34390, DoABC#4)



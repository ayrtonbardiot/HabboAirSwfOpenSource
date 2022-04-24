// by nota

//com.sulake.habbo.help.guidehelp.HelpController

package com.sulake.habbo.help.guidehelp
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.help.HabboHelp;
    import com.sulake.habbo.help.GuideHelpManager;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.components._SafeStr_3158;
    import _-IR._SafeStr_316;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import flash.utils.getTimer;
    import com.sulake.habbo.window.widgets._SafeStr_3351;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import _-w1o._SafeStr_1589;

    public class HelpController implements _SafeStr_13 
    {

        private var _habboHelp:HabboHelp;
        private var _guideHelp:GuideHelpManager;
        private var _disposed:Boolean = false;
        private var _SafeStr_4681:IModalDialog;
        private var _tourPopup:_SafeStr_3133;
        private var _tourPopupShowTime:int;
        private var _SafeStr_6093:_SafeStr_3133;

        public function HelpController(_arg_1:GuideHelpManager)
        {
            _habboHelp = _arg_1.habboHelp;
            _guideHelp = _arg_1;
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            closeWindow();
            closeTourPopup();
            _habboHelp = null;
            _guideHelp = null;
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        private function openWindow():void
        {
            if (((_SafeStr_4681 == null) && (!(disposed))))
            {
                _SafeStr_4681 = _guideHelp.habboHelp.getModalXmlWindow("main_help");
                _SafeStr_4681.rootWindow.procedure = windowEventProcedure;
            };
        }

        public function closeWindow():void
        {
            if (_SafeStr_4681 != null)
            {
                _SafeStr_4681.dispose();
                _SafeStr_4681 = null;
            };
        }

        private function windowEventProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (((disposed) || (!(_arg_1.type == "WME_CLICK"))))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "header_button_close":
                    closeWindow();
                    return;
                case "tour_button":
                    _guideHelp.createHelpRequest(((_habboHelp.newIdentity) ? 0 : 2));
                    _habboHelp.trackGoogle("helpWindow", "click_userTour");
                    closeWindow();
                    return;
                case "bully_button":
                    closeWindow();
                    _habboHelp.toggleNewHelpWindow();
                    _habboHelp.trackGoogle("helpWindow", "click_reportBully");
                    return;
                case "instructions_button":
                    _guideHelp.createHelpRequest(1);
                    _habboHelp.trackGoogle("helpWindow", "click_instructions");
                    closeWindow();
                    return;
                case "self_help_link":
                    HabboWebTools.openWebPage(_habboHelp.getProperty("zendesk.url"), "habboMain");
                    _habboHelp.trackGoogle("helpWindow", "click_selfHelp");
                    closeWindow();
                    return;
                case "habboway_link":
                    if (_habboHelp.getBoolean("habboway.enabled"))
                    {
                        _habboHelp.showHabboWay();
                    }
                    else
                    {
                        HabboWebTools.openWebPage(_habboHelp.getProperty("habboway.url"), "habboMain");
                    };
                    _habboHelp.trackGoogle("helpWindow", "click_habboWay");
                    closeWindow();
                    return;
                case "safetybooklet_link":
                    _habboHelp.showSafetyBooklet();
                    _habboHelp.trackGoogle("helpWindow", "click_showSafetyBooklet");
                    closeWindow();
                    return;
                case "emergency_button":
                    _local_3 = (_SafeStr_3133(_SafeStr_4681.rootWindow).findChildByName("leave_room") as _SafeStr_3158);
                    if (((!(_local_3 == null)) && (_local_3.isSelected)))
                    {
                        _habboHelp.sendMessage(new _SafeStr_316());
                    };
                    closeWindow();
                    _habboHelp.startEmergencyRequest();
                    _habboHelp.trackGoogle("helpWindow", "click_emergency");
                    return;
                default:
                    return;
            };
        }

        public function openTourPopup():void
        {
            if (((_tourPopup == null) && (!(disposed))))
            {
                _tourPopupShowTime = getTimer();
                _tourPopup = (_guideHelp.habboHelp.getXmlWindow("welcome_tour_popup") as _SafeStr_3133);
                _tourPopup.center();
                _tourPopup.y = (_tourPopup.y * 0.25);
                _tourPopup.procedure = tourPopupEventProcedure;
            };
        }

        private function closeTourPopup():void
        {
            if (_tourPopup != null)
            {
                _tourPopup.dispose();
                _tourPopup = null;
            };
        }

        private function tourPopupEventProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((disposed) || (!(_arg_1.type == "WME_CLICK"))))
            {
                return;
            };
            var _local_3:int = int(((_tourPopupShowTime - getTimer()) / 1000));
            switch (_arg_2.name)
            {
                case "refuse_tour":
                    _habboHelp.tracking.trackEventLog("Help", "", "tour.new_user.cancel", "", _local_3);
                    _habboHelp.trackGoogle("newbieTourWindow", "click_refuseTour");
                    closeTourPopup();
                    return;
                case "header_button_close":
                    _habboHelp.tracking.trackEventLog("Help", "", "tour.new_user.dismiss", "", _local_3);
                    _habboHelp.trackGoogle("newbieTourWindow", "click_closeWindow");
                    closeTourPopup();
                    return;
                case "take_tour":
                    _guideHelp.createHelpRequest(0);
                    _habboHelp.tracking.trackEventLog("Help", "", "tour.new_user.accept", "", _local_3);
                    _habboHelp.trackGoogle("newbieTourWindow", "click_acceptTour");
                    closeTourPopup();
                    return;
            };
        }

        public function showPendingTicket(_arg_1:_SafeStr_1589):void
        {
            var _local_2:* = null;
            if (_arg_1.isGuide)
            {
                _local_2 = "pending_guide_session";
            }
            else
            {
                switch (_arg_1.type)
                {
                    case 0:
                    case 2:
                        _local_2 = "pending_tour_request";
                        break;
                    case 1:
                        _local_2 = "pending_instructions_request";
                        break;
                    case 3:
                        _local_2 = "pending_bully_request";
                        break;
                    default:
                        return;
                };
            };
            _SafeStr_6093 = (_habboHelp.getXmlWindow(_local_2) as _SafeStr_3133);
            _SafeStr_6093.center();
            _SafeStr_6093.procedure = onPendingReuqestEvent;
            if (_arg_1.isGuide)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case 1:
                    _SafeStr_6093.findChildByName("description").caption = _arg_1.description;
                    _SafeStr_3351(_SafeStr_3199(_SafeStr_6093.findChildByName("timestamp")).widget).timeStamp = (new Date().getTime() - (_arg_1.secondsAgo * 1000));
                    return;
                case 3:
                    _SafeStr_6093.findChildByName("user_name").caption = _arg_1.otherPartyName;
                    _SafeStr_3289(_SafeStr_3199(_SafeStr_6093.findChildByName("user_avatar")).widget).figure = _arg_1.otherPartyFigure;
                    _SafeStr_3351(_SafeStr_3199(_SafeStr_6093.findChildByName("timestamp")).widget).timeStamp = (new Date().getTime() - (_arg_1.secondsAgo * 1000));
                    _habboHelp.localization.registerParameter("guide.pending.bully.room", "room", _arg_1.roomName);
                default:
            };
        }

        private function onPendingReuqestEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                    case "close_button":
                        if (((!(_SafeStr_6093 == null)) && (!(_SafeStr_6093.disposed))))
                        {
                            _SafeStr_6093.dispose();
                            _SafeStr_6093 = null;
                        };
                        return;
                };
            };
        }


    }
}//package com.sulake.habbo.help.guidehelp

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1589 = "_-8d" (String#30719, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_316 = "_-hs" (String#6384, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_3351 = "_-bh" (String#10123, DoABC#4)
// _SafeStr_4681 = "_-jY" (String#3415, DoABC#4)
// _SafeStr_6093 = "_-67" (String#5015, DoABC#4)



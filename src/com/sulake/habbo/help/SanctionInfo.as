// by nota

//com.sulake.habbo.help.SanctionInfo

package com.sulake.habbo.help
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import _-Y1i._SafeStr_1504;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.utils.StringUtil;
    import com.sulake.core.window.components.IItemListWindow;
    import _-v1p._SafeStr_607;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class SanctionInfo implements _SafeStr_13 
    {

        private var _disposed:Boolean = false;
        private var _window:_SafeStr_3133;
        private var _habboHelp:HabboHelp;

        public function SanctionInfo(_arg_1:HabboHelp)
        {
            _habboHelp = _arg_1;
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function openWindow(_arg_1:_SafeStr_607):void
        {
            dispose();
            _disposed = false;
            _window = (_habboHelp.getXmlWindow("sanction_info") as _SafeStr_3133);
            _window.center();
            _window.procedure = windowEventHandler;
            var _local_2:_SafeStr_1504 = _arg_1.getParser();
            if (_local_2.sanctionReason == "cfh.reason.EMPTY")
            {
                _window.findChildByName("no_sanction_info").visible = true;
                _window.findChildByName("last_sanction_type").visible = false;
                _window.findChildByName("sanction_start_time").visible = false;
                _window.findChildByName("sanction_reason").visible = false;
                _window.findChildByName("probation_info").visible = false;
            }
            else
            {
                _window.findChildByName("last_sanction_type").caption = ((_habboHelp.localization.getLocalization("help.sanction.last.sanction") + " ") + getSanctionTypeDescription("current", _local_2.sanctionName, _local_2.sanctionLengthHours));
                if (_local_2.isSanctionNew)
                {
                    (_window.findChildByName("last_sanction_type") as ITextWindow).textColor = 0xFF0000;
                };
                _window.findChildByName("sanction_start_time").caption = ((_habboHelp.localization.getLocalization("generic.start.time") + " ") + _local_2.sanctionCreationTime);
                _window.findChildByName("sanction_reason").caption = ((_habboHelp.localization.getLocalization("generic.reason") + " ") + _local_2.sanctionReason);
                if (_local_2.isSanctionActive)
                {
                    _window.findChildByName("probation_info").visible = false;
                }
                else
                {
                    _window.findChildByName("probation_info").caption = ((_habboHelp.localization.getLocalization("help.sanction.probation.days.left") + " ") + (int((_local_2.probationHoursLeft / 24)) + 1));
                };
                _window.findChildByName("probation_reminder_title").visible = ((_local_2.probationHoursLeft > 0) || (_local_2.isSanctionActive));
            };
            if (((_local_2.hasCustomMute) && (!(_local_2.isSanctionActive))))
            {
                _window.findChildByName("no_sanction_info").visible = false;
                _window.findChildByName("custom_mute_info").visible = true;
                _window.findChildByName("last_sanction_type").visible = false;
                _window.findChildByName("sanction_start_time").visible = false;
                _window.findChildByName("sanction_reason").visible = false;
            };
            if (!StringUtil.isEmpty(_local_2.tradeLockExpiryTime))
            {
                _window.findChildByName("no_sanction_info").visible = false;
                _window.findChildByName("trade_lock_info").caption = ((_habboHelp.localization.getLocalization("trade.locked.until") + " ") + _local_2.tradeLockExpiryTime);
                _window.findChildByName("trade_lock_info").visible = true;
            };
            _window.findChildByName("next_sanction").caption = getSanctionTypeDescription("next", _local_2.nextSanctionName, _local_2.nextSanctionLengthHours);
            IItemListWindow(_window.findChildByName("main_contents_list")).arrangeListItems();
        }

        private function getSanctionTypeDescription(_arg_1:String, _arg_2:String, _arg_3:int):String
        {
            var _local_4:String = ("help.sanction." + _arg_1);
            switch (_arg_2)
            {
                case "ALERT":
                    _local_4 = (_local_4 + ".alert");
                    break;
                case "MUTE":
                    _local_4 = (_local_4 + ".mute");
                    break;
                case "BAN_PERMANENT":
                    _local_4 = (_local_4 + ".permban");
                    break;
                default:
                    _local_4 = (_local_4 + ".ban");
                    if (_arg_3 > 24)
                    {
                        _local_4 = (_local_4 + ".days");
                        return (_habboHelp.localization.registerParameter(_local_4, "days", (_arg_3 / 24).toString()));
                    };
            };
            return (_habboHelp.localization.registerParameter(_local_4, "hours", _arg_3.toString()));
        }

        private function windowEventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((((_disposed) || (!(_window))) || (!(_arg_1.type == "WME_CLICK"))) || (!(_arg_2))))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "faq_link":
                    _habboHelp.openCfhFaq();
                    return;
                case "header_button_close":
                case "ok_button":
                    dispose();
                    return;
                default:
                    return;
            };
        }


    }
}//package com.sulake.habbo.help

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1504 = "_-at" (String#31739, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_607 = "_-Rr" (String#18691, DoABC#4)



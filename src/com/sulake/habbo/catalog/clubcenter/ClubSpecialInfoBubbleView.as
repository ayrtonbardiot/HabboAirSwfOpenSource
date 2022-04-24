// by nota

//com.sulake.habbo.catalog.clubcenter.ClubSpecialInfoBubbleView

package com.sulake.habbo.catalog.clubcenter
{
    import _-W1K._SafeStr_1632;
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Timer;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window._SafeStr_3109;
    import flash.events.TimerEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3332;
    import com.sulake.core.window.components.ITextWindow;

    public class ClubSpecialInfoBubbleView 
    {

        private static const MARGIN:int = 8;

        private var _SafeStr_3740:_SafeStr_1632;
        private var _SafeStr_4360:HabboClubCenter;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5497:Timer;

        public function ClubSpecialInfoBubbleView(_arg_1:HabboClubCenter, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_1632, _arg_4:_SafeStr_3109):void
        {
            _SafeStr_3740 = _arg_3;
            _SafeStr_4360 = _arg_1;
            _window = (_arg_2.buildFromXML(XML(_SafeStr_4360.assets.getAssetByName("club_center_special_info_xml").content)) as _SafeStr_3133);
            if (!_window)
            {
                return;
            };
            _window.procedure = onInput;
            positionWindow(_arg_4);
            setElementText("info_creditsspent", getLocalization("hccenter.breakdown.creditsspent").replace("%credits%", _SafeStr_3740.totalCreditsSpent));
            var _local_6:int = (_SafeStr_3740.kickbackPercentage * 100);
            setElementText("info_factor", getLocalization("hccenter.breakdown.paydayfactor").replace("%percent%", _local_6).replace("%multiplier%", _SafeStr_3740.kickbackPercentage));
            _local_6 = (_SafeStr_3740.kickbackPercentage * 100);
            var _local_5:String = _SafeStr_4360.localization.getLocalization("hccenter.breakdown.paydayfactor.percent");
            if (((_local_5) && (_local_5.length > 0)))
            {
                _local_5 = _local_5.replace("%percent%", _local_6).replace("%multiplier%", _SafeStr_3740.kickbackPercentage);
            }
            else
            {
                _local_5 = getLocalization("hccenter.breakdown.paydayfactor").replace("%percent%", _SafeStr_3740.kickbackPercentage);
            };
            setElementText("info_factor", _local_5);
            setElementText("info_streakbonus", getLocalization("hccenter.breakdown.streakbonus").replace("%credits%", _SafeStr_3740.creditRewardForStreakBonus));
            var _local_8:Number = ((((_SafeStr_3740.kickbackPercentage * _SafeStr_3740.totalCreditsSpent) + _SafeStr_3740.creditRewardForStreakBonus) * 100) / 100);
            var _local_7:int = int((((_SafeStr_3740.creditRewardForMonthlySpent + _SafeStr_3740.creditRewardForStreakBonus) * 100) / 100));
            setElementText("info_total", getLocalization("hccenter.breakdown.total").replace("%credits%", _local_7).replace("%actual%", _local_8));
            _window.activate();
            _SafeStr_5497 = new Timer(80, 1);
            _SafeStr_5497.addEventListener("timer", onTimerEvent);
            _SafeStr_5497.start();
            if (_SafeStr_4360.stage)
            {
                _SafeStr_4360.stage.addEventListener("click", onStageClick);
            };
        }

        private function onTimerEvent(_arg_1:TimerEvent):void
        {
            _SafeStr_5497.stop();
            _SafeStr_5497.removeEventListener("timer", onTimerEvent);
            _SafeStr_5497 = null;
            _window.activate();
        }

        public function dispose():void
        {
            if (((_SafeStr_4360) && (_SafeStr_4360.stage)))
            {
                _SafeStr_4360.stage.removeEventListener("click", onStageClick);
            };
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4360 = null;
        }

        private function onInput(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((!(_arg_1.type == "WME_DOWN")) || (!(_SafeStr_4360))))
            {
                return;
            };
            _arg_1.stopImmediatePropagation();
            switch (_arg_2.name)
            {
                case "special_infolink":
                    _SafeStr_4360.openPaydayHelpPage();
            };
            _SafeStr_4360.removeBreakdown();
        }

        private function onStageClick(_arg_1:MouseEvent):void
        {
            if (_SafeStr_4360)
            {
                _SafeStr_4360.removeBreakdown();
            };
        }

        private function positionWindow(_arg_1:_SafeStr_3109):void
        {
            if (((((!(_arg_1)) || (!(_window))) || (!(_SafeStr_4360))) || (!(_SafeStr_4360.stage))))
            {
                return;
            };
            var _local_2:Point = new Point();
            _arg_1.getGlobalPosition(_local_2);
            if (((_SafeStr_4360.stage.stageWidth < (((_local_2.x + _arg_1.width) + _window.width) + 8)) && (_local_2.x > (_window.width + 8))))
            {
                (_window as _SafeStr_3332).direction = "right";
                _local_2.x = (_local_2.x - (_window.width + 8));
            }
            else
            {
                _local_2.x = (_local_2.x + (_arg_1.width + 8));
            };
            _local_2.y = (_local_2.y + ((_arg_1.height * 0.5) - (_window.height * 0.5)));
            _window.position = _local_2;
        }

        private function setElementText(_arg_1:String, _arg_2:String):void
        {
            if (!_window)
            {
                return;
            };
            var _local_3:ITextWindow = (_window.findChildByName(_arg_1) as ITextWindow);
            if (_local_3)
            {
                _local_3.text = _arg_2;
            };
        }

        private function getLocalization(_arg_1:String):String
        {
            if (((!(_SafeStr_4360)) || (!(_SafeStr_4360.localization))))
            {
                return ("");
            };
            return (_SafeStr_4360.localization.getLocalization(_arg_1, _arg_1));
        }


    }
}//package com.sulake.habbo.catalog.clubcenter

// _SafeStr_1632 = "_-q1C" (String#13728, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3332 = "_-s1R" (String#3135, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_5497 = "_-nL" (String#8716, DoABC#4)



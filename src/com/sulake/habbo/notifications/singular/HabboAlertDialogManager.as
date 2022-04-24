// by nota

//com.sulake.habbo.notifications.singular.HabboAlertDialogManager

package com.sulake.habbo.notifications.singular
{
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;

    public class HabboAlertDialogManager 
    {

        private var _windowManager:_SafeStr_1695;
        private var _localization:_SafeStr_18;
        private var _habboHelp:IHabboHelp;

        public function HabboAlertDialogManager(_arg_1:_SafeStr_1695, _arg_2:_SafeStr_18, _arg_3:IHabboHelp)
        {
            _windowManager = _arg_1;
            _localization = _arg_2;
            _habboHelp = _arg_3;
        }

        private static function getTimeZeroPadded(_arg_1:int):String
        {
            var _local_2:String = ("0" + String(_arg_1));
            return (_local_2.substr((_local_2.length - 2), _local_2.length));
        }


        public function dispose():void
        {
            _windowManager = null;
            _localization = null;
            _habboHelp = null;
        }

        public function handleModeratorCaution(_arg_1:String, _arg_2:String=""):void
        {
            showModerationMessage(_arg_1, _arg_2);
        }

        public function handleModeratorMessage(_arg_1:String, _arg_2:String=""):void
        {
            showModerationMessage(_arg_1, _arg_2, false);
        }

        public function handleUserBannedMessage(_arg_1:String):void
        {
            showModerationMessage(_arg_1, "");
        }

        private function showModerationMessage(_arg_1:String, _arg_2:String, _arg_3:Boolean=true):void
        {
            var message = _arg_1;
            var url = _arg_2;
            var showHabboWay = _arg_3;
            var p:RegExp = /\\r/g;
            message = message.replace(p, "\r");
            _windowManager.simpleAlert("", "${mod.alert.title}", message, "${mod.alert.link}", url, null, "illumina_alert_illustrations_frank_neutral_png", null, function ():void
            {
                if (((!(_habboHelp == null)) && (showHabboWay)))
                {
                    _habboHelp.showHabboWay();
                };
            });
        }

        public function handleHotelClosingMessage(_arg_1:int):void
        {
            _localization.registerParameter("opening.hours.shutdown", "m", String(_arg_1));
            _windowManager.simpleAlert("", "${opening.hours.title}", "${opening.hours.shutdown}");
        }

        public function handleHotelMaintenanceMessage(_arg_1:int, _arg_2:int):void
        {
            _localization.registerParameter("maintenance.shutdown", "m", String(_arg_1));
            _localization.registerParameter("maintenance.shutdown", "d", String(_arg_2));
            _windowManager.simpleAlert("", "${opening.hours.title}", "${maintenance.shutdown}");
        }

        public function handleHotelClosedMessage(_arg_1:int, _arg_2:int, _arg_3:Boolean):void
        {
            var openHour = _arg_1;
            var openMinute = _arg_2;
            var userThrownOutAtClose = _arg_3;
            if (userThrownOutAtClose)
            {
                _localization.registerParameter("opening.hours.disconnected", "h", getTimeZeroPadded(openHour));
                _localization.registerParameter("opening.hours.disconnected", "m", getTimeZeroPadded(openMinute));
                _windowManager.alert("${opening.hours.title}", "${opening.hours.disconnected}", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
                {
                    _arg_1.dispose();
                });
            }
            else
            {
                _localization.registerParameter("opening.hours.closed", "h", getTimeZeroPadded(openHour));
                _localization.registerParameter("opening.hours.closed", "m", getTimeZeroPadded(openMinute));
                _windowManager.alert("${opening.hours.title}", "${opening.hours.closed}", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
                {
                    _arg_1.dispose();
                });
            };
        }

        public function handleLoginFailedHotelClosedMessage(_arg_1:int, _arg_2:int):void
        {
            var openHour = _arg_1;
            var openMinute = _arg_2;
            _localization.registerParameter("opening.hours.disconnected", "h", getTimeZeroPadded(openHour));
            _localization.registerParameter("opening.hours.disconnected", "m", getTimeZeroPadded(openMinute));
            _windowManager.alert("${opening.hours.title}", "${opening.hours.disconnected}", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
            {
                _arg_1.dispose();
            });
        }


    }
}//package com.sulake.habbo.notifications.singular

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)



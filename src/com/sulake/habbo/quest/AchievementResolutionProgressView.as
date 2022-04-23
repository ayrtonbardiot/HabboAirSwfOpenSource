// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.quest.AchievementResolutionProgressView

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window.widgets._SafeStr_3314;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class AchievementResolutionProgressView implements _SafeStr_13 
    {

        private static const PROGRESSBAR_LEFT:String = "achieved_left";
        private static const PROGRESSBAR_MID:String = "achieved_mid";
        private static const PROGRESSBAR_RIGHT:String = "achieved_right";

        private var _SafeStr_6293:int;
        private var _SafeStr_4360:AchievementsResolutionController;
        private var _window:_SafeStr_3263;
        private var _stuffId:int;
        private var _SafeStr_6292:int;
        private var _SafeStr_4723:String;

        public function AchievementResolutionProgressView(_arg_1:AchievementsResolutionController)
        {
            _SafeStr_4360 = _arg_1;
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4360 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4360 == null);
        }

        public function get achievementId():int
        {
            return (_SafeStr_6292);
        }

        public function get stuffId():int
        {
            return (_stuffId);
        }

        public function get visible():Boolean
        {
            if (!_window)
            {
                return (false);
            };
            return (_window.visible);
        }

        public function show(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int):void
        {
            if (_window == null)
            {
                createWindow();
            };
            if (_arg_2 != _SafeStr_6292)
            {
                initializeWindow();
                _window.center();
            };
            _stuffId = _arg_1;
            _SafeStr_6292 = _arg_2;
            _SafeStr_4723 = _arg_3;
            setProgress(_arg_4, _arg_5);
            setBadge(_SafeStr_4723);
            setLocalizations();
            setCountdown(_arg_6);
            _window.visible = true;
        }

        private function setProgress(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Number = Math.min(1, (_arg_1 / _arg_2));
            if (_local_3 > 0)
            {
                _window.setVisibleChildren(true, ["achieved_left", "achieved_mid"]);
                _window.findChildByName("achieved_right").visible = (_local_3 == 1);
            };
            _window.findChildByName("achieved_mid").width = (_SafeStr_6293 * _local_3);
            _SafeStr_4360.questEngine.localization.registerParameter("resolution.progress.progress", "progress", _arg_1.toString());
            _SafeStr_4360.questEngine.localization.registerParameter("resolution.progress.progress", "total", _arg_2.toString());
        }

        private function setBadge(_arg_1:String):void
        {
            var _local_3:_SafeStr_3199 = (_window.findChildByName("achievement_badge") as _SafeStr_3199);
            var _local_2:_SafeStr_3349 = (_local_3.widget as _SafeStr_3349);
            IStaticBitmapWrapperWindow(_SafeStr_3133(_local_3.rootWindow).findChildByName("bitmap")).assetUri = "common_loading_icon";
            _local_2.badgeId = _arg_1;
            _local_3.visible = true;
        }

        private function setLocalizations():void
        {
            _window.findChildByName("achievement.name").caption = _SafeStr_4360.questEngine.localization.getBadgeName(_SafeStr_4723);
            _window.findChildByName("achievement.desc").caption = _SafeStr_4360.questEngine.localization.getBadgeDesc(_SafeStr_4723);
        }

        private function setCountdown(_arg_1:int):void
        {
            var _local_2:_SafeStr_3199 = _SafeStr_3199(_window.findChildByName("time_left_widget"));
            var _local_3:_SafeStr_3314 = _SafeStr_3314(_local_2.widget);
            _local_3.seconds = _arg_1;
            _local_3.running = true;
        }

        private function createWindow():void
        {
            _window = _SafeStr_3263(_SafeStr_4360.questEngine.getXmlWindow("AchievementResolutionProgress"));
            _window.findChildByTag("close").procedure = onWindowClose;
            _window.findChildByName("reset_button").procedure = onResetButton;
            _SafeStr_6293 = _window.findChildByName("achieved_mid").width;
        }

        private function initializeWindow():void
        {
            _window.center();
            _window.setVisibleChildren(false, ["achieved_left", "achieved_mid", "achieved_right"]);
        }

        public function close():void
        {
            if (_window)
            {
                _window.visible = false;
            };
        }

        private function onWindowClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                close();
            };
        }

        private function onResetButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_4360.resetResolution(_stuffId);
                close();
            };
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3314 = "_-j1a" (String#3394, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4723 = "_-41q" (String#3526, DoABC#4)
// _SafeStr_6292 = "_-Q18" (String#14298, DoABC#4)
// _SafeStr_6293 = "_-HZ" (String#18869, DoABC#4)


